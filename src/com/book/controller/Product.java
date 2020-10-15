package com.book.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Random;
import java.util.Set;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.math3.distribution.EnumeratedDistribution;
import org.apache.commons.math3.util.Pair;

import com.book.model.Book;
import com.book.model.BookService;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.Tuple;
import tools.CountComparator;
import tools.JedisUtil;

@WebServlet("/Product/*")
public class Product extends HttpServlet {
	private static final SimpleDateFormat DATE_FORMATTER = new SimpleDateFormat("yyyy-MM-dd");

	public Product() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 測試Redis瀏覽紀錄系統
		response.setContentType("text/html; charset=utf-8");

		BookService bookService = (BookService) getServletContext().getAttribute("bookService");
		String requestURI = request.getRequestURI();
		String bookID = requestURI.substring(requestURI.lastIndexOf('/') + 1, requestURI.lastIndexOf('/') + 13);
		Optional<Book> b = bookService.getByBookID(bookID);

		if (b.isPresent()) {
			// 取得Jedis連線資源
			JedisPool pool = JedisUtil.getJedisPool();
			Jedis jedis = pool.getResource();
			jedis.auth("123456");

			Book book = b.get();

			// 利用cookie取得/更新近期瀏覽書籍(30本)
			List<Book> recentViewedBooks = bookService
					.getByBookIDList(UpdateRecentViewedBooksCookie(bookID, request, response));

			// 利用近期瀏覽書籍(30本)計算出推薦書籍
			Set<Book> recommBooks = getRecommendedBooks(recentViewedBooks, bookService, jedis, bookID);

			// 瀏覽次數+1
			UpdateRedisViewCount(bookID, jedis);

			// ===測試用待刪
			PrintWriter out = response.getWriter();
			out.println("<h1>模擬商品頁面</h1>");
			out.println(requestURI);
			out.println("<h2>商品資訊</h2>");
			out.println(book);
			out.println("<h2>近期瀏覽書籍</h2>");
			recentViewedBooks.forEach(viewedBook -> out.println(viewedBook + "<br>"));
			out.println("<h2>推薦書籍</h2>");
			recommBooks.forEach(recommBook -> out.println(recommBook + "<br>"));
			// ===測試用待刪

			// 歸還連線資源到Jedis連線池
			jedis.close();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected Set<Book> getRecommendedBooks(List<Book> recentViewedBooks, BookService bookService, Jedis jedis,
			String thisBookID) {
		String thisCategoryID = bookService.getByBookID(thisBookID).get().getCategoryID();

		// 從cookie計算近期瀏覽記錄中占比最高的5個書籍類別(因傳入的近期瀏覽書籍可能是0~30本，favoriteCategoryIDs的可能長度為0~5)
		Map<String, Integer> map = new HashMap<String, Integer>();
		recentViewedBooks.forEach(viwedBook -> {
			String categoryID = viwedBook.getCategoryID();
			int count = map.containsKey(categoryID) ? map.get(categoryID) : 0;
			map.put(categoryID, count + 1);
		});

		List<Map.Entry<String, Integer>> favoriteCategoryIDs = CountComparator.entriesSortedByValues(map);
		if (favoriteCategoryIDs.size() > 5) {
			favoriteCategoryIDs = favoriteCategoryIDs.subList(0, 5);
		}

		if (favoriteCategoryIDs.size() == 0) {
			// 從商品詳情頁面URL取的bookID，並加入此categoryID，令favoriteCategoryIDs長度在1~5之間。
			Map.Entry<String, Integer> entry = new AbstractMap.SimpleEntry<String, Integer>(thisCategoryID, 1);
			favoriteCategoryIDs.add(entry);
		}

		int sumToday = 0;
		int sumYesterday = 0;
		String today = LocalDate.now().toString();
		String yesterday = DATE_FORMATTER.format(new Date(new Date().getTime() - 24 * 60 * 60 * 1000));

		// 計算今天或昨天的統計是否超過30筆
		for (Map.Entry<String, Integer> entry : favoriteCategoryIDs) {
			String categoryID = entry.getKey();
			StringBuilder keyName = new StringBuilder(categoryID).append(",").append(today).append("viewed");
			StringBuilder keyNameYesterday = new StringBuilder(categoryID).append(",").append(yesterday)
					.append("viewed");
			sumToday += jedis.zcard(keyName.toString());
			sumYesterday += jedis.zcard(keyNameYesterday.toString());

			if (sumToday >= 30 || sumYesterday >= 30) {
				break;
			}
		}

		Set<Book> recommBooks = new HashSet<Book>();
		Set<String> recommBookIDs = new HashSet<String>();
		List<Pair<String, Double>> bookWeights = new ArrayList<Pair<String, Double>>();

		for (Map.Entry<String, Integer> entry : favoriteCategoryIDs) {
			String categoryID = entry.getKey();
			double weight = entry.getValue();
			StringBuilder keyName = new StringBuilder(categoryID).append(",");

			// 預設用today當key(書籍數量必須超過30)，其次以昨日當key(須超過30本)，不然直接以該商品的categoryID隨機取書並回傳
			if (sumToday >= 30) {
				keyName.append(today).append("viewed");
			} else if (sumYesterday >= 30) {
				keyName.append(yesterday).append("viewed");
			} else {
				List<Book> recommBookList = bookService.getByCategoryID(thisCategoryID);

				if (recommBookList.size() >= 30) {
					Random random = new Random();
					while (recommBooks.size() < 30) {
						recommBooks.add(recommBookList.get(random.nextInt(recommBookList.size())));
					}
				} else {
					recommBooks.addAll(recommBookList);
				}
				return recommBooks;
			}

			// 查詢書籍統計資料並計算權重(只取熱門前200本)
			Set<Tuple> res;
			if (jedis.zcard(keyName.toString()) >= 200) {
				res = jedis.zrangeWithScores(keyName.toString(), -200, -1);
			} else {
				res = jedis.zrangeWithScores(keyName.toString(), 0, -1);
			}

			res.forEach(tuple -> {
				String bookID = tuple.getElement();
				double viewedCount = tuple.getScore();
				bookWeights.add(new Pair<String, Double>(bookID, viewedCount * weight));
			});
		}

		// 使用apache.commons.math3.distribution.EnumeratedDistribution.EnumeratedDistribution對有權重的bookWeights抽樣
		Object[] objs = new EnumeratedDistribution<String>(bookWeights).sample(30);

		for (Object bookID : objs) {
			recommBookIDs.add(bookID.toString());
		}

		// 觀察權重分布
//		favoriteCategoryIDs.forEach(entry -> System.out.println(entry));

		recommBooks.addAll(bookService.getByBookIDList(new ArrayList<String>(recommBookIDs)));
		return recommBooks;
	}

	private void UpdateRedisViewCount(String bookID, Jedis jedis) {
		// 本書當日瀏覽次數+1，key為當天日期 + "viwed"，score為當天被瀏覽次數，value為bookID。
		// Redis過期是以key為單位移除資料，為實現動態的7天統計，key設定和當天日期有關，而另一邊需設計排程器，每天計算仍有效的(7天內)瀏覽次數。
		LocalDate date = LocalDate.now();
		long current = System.currentTimeMillis();// 當前時間毫秒數
		long zero = current / (1000 * 3600 * 24) * (1000 * 3600 * 24) - TimeZone.getDefault().getRawOffset();// 今天零點零分零秒的毫秒數
		jedis.zincrby(date + "viewed", 1, bookID);
		jedis.expire(date + "viewed", 7 * 24 * 60 * 60 - (int) ((current - zero) / 1000)); // 7天過期
	}

	private List<String> UpdateRecentViewedBooksCookie(String bookID, HttpServletRequest request,
			HttpServletResponse response) {
		Cookie recentViewedBooksCookie = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if ("recentViewedBookIDs".equals(cookie.getName())) {
					recentViewedBooksCookie = cookie;
				}
			}
		}

