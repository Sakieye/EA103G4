package com.bookpic.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookpic.model.BookPicService;
import com.bookpic.model.BookPicture;

@WebServlet("/ShowBookPic")
public class ShowBookPic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("image/*");
		String bookID = request.getParameter("bookID");
		String bookPicName = request.getParameter("bookPicName");
		
		if (bookID != null && bookPicName != null) {
			BookPicService bookPicService = (BookPicService) getServletContext().getAttribute("bookPicService");
			Optional<BookPicture> bookPic = bookPicService.getByBookIDAndBookPicName(bookID, bookPicName);
			if (bookPic.isPresent()) {
				OutputStream os = response.getOutputStream();
				os.write(bookPic.get().getBookPic());
			}
		}
		
		// 只請求封面圖
		if (bookID != null && bookPicName == null) {
			BookPicService bookPicService = (BookPicService) getServletContext().getAttribute("bookPicService");
			Optional<BookPicture> bookPic = bookPicService.getFirstPicByBookID(bookID);
			if (bookPic.isPresent()) {
				OutputStream os = response.getOutputStream();
				os.write(bookPic.get().getBookPic());
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
