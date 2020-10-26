package com.rev.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.rev.model.RevService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)

@WebServlet("/rev/rev.do")
public class RevServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("insert".equals(action)) {
			String revContent = req.getParameter("revContent").trim();
		
			String memId = req.getParameter("memId");
		
			String bookId = req.getParameter("bookId");
	
			Integer rating = new Integer(req.getParameter("rating"));
			
			RevService revSvc = new RevService();
			revSvc.addRev(revContent, memId, bookId, rating);
			
			
			RequestDispatcher successView = req.getRequestDispatcher("/front-end/review_record/test.jsp");
			successView.forward(req, res);
		}
	}

}