		String recentViewedBookIDs = UpdateRecentViewedBookIDs(bookID, recentViewedBooksCookie);
		List<String> bookIDs = Arrays.asList(recentViewedBookIDs.split("_"));

		if (recentViewedBooksCookie != null) {
			recentViewedBooksCookie.setValue(recentViewedBookIDs);
		} else {
			recentViewedBooksCookie = new Cookie("recentViewedBookIDs", recentViewedBookIDs);
		}
		recentViewedBooksCookie.setMaxAge(60 * 60 * 24 * 365); // 365天效期cookie
		response.addCookie(recentViewedBooksCookie);

		return bookIDs;
	}

	private String UpdateRecentViewedBookIDs(String bookID, Cookie cookie) {
		LinkedList<String> bookIDList = new LinkedList<String>();
		StringBuffer recentViewedBookIDs = new StringBuffer();

		if (cookie != null) {
			String bookIDs = cookie.getValue();
			if (bookIDs != null) {
				bookIDList = new LinkedList<String>(Arrays.asList(bookIDs.split("_")));
			}

			// 只保留30個近期瀏覽記錄
			if (bookIDList.size() < 30) {
				// 去除重複
				if (bookIDList.contains(bookID)) {
					bookIDList.remove(bookID);
				}
			} else {
				// 去除重複
				if (bookIDList.contains(bookID)) {
					bookIDList.remove(bookID);
				} else {
					bookIDList.removeLast();
				}
			}
		}

		bookIDList.addFirst(bookID);
		bookIDList.forEach(viewedBookID -> {
			recentViewedBookIDs.append(viewedBookID).append("_");
		});

		return recentViewedBookIDs.toString();
	}
}
