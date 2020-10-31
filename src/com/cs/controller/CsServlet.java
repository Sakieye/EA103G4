package com.cs.controller;

import java.io.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.cs.model.CsService;
import com.cs.model.CsVO;


public class CsServlet extends HttpServlet {
	
 
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("insertCs".equals(action)) {
			//收集錯誤訊息
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {	
				//接收訊息信箱
				String cs_Email = req.getParameter("cs_Email");
				//接收訊息電話
				String cs_Tel = req.getParameter("cs_Tel");
				//接收訊息主旨
				String cs_Subject = req.getParameter("cs_Subject");
				//接收訊息內容
				String cs_Message = req.getParameter("cs_Message");
				//設定訊息狀態
				Integer cs_isSend = new Integer(0);
				
				//設定VO
				CsVO csVO = new CsVO();
				csVO.setCs_Email(cs_Email);
				csVO.setCs_Tel(cs_Tel);
				csVO.setCs_Subject(cs_Subject);
				csVO.setCs_Message(cs_Message);
				csVO.setCs_isSend(cs_isSend);
				
				//開始新增資料
				CsService csSvc = new CsService();
				csVO = csSvc.addCs(cs_Email, cs_Tel, cs_Subject, cs_Message, cs_isSend);
						
			} catch (RuntimeException e) {
				errorMsgs.add("傳送失敗:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/cs/listAllCs.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if("deleteCs".equals(action)) {
			
			//收集錯誤訊息
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				//接收請求參數
				String cs_ID = req.getParameter("cs_ID");
				//開始刪除資料
				CsService csSvc = new CsService();
				csSvc.deleteCs(cs_ID);
				
				//刪除成功,開始轉交
				String url = "/back-end/cs/csindex.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/cs/csindex.jsp");
				successView.forward(req, res);		
			}			
		}				
	}

}
