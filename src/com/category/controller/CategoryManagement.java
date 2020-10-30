package com.category.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.category.model.Category;
import com.category.model.CategoryService;

import tools.StrUtil;

@WebServlet("/CategoryManagement")
public class CategoryManagement extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryService categoryService = (CategoryService) getServletContext().getAttribute("categoryService");
		List<Category> categories = categoryService.getAll();
		List<String> categoryIDs = new ArrayList<String>();
		categories.forEach(cat -> categoryIDs.add(cat.getCategoryID()));

		request.setAttribute("categories", categories);
		request.setAttribute("categoryCountMap", categoryService.getBookNumByCategoryIDs(categoryIDs));
		request.getRequestDispatcher("/back-end/jsp_BookManagement/CategoryManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryService categoryService = (CategoryService) getServletContext().getAttribute("categoryService");
		String categoryName = StrUtil.tryToTrim(request.getParameter("categoryName"));
		categoryService.addCategory(categoryName);
		// 重新導回自己
		response.sendRedirect(request.getContextPath() + "/CategoryManagement");

	}

}
