package com.Fa.controller;

import java.io.*;

import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.Fa.model.*;
import com.Fm.model.*;
import com.mem.model.*;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class FaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		// 單個文章的頁面
		if("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String faId = req.getParameter("faId");
			
				/***************************2.開始查詢資料*****************************************/
				FaService faSvc = new FaService();
				FaVO faVO = faSvc.getOneFa(faId);
				
				int faViews = faVO.getFaViews() + 1;
				faSvc.addFaViews(faId, faViews);

			 	FmService fmSvc = new FmService();
			 	List<FmVO> list = fmSvc.getOneFAFm(faVO.getFaId());
				
			 	
			 	MemService memSvc = new MemService();
			 	MemVO memVO = memSvc.getOneMem(faVO.getMemId());
			 	
			 	
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/forum/forumIndex.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("faVO", faVO);
				req.setAttribute("list", list);
				req.setAttribute("memVO", memVO);
				
				String url = "/front-end/forum/forumPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/forum/forumIndex.jsp");
				failureView.forward(req, res);
			} 
			
		}
		
		//新增文章
		if ("insert".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String memId = req.getParameter("memId");
				if (memId == null || memId.trim().length() == 0) {
					errorMsgs.add("會員勿空白!!");
				}

				String faTopic = req.getParameter("faTopic").trim();
				if (faTopic == null || faTopic.trim().length() == 0) {
					errorMsgs.add("主題勿空白!!");
				}

				String faContent = req.getParameter("faContent");
				if (faContent == null || faContent.trim().length() == 0) {
					errorMsgs.add("內容勿空白!!");
				}

//				Part pfaPic = req.getPart("faPic");	
//				InputStream in = pfaPic.getInputStream();
//				byte[] faPic = new byte[in.available()];
//				in.read(faPic);
//				in.close();

				FaVO faVO = new FaVO();

				faVO.setMemId(memId);
				faVO.setFaTopic(faTopic);
				faVO.setFaContent(faContent);

				if (!errorMsgs.isEmpty()) {

					req.setAttribute("faVO", faVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/forum/addFaPage.jsp");
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.新增資料 ***************************************/
				FaService faSvc = new FaService();
				faVO = faSvc.addFa(memId, faTopic, faContent);

				req.setAttribute("faVO", faVO);
				String url = "/front-end/forum/forumIndex.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

			} catch (Exception e) {
				errorMsgs.add("無法新增文章"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/forum/addFaPage.jsp");
				failureView.forward(req, res);
			}
		}
		
		//取得文章去修改
		if("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.接收請求參數****************************************/
				String faId = new String(req.getParameter("faId"));
				
				/***************************2.開始查詢資料****************************************/
				FaService faSvc = new FaService();
				FaVO faVO = faSvc.getOneFa(faId);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("faVO", faVO);
				String url = "/front-end/forum/updateFaPage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/forum/memberCenter_forum.jsp");
				failureView.forward(req, res);
			}
		}

		//修改文章
		if ("update".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String faId = new String(req.getParameter("faId"));
				
				String faTopic = req.getParameter("faTopic").trim();
				if (faTopic == null || faTopic.trim().length() == 0) {
					errorMsgs.add("主題勿空白!!");
				}
				
				String faContent = req.getParameter("faContent").trim();
				if (faContent == null || faContent.trim().length() == 0) {
					errorMsgs.add("內容勿空白!!");
				}
			
				
				
			
				FaVO faVO = new FaVO();

				faVO.setFaTopic(faTopic);
				faVO.setFaContent(faContent);
				faVO.setFaId(faId);
			
				
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("faVO", faVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/forum/memberCenter_forum.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/*************************** 2.新增資料 ***************************************/
				FaService faSvc = new FaService();
				faVO = faSvc.updateFa(faTopic, faContent,faId);
				
				req.setAttribute("faVO", faVO);
				String url = "/front-end/forum/memberCenter_forum.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改文章失敗" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/forum/memberCenter_forum.jsp");
				failureView.forward(req, res);
			}

		}
		
		//下架文章
		if("delete".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String faId = new String(req.getParameter("faId"));
				
				FaService faSvc = new FaService();
				faSvc.deleteFa(faId);
				
				String url = "/front-end/forum/memberCenter_forum.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/forum/memberCenter_forum.jsp");
				failureView.forward(req, res);
			}
		}
		
		//模糊搜尋
		if("search".equals(action)) {
			List<FaVO> list = new ArrayList<FaVO>();
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String faTopic = new String(req.getParameter("faTopic"));
				if (faTopic == null || faTopic.trim().length() == 0) {
					errorMsgs.add("請輸入搜尋內容!");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/forum/forumIndex.jsp");
					failureView.forward(req, res);
					return;
				}
				
				FaService faSvc = new FaService();
				HttpSession session = req.getSession();
				list = faSvc.search(faTopic);
				session.setAttribute("list", list);
				
				String url = "/front-end/forum/forumIndex_search.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("無法取得要搜尋的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/forum/forumIndex.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		
		

	}



}
