package com.order.controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.detail.model.DetailVO;
import com.order.model.*;


public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderServlet() {}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		

		
		
//《Insert》		
		if ("insert".equals(action)) { // 來自addEmp.jsp的請求  
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String mem_id = req.getParameter("mem_id");
				if (mem_id == null || mem_id.trim().length() == 0) {
					errorMsgs.add("會員ID: 請勿空白");
	            }
				String rec_name = req.getParameter("rec_name").trim();
				if (rec_name == null || rec_name.trim().length() == 0) {
					errorMsgs.add("收件人請勿空白");
				}
				
				String rec_tel = null;
				try {
					rec_tel = new String(req.getParameter("rec_tel").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("收件人電話請填數字.");
				}
				String rec_add = req.getParameter("rec_add").trim();
				if (rec_add == null || rec_add.trim().length() == 0) {
					errorMsgs.add("收件人地址請勿空白.");
				}
				
				Integer order_qty = null;
				try {
					order_qty = new Integer(req.getParameter("order_qty").trim());
				} catch (NumberFormatException e) {
					order_qty = 1;
					errorMsgs.add("數量請填數字(1-45).");
				}
				
				Integer order_total = null;
				try {
					order_total = new Integer(req.getParameter("order_total").trim());
				} catch (NumberFormatException e) {
					order_total = 1;
					errorMsgs.add("金額請填數字(1-45).");
				}
				
				Integer order_pay = null;
				try {
					order_pay = new Integer(req.getParameter("order_pay").trim());
				} catch (NumberFormatException e) {
					order_pay = 1;
					errorMsgs.add("付款方式請填數字(1-信用卡 2-貨到付款).");
				}
				
				Integer delivery = null;
				try {
					delivery = new Integer(req.getParameter("delivery").trim());
				} catch (NumberFormatException e) {
					delivery = 1;
					errorMsgs.add("訂單狀態請填數字(1-訂單成立 2-已出貨).");
				}
				
				Integer get_bonus = null;
				try {
					get_bonus = new Integer(req.getParameter("get_bonus").trim());
				} catch (NumberFormatException e) {
					get_bonus = 1;
					errorMsgs.add("獲得紅利請填數字(1-10).");
				}
				
				Integer use_bonus = null;
				try {
					use_bonus = new Integer(req.getParameter("use_bonus").trim());
				} catch (NumberFormatException e) {
					use_bonus = 1;
					errorMsgs.add("紅利折抵請填數字(1-10).");
				}
				
				String mem_note = null;
				try {
					mem_note = new String(req.getParameter("mem_note").trim());
				} catch (NumberFormatException e) {
					errorMsgs.add("備註請填文字.");
				}
				
				OrderVO odVO = new OrderVO();
				odVO.setMem_id(mem_id);
				odVO.setRec_name(rec_name);
				odVO.setRec_tel(rec_tel);
				odVO.setRec_add(rec_add);
				odVO.setOrder_qty(order_qty);
				odVO.setOrder_total(order_total);
				odVO.setOrder_pay(order_pay);
				odVO.setDelivery(delivery);
				odVO.setGet_bonus(get_bonus);
				odVO.setUse_bonus(use_bonus);
				odVO.setMem_note(mem_note);
				

//				Book bookVO = new Book();
//				bookVO.getBookID();
//				
//				List<DetailVO> dtList = new ArrayList<DetailVO>();
//				dtList.add(dtVO);
			
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("odVO", odVO); 
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/order/create_order.jsp");
					failureView.forward(req, res);
					return;
				}
//				System.out.println("請求資料...OK!");
				/***************************2.開始新增資料***************************************/
				OrderService odSvc = new OrderService();
				
				odVO = odSvc.createOd(mem_id, rec_name, rec_tel, rec_add,
						order_qty, order_total, order_pay,  delivery, get_bonus, use_bonus, 
						mem_note);
//				System.out.println("新增資料...OK!");
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/back-end/order/listAll_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);				
//				System.out.println("轉交資料...OK!");
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				System.out.println("其他Exception"+e.getMessage());
				e.printStackTrace();
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/create_order.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
//《Select single》
				if ("selOneOd".equals(action)) { // 來自select_page.jsp的請求

					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);

					try {
						/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
						String str = req.getParameter("order_id");
						if (str == null || (str.trim()).length() == 0) {
							errorMsgs.add("請輸入訂單編號");
						}
						if (!errorMsgs.isEmpty()) {
							RequestDispatcher failureView = req
									.getRequestDispatcher("/back-end/order/select_order.jsp");
							failureView.forward(req, res);
							return;
						}
						String order_id = null;
						try {
							order_id = str;
						} catch (Exception e) {
							errorMsgs.add("編號格式不正確");
						}
						if (!errorMsgs.isEmpty()) {
							RequestDispatcher failureView = req
									.getRequestDispatcher("/back-end/order/select_order.jsp");
							failureView.forward(req, res);
							return;
						}
				System.out.println("單號驗證...OK!");
				/***************************2.開始查詢資料*****************************************/
				OrderService odSvc = new OrderService();
				OrderVO odVO = odSvc.getOneOd(order_id);
				if (odVO == null) {
					errorMsgs.add("查無資料");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/order/select_order.jsp");
					failureView.forward(req, res);
					return;
				}
//				System.out.println("取得資料...OK!");
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("odVO", odVO);
				String url = "/back-end/order/listOne_order.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
//				System.out.println("資料轉交...OK!");
				/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/select_order.jsp");
				failureView.forward(req, res);
				}
			}
				
