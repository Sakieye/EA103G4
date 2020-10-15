package com.category.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.category.model.CategoryService;

@WebServlet("/CategoryManagement")
public class CategoryManagement extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryService categoryService = (CategoryService) getServletContext().getAttribute("categoryService");
		request.setAttribute("categories", categoryService.getAll());
		request.getRequestDispatcher("/back-end/jsp_BookManagement/CategoryManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryService categoryService = (CategoryService) getServletContext().getAttribute("categoryService");
		String categoryName = request.getParameter("categoryName").trim();
		categoryService.addCategory(categoryName);
		// 重新導回自己
		response.sendRedirect(request.getContextPath() + "/CategoryManagement"); 
		
	}
	
}
