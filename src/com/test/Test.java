package com.test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.Set;

import javax.naming.NamingException;
import javax.sql.DataSource;

import com.book.model.Book;
import com.book.model.BookDAO;
import com.book.model.BookDAOImpl;
import com.book.model.BookService;
import com.category.model.CategoryDAO;
import com.category.model.CategoryDAOImpl;
import com.category.model.CategoryService;
import com.promo.model.Promo;
import com.promo.model.PromoDAO;
import com.promo.model.PromoDAOImpl;
import com.promo.model.PromoService;
import com.promodetail.model.PromoDetailDAO;
import com.promodetail.model.PromoDetailDAOImpl;
import com.promodetail.model.PromoDetailService;

import oracle.jdbc.pool.OracleDataSource;

public class Test {

	public static void main(String[] args) throws NamingException, SQLException {
		OracleDataSource ds;

		ds = new OracleDataSource();
		ds.setDriverType("thin");
		ds.setServerName("localhost");
		ds.setPortNumber(1521);
		ds.setDatabaseName("XE"); // Oracle SID
		ds.setUser("BOOKSHOP");
		ds.setPassword("123456");
		DataSource dataSource = (DataSource) ds;
		BookDAO bookDAO = new BookDAOImpl(dataSource);
		BookService bookService = new BookService(bookDAO);

		CategoryDAO categoryDAO = new CategoryDAOImpl(dataSource);
		CategoryService categoryService = new CategoryService(categoryDAO);

		PromoDAO promoDAO = new PromoDAOImpl(dataSource);
		PromoService promoService = new PromoService(promoDAO);

		PromoDetailDAO promoDetailDAO = new PromoDetailDAOImpl(dataSource);
		PromoDetailService promoDetailService = new PromoDetailService(promoDetailDAO);
		// =====
		int num = 30;
		Set<String> bookIDSet = new HashSet<String>();
		List<String> bookIDs = new ArrayList<String>();
		List<Book> books = new ArrayList<Book>();
		List<Promo> effPromos = new ArrayList<Promo>();


		promoService.getValidPromos().forEach(promo -> {
			effPromos.add(promo);
		});

		Promo randPromo = null;
		// 隨機選一個促銷事件，並從effPromos移除。但當選擇的randPromo對應promoDetails數量 < num，持續選擇別的Promo並加入bookIDs
		while (bookIDSet.size() < num && (randPromo = getRandPromo(effPromos)) != null) {
			promoDetailService.getByPromoID(randPromo.getPromoID()).forEach(pd -> {
				bookIDSet.add(pd.getBookID());
			});
		}
		
		bookIDs.addAll(bookIDSet);
		// 脫離迴圈可能是bookIDs足夠或沒有effPromos了，故需判斷bookIDs長度
		if (bookIDs.size() > num) {
			bookIDs = bookIDs.subList(0, num);
		}

		books.addAll(bookService.getByBookIDList(new ArrayList<String>(bookIDs)));
	}

	private static Promo getRandPromo(List<Promo> promos) {
		Promo randPromo = null;

		if (promos.size() > 0) {
			int randNum = new Random().nextInt(promos.size());
			randPromo = promos.get(randNum);
			promos.remove(randNum);
		}

		return randPromo;
	}
}