//《Update》
				if ("getupdate".equals(action)) { 

					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);
					try {
						String order_id = req.getParameter("order_id");
//						System.out.println(order_id);
						
						OrderService odSvc = new OrderService();
						OrderVO odVO = odSvc.getOneOd(order_id);
						req.setAttribute("odVO", odVO);
						RequestDispatcher successView = 
								req.getRequestDispatcher("/back-end/order/update_order.jsp");
						successView.forward(req, res);
					} catch (Exception e) {
						errorMsgs.add("無法取得資料："+e.getMessage());
						RequestDispatcher failView = 
								req.getRequestDispatcher("/back-end/order/listAll_order.jsp");
						failView.forward(req, res);
					}
				}
				
				
				if("update".equals(action)) {
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs",errorMsgs);
					
					try {
					String order_id = req.getParameter("order_id");
					String rec_name = req.getParameter("rec_name");
					String name_Reg = "^[\\u4e00-\\u9fa5]+$|^[a-zA-Z\\s]+$";
					if(rec_name==null || rec_name.trim().length()==0) {
						errorMsgs.add("錯誤：收件人姓名空白");
					}else if(!rec_name.trim().matches(name_Reg)) {
						errorMsgs.add("錯誤：收件人姓名只能是中、英文字");
					} 
					
					String rec_tel = req.getParameter("rec_tel");
					String tel_Reg = "^[09]{2}[0-9]{8}$";
					if(rec_tel==null || rec_tel.trim().length()==0) {
						errorMsgs.add("錯誤：收件人電話空白");
					}else if(!rec_tel.trim().matches(tel_Reg)) {
						errorMsgs.add("錯誤：收件人電話有誤");
					}
					String rec_add = req.getParameter("rec_add");
					if(rec_add==null || rec_add.trim().length()==0) {
						errorMsgs.add("錯誤：收件人地址空白");
					}
					
					Integer order_pay = new Integer(req.getParameter("order_pay").trim());
					Integer delivery = new Integer(req.getParameter("delivery").trim());		
					Integer order_status = new Integer(req.getParameter("order_status").trim());
	
					String mem_note = req.getParameter("mem_note");
					
					
					OrderVO odVO = new OrderVO();
					odVO.setOrder_id(order_id);
					odVO.setRec_name(rec_name);
					odVO.setRec_tel(rec_tel);
					odVO.setRec_add(rec_add);
					odVO.setOrder_pay(order_pay);
					odVO.setDelivery(delivery);
					odVO.setOrder_status(order_status);
					odVO.setMem_note(mem_note);
					
					if(!errorMsgs.isEmpty()) {
						req.setAttribute("odVO", odVO);	
						RequestDispatcher failView = 
								req.getRequestDispatcher("/back-end/order/update_order.jsp");
						failView.forward(req, res);
						return;
					}
					
					OrderService odSvc = new OrderService();
					odVO = odSvc.updateOd(order_id, rec_name, rec_tel, rec_add, order_pay, delivery, order_status, mem_note);
					
					req.setAttribute("odVO", odVO);	
					RequestDispatcher successView = 
							req.getRequestDispatcher("/back-end/order/listAll_order.jsp");
					successView.forward(req, res);
					} catch(Exception e) {
						errorMsgs.add("無法取得資料："+e.getMessage());
						RequestDispatcher failView = 
								req.getRequestDispatcher("/back-end/order/update_order.jsp");
						failView.forward(req, res);
					}
					
					
				}
				
				
//《Cancel》
				
				if ("getcancel".equals(action)) { 

					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);
					try {
						String order_id = req.getParameter("order_id");
//						System.out.println(order_id);
						
						OrderService odSvc = new OrderService();
						OrderVO odVO = odSvc.getOneOd(order_id);
						req.setAttribute("odVO", odVO);
						RequestDispatcher successView = 
								req.getRequestDispatcher("/back-end/order/cancel_order.jsp");
						successView.forward(req, res);
					} catch (Exception e) {
						errorMsgs.add("無法取得資料："+e.getMessage());
						RequestDispatcher failView = 
								req.getRequestDispatcher("/back-end/order/listAll_order.jsp");
						failView.forward(req, res);
					}
				}
				
	
				if(action.equals("cancel")) {
					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs",errorMsgs);
					
					try {
					String order_id = req.getParameter("order_id");
					
					OrderService odSvc = new OrderService();
					odSvc.cancel(order_id);
					
					RequestDispatcher successView = 
							req.getRequestDispatcher("/back-end/order/listAll_order.jsp");
					successView.forward(req, res);
					} catch(Exception e) {
						errorMsgs.add("無法取得資料："+e.getMessage());
						RequestDispatcher failView = 
								req.getRequestDispatcher("/back-end/order/update_order.jsp");
						failView.forward(req, res);
					}
					
					
				}
				
				
				
				
				
				
	}

}
