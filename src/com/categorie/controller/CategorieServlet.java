package com.categorie.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.categorie.model.*;


public class CategorieServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("lc_class_id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入類別編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/categorie/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String lc_class_id = null;
				try {
					lc_class_id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("類別編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/categorie/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				CategorieService categorieService = new CategorieService();
				CategorieVO categorieVO = categorieService.getOneCategorie(lc_class_id);
				if (categorieVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/categorie/select_page.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("categorieVO", categorieVO); // 資料庫取出的categorieVO物件,存入req
				String url = "/categorie/listOneCategorie.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneCategorie.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/categorie/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllCategorie.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String lc_class_id = new String(req.getParameter("lc_class_id"));
				
				/***************************2.開始查詢資料****************************************/
				CategorieService categorieService = new CategorieService();
				CategorieVO categorieVO = categorieService.getOneCategorie(lc_class_id);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("categorieVO", categorieVO);         // 資料庫取出的categorieVO物件,存入req
				String url = "/categorie/update_categorie_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_categorie_input.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/categorie/listAllCategorie.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自update_categorie_input.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String lc_class_id = new String(req.getParameter("lc_class_id").trim());
				
				String lc_class_name = req.getParameter("lc_class_name");
				String lc_class_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (lc_class_name == null || lc_class_name.trim().length() == 0) {
					errorMsgs.add("類別名稱: 請勿空白");
				} else if(!lc_class_name.trim().matches(lc_class_nameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("類別名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				
				CategorieVO categorieVO = new CategorieVO();
				categorieVO.setLc_class_id(lc_class_id);
				categorieVO.setLc_class_name(lc_class_name);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("categorieVO", categorieVO); // 含有輸入格式錯誤的categorieVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/categorie/update_categorie_input.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				CategorieService categorieService = new CategorieService();
				categorieVO = categorieService.updateCategorie(lc_class_id, lc_class_name);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("categorieVO", categorieVO); // 資料庫update成功後,正確的的categorieVO物件,存入req
				String url = "/categorie/listOneCategorie.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneCategorie.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/categorie/update_categorie_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自addCategorie.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String lc_class_name = req.getParameter("lc_class_name");
				String lc_class_nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (lc_class_name == null || lc_class_name.trim().length() == 0) {
					errorMsgs.add("類別名稱: 請勿空白");
				} else if(!lc_class_name.trim().matches(lc_class_nameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("類別名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }

				CategorieVO categorieVO = new CategorieVO();
				categorieVO.setLc_class_name(lc_class_name);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("categorieVO", categorieVO); // 含有輸入格式錯誤的categorieVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/categorie/addCategorie.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				CategorieService categorieService = new CategorieService();
				categorieVO = categorieService.addCategorie(lc_class_name);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/categorie/listAllCategorie.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllCategorie.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/categorie/addCategorie.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // 來自listAllCategorie.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String lc_class_id = new String(req.getParameter("lc_class_id"));
				
				/***************************2.開始刪除資料***************************************/
				CategorieService categorieService = new CategorieService();
				categorieService.deleteCategorie(lc_class_id);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/categorie/listAllCategorie.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/categorie/listAllCategorie.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
