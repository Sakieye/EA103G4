package com.Follow.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Follow.model.*;


@WebServlet("/FollowServlet")
public class FollowServlet extends HttpServlet {
 
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if("Subscribe".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String memId = req.getParameter("memId");
			// memId 要改取session,若沒有取到session 要登入
			
			String aMemId = req.getParameter("aMemId");
			
			FollowVO followVO = new FollowVO();
			followVO.setaMemId(aMemId);
			followVO.setMemId(memId);
			
			FollowService followSvc = new FollowService();
			followSvc.subscribe(memId, aMemId);
			
		}
		
	}

}
