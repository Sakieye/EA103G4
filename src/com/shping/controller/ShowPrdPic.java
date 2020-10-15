package com.shping.controller;

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

@WebServlet("/ShowPrdPic")
public class ShowPrdPic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("image/*");
		String bookID = req.getParameter("bookID");

		if (bookID != null) {
			BookPicService bookPicService = (BookPicService) getServletContext().getAttribute("bookPicService");
			Optional<BookPicture> bookPic = bookPicService.getFirstPicByBookID(bookID);
			if (bookPic.isPresent()) {
				OutputStream os = res.getOutputStream();
				os.write(bookPic.get().getBookPic());
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
