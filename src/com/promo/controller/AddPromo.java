package com.promo.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.promo.model.Promo;
import com.promo.model.PromoService;

import tools.StrToTimestamp;

@WebServlet("/AddPromo")
public class AddPromo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/back-end/jsp_PromoManagement/AddPromo.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getContextPath() + "/PromoManagement";
		PromoService promoService = (PromoService) getServletContext().getAttribute("promoService");
		String promoName = request.getParameter("promoName").trim();
		String promoStartTimeStr = request.getParameter("promoStartTime");
		String promoEndTimeStr = request.getParameter("promoEndTime");

		// 處理JS傳來的時間格式
		if (promoStartTimeStr != null && promoEndTimeStr != null
				&& !promoService.getByPromoNameUnique(promoName).isPresent()) {
			Timestamp promoStartTime = StrToTimestamp.convert(promoStartTimeStr);
			Timestamp promoEndTime = StrToTimestamp.convert(promoEndTimeStr);
			promoService.addPromo(promoName, promoStartTime, promoEndTime);
		}
		
		Optional<Promo> newPromo = promoService.getByPromoNameUnique(promoName);
		
		if (newPromo.isPresent()) {
			url = request.getContextPath() + "/AddPromoDetails?promoID=" + newPromo.get().getPromoID();
		}

		response.sendRedirect(url);
	}

}
