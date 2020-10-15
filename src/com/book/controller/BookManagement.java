package com.book.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.book.model.Book;
import com.book.model.BookService;
import com.category.model.Category;
import com.category.model.CategoryService;

@WebServlet("/BookManagement")
public class BookManagement extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/back-end/jsp_BookManagement/BookManagement.jsp";
		String whichPage = request.getParameter("whichPage");
		String showAll = request.getParameter("showAll");
		String isSold = request.getParameter("isSold");
		HttpSession session = request.getSession();
		CategoryService categoryService = (CategoryService) getServletContext().getAttribute("categoryService");
        List<Category> categories = categoryService.getAll();
        request.setAttribute("categories", categories);
		
		// 使用搜尋
		if ("getAdvSearch".equals(request.getParameter("action"))) {
			BookService bookService = (BookService) getServletContext().getAttribute("bookService");
			Map<String, String> map = new HashMap<String, String>();
			map.put("bookName", request.getParameter("bookName").trim());
			map.put("author", request.getParameter("author").trim());
			map.put("publisherName", request.getParameter("publisherName").trim());
			map.put("isbn", request.getParameter("isbn").trim());
			map.put("salePriceMin", request.getParameter("realPriceMin"));
			map.put("salePriceMax", request.getParameter("realPriceMax"));
			map.put("discountMin", request.getParameter("discountMin"));
			map.put("discountMax", request.getParameter("discountMax"));
			map.put("isSold", request.getParameter("isSold"));
			map.put("publicationDateMin", request.getParameter("publicationDateMin"));
			map.put("publicationDateMax", request.getParameter("publicationDateMax"));
			map.put("categoryID", request.getParameter("categoryID"));
			List<Book> books = bookService.getByAdvSearch(map);

			request.setAttribute("books", books);
		}

		// 換頁操作(session中保有前次的查詢結果和本次請求第幾頁)
		if (session != null) {
			if (session.getAttribute("books") != null && (whichPage != null || showAll != null)) {
				request.setAttribute("books", session.getAttribute("books"));
				request.setAttribute("whichPage", whichPage);
				request.setAttribute("showAll", showAll);
			}
		}

		// 上下架操作
		if ("0".equals(isSold) || "1".equals(isSold)) {
			String bookList = request.getParameter("bookList");
			if (bookList != null) {
				List<String> bookIDs = Arrays.asList(bookList.split(","));
				BookService bookService = (BookService) getServletContext().getAttribute("bookService");
				bookService.updateBookIsSoldBatch(bookIDs, Integer.parseInt(isSold));
			}
		}

		request.getRequestDispatcher(url).forward(request, response);
	}

}
