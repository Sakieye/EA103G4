package com.promo.controller;

import java.io.IOException;
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
import com.promo.model.*;

@WebServlet("/PromoManagement")
public class PromoManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String whichPage = request.getParameter("whichPage");
		String showAll = request.getParameter("showAll");

		// 換頁操作(session中保有前次的查詢結果和本次請求第幾頁)
		if (session != null) {
			if (session.getAttribute("promotions") != null && (whichPage != null || showAll != null)) {
				request.setAttribute("whichPage", whichPage);
				request.setAttribute("showAll", showAll);
				request.setAttribute("promotions", session.getAttribute("promotions"));
			}
		}
		request.getRequestDispatcher("/back-end/jsp_PromoManagement/PromoManagement.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String whichPage = request.getParameter("whichPage");
		String showAll = request.getParameter("showAll");
		HttpSession session = request.getSession();

		// 使用搜尋
		if ("getAdvSearch".equals(request.getParameter("action"))) {
			PromoService promoService = (PromoService) getServletContext().getAttribute("promoService");
			Map<String, String> map = new HashMap<String, String>();
			map.put("promoName", request.getParameter("promoName").trim());
			map.put("promoStartTime", request.getParameter("promoStartTime"));
			map.put("promoEndTime", request.getParameter("promoEndTime"));
			System.out.println(request.getParameter("promoEndTime"));
			List<Promo> promotions = promoService.getByAdvSearch(map);
			request.setAttribute("promotions", promotions);
		}

		request.getRequestDispatcher("/back-end/jsp_PromoManagement/PromoManagement.jsp").forward(request, response);
	}

}
