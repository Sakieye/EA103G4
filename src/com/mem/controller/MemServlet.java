package com.mem.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

import com.mem.model.*;
import com.payme.model.PayService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)

public class MemServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("insert".equals(action)) { // 來自confirmationCode.jsp的請求
			String error = "";
			
			HttpSession session = req.getSession();
			String genAuthCode = (String)session.getAttribute("genAuthCode");
			
			String userInputCode = req.getParameter("userInputCode").trim();
			if(userInputCode == null ||userInputCode.trim().length() == 0) {
				error = "請輸入驗證碼";
				req.setAttribute("error", error);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/confirmationCode.jsp");
				failureView.forward(req, res);
				return;
			}
				
			
			if(!genAuthCode.equals(userInputCode)) {
				error = "驗證碼錯誤";
				req.setAttribute("error", error);
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/confirmationCode.jsp");
				failureView.forward(req, res);
				return;
			} else {
				MemVO memVO = (MemVO)session.getAttribute("memVO");
				MemService memSvc = new MemService();
				memSvc.addMem(memVO.getMem_account(), memVO.getMem_password(), memVO.getMem_name(), memVO.getMem_email(),
						memVO.getMem_nickname(), memVO.getMem_sex(), memVO.getMem_birth(), memVO.getMem_addr(),
						memVO.getMem_tel(), memVO.getMem_pic());
				String url = "/front-end/member/signIn.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交insertSuccess.jsp
				successView.forward(req, res);
			}
			
		} 
		
		//修改 from後台
		if("getOne_For_Update".equals(action)){
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				//接收請求參數
				String mem_id = req.getParameter("mem_id");
				
				//查詢單筆資料
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(mem_id);
				
				//查詢完成準備轉交
				req.setAttribute("memVO", memVO); //傳送至update_mem.jsp
//				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/update_mem.jsp");
//				failureView.forward(req, res);
				
				//其他可能的錯誤處理
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/listAllMem.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("update_fromBack".equals(action) || "UpdateStatusDelete".equals(action) || "update_fromFront".equals(action) || "UpdateStatusDeleteFromlistMems".equals(action)) { //來自 後台update_mem.jsp或前台??? 的請求參數
			try {
				String mem_id = req.getParameter("mem_id").trim();
				
				String mem_account = req.getParameter("mem_account").trim();
				
				String mem_password = req.getParameter("mem_password").trim();
				
				String mem_name = req.getParameter("mem_name").trim();
				
				String mem_email = req.getParameter("mem_email").trim();
				
				String mem_nickname = req.getParameter("mem_nickname").trim();
				
				
				Integer mem_sex = new Integer(req.getParameter("mem_sex").trim());
				
				java.sql.Date mem_birth = null;
				try {
					mem_birth = java.sql.Date.valueOf(req.getParameter("mem_birth").trim());
				} catch (IllegalArgumentException e) {
					mem_birth = new java.sql.Date(System.currentTimeMillis());
//					birthError = "請輸入日期";
//					req.setAttribute("birthError", birthError);
				}
				//補錯誤處理
				String mem_addr = req.getParameter("mem_addr").trim();
				//補錯誤處理
				String mem_tel = req.getParameter("mem_tel").trim();
				
				Double mem_bonus = null;
				try {
					mem_bonus = new Double(req.getParameter("mem_bonus").trim());
				} catch (NumberFormatException e) {
					mem_bonus = 0.0;	//錯誤處理
				}
				
				byte[] mem_pic = null;
				Part part = req.getPart("mem_pic");
				if(part.getSize() != 0) {
					InputStream in = part.getInputStream();
					mem_pic = new byte[in.available()];
					in.read(mem_pic);
					in.close();
//					System.out.println(mem_pic);
				} else {
					MemService memSvc = new MemService();
					MemVO memVO = memSvc.getOneMem(mem_id);
					mem_pic = memVO.getMem_pic();
				}
				
				
				
				Double mem_exp = null;
				try {
					mem_exp = new Double(req.getParameter("mem_exp").trim());
				} catch (NumberFormatException e) {
					mem_exp = 0.0;	//錯誤處理
				}
				 
				Integer mem_iskol = new Integer(req.getParameter("mem_iskol").trim());
					
				Integer mem_status = new Integer(req.getParameter("mem_status").trim());
				
				
				MemVO memVO = new MemVO();
				memVO.setMem_id(mem_id);
				memVO.setMem_account(mem_account);
				memVO.setMem_password(mem_password);
				memVO.setMem_name(mem_name);
				memVO.setMem_email(mem_email);
				memVO.setMem_nickname(mem_nickname);
				memVO.setMem_sex(mem_sex);
				memVO.setMem_birth(mem_birth);
				memVO.setMem_addr(mem_addr);
				memVO.setMem_tel(mem_tel);
				memVO.setMem_pic(mem_pic);
				memVO.setMem_bonus(mem_bonus);
				memVO.setMem_exp(mem_exp);
				memVO.setMem_iskol(mem_iskol);
				memVO.setMem_status(mem_status);
				
				//錯誤處理區塊
				
				//開始修改資料
				MemService memSvc = new MemService();
				memVO = memSvc.updateMem(mem_id, mem_account, mem_password, mem_name,
						 mem_email, mem_nickname, mem_sex, mem_birth, mem_addr, mem_tel, 
						 mem_bonus, mem_pic, mem_iskol, mem_exp,mem_status);
				
				if("update_fromFront".equals(action)) {//轉送回前台
					HttpSession session = req.getSession();
					session.setAttribute("memVO", memVO);
					String url = "/front-end/member/memberCenter.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); //轉送到/front-end/memberCenter.jsp
					successView.forward(req, res);
				} else if("update_fromBack".equals(action)){//轉送回後台
					req.setAttribute("memVO", memVO);
					String url = "/back-end/member/update_mem.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); //轉送到update_mem.jsp
					successView.forward(req, res);
				} else if("UpdateStatusDelete".equals(action)){
					String url = "/back-end/member/listAllMem.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); //轉送到update_mem.jsp
					successView.forward(req, res);
				} else {
					String url = "/back-end/member/listMems.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); //轉送到update_mem.jsp
					successView.forward(req, res);
				}
					
			} catch (Exception e) {
				if("update_fromFront".equals(action)) {//前台
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/memberSpace.jsp");//後台
					failureView.forward(req, res);
				} else {//後台
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/member/update_mem.jsp");//後台
					failureView.forward(req, res);
				}
			}
		}
		
		//會員登入 **尚未補上錯誤處理**
		if("signin".equals(action)) {
			MemVO memVO = null;
			String errmsg = "";
			try {
				String mem_account = req.getParameter("mem_account").trim();
				
				String mem_password = req.getParameter("mem_password").trim();
				
				memVO = new MemVO();
				memVO.setMem_account(mem_account);
				memVO.setMem_password(mem_password);
				
				//帳號密碼送進DB，開始登入
				MemService memSvc = new MemService();
				memVO = memSvc.signIn(mem_account, mem_password); // 只有mem_id 可能會跑SQL例外，因為無此帳號密碼
				memVO = memSvc.getOneMem(memVO.getMem_id()); // 一整包
				//判斷是否有這組帳號密碼，確認後轉送
				if(memVO.getMem_status() != 2) {
					HttpSession session = req.getSession();
					session.setAttribute("memVO", memVO); //將memVO存在session中
					
					String location = (String)session.getAttribute("location");
					
					if(location == null) {
						String url = "/front-end/front-index.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url); // 登入後轉交/front-end/front-index.jsp
						successView.forward(req, res);
					} else {
						res.sendRedirect(location);  //重導來源網頁
//						System.out.println(location);
					}				
					
				} else {
					errmsg = "此帳號已被註銷，無法登入";
					req.setAttribute("errmsg", errmsg);
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/signIn.jsp");
					failureView.forward(req, res);
				}
			} catch (Exception e) {
				req.setAttribute("memVO", memVO);
				errmsg = "無此帳號或密碼，請重新輸入";
				req.setAttribute("errmsg", errmsg);
//				System.out.println("無此帳號密碼" + e.getMessage() + memVO);//尚未補上錯誤處理
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/signIn.jsp");
				failureView.forward(req, res);
			}	
		}
		
		if("logout".equals(action)) { //登出
			  req.getSession().invalidate();
			  String location = req.getContextPath() + "/front-end/member/signIn.jsp";
			  res.sendRedirect(location);
		}
		//查詢個人
		//查詢全部
		
		//修改密碼
		if("updatePwd".equals(action)) {
			
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String mem_id = req.getParameter("mem_id").trim();
				String mem_password = req.getParameter("mem_password").trim();
				if(mem_password == null || mem_password.trim().length() == 0) 
					errorMsgs.put("one", "此欄位不得為空");
				
				MemService memSvc = new MemService();
				if(!(memSvc.getOneMem(mem_id).getMem_password().equals(mem_password)))//前端已做驗證
					errorMsgs.put("two", "原始密碼不正確");
				
				String new_password = req.getParameter("new_password").trim();
				if(new_password == null ||new_password.trim().length() == 0)
					errorMsgs.put("three", "此欄位不得為空");
				
				String confirmPassword = req.getParameter("confirmPassword").trim();
				if(confirmPassword == null ||confirmPassword.trim().length() == 0 && new_password != null) {
					errorMsgs.put("four", "此欄位不得為空");
				}
				
				if(!errorMsgs.isEmpty()) { //表示有錯誤資訊
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/member/updatePwd.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/*開始修改密碼*/
				if(new_password.equals(confirmPassword)) {
					memSvc.updatePwd(mem_id, new_password);
					req.setAttribute("success", "密碼修改成功,下次登入請使用新密碼");
					RequestDispatcher successView = req.getRequestDispatcher("/front-end/member/updatePwd.jsp"); // 修改成功後,轉交updatePwd.jsp
					successView.forward(req, res);
				} else {
					errorMsgs.put("five", "");
				}
				
					
			} catch (Exception e) {
				
			}
		}
		
		if("updatePwdFromForgetPwd".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try{
				String mem_id = (String)req.getSession().getAttribute("mem_id");
				String genAuthCode = (String)req.getSession().getAttribute("genAuthCode");
				
				String newPwd = req.getParameter("newPwd").trim();
				if(newPwd == null ||newPwd.trim().length() == 0)
					errorMsgs.put("newPwdError", "此欄位不得為空");
				
				String confirmPwd = req.getParameter("confirmPwd").trim();
				if(confirmPwd == null ||confirmPwd.trim().length() == 0)
					errorMsgs.put("confirmPwdError", "此欄位不得為空");
				else if (!newPwd.equals(confirmPwd))
					errorMsgs.put("confirmPwdError", "密碼不正確");
				
				String userInputCode = req.getParameter("userInputCode").trim();
				if(userInputCode == null ||userInputCode.trim().length() == 0) 
					errorMsgs.put("userInputCodeError", "請至您的信箱收取驗證碼並輸入");
				 else if (!userInputCode.equals(genAuthCode))
					errorMsgs.put("userInputCodeError", "驗證碼不正確");
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/updateForForgetPwd.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/*開始修改密碼*/
				MemService memSvc = new MemService();
				memSvc.updatePwd(mem_id, newPwd);
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/member/signIn.jsp"); // 修改成功後,轉交signIn.jsp
				successView.forward(req, res);
				
			} catch (Exception e) {
				
			}
		}
		
		if("insertCreditCard".equals(action)) {//尚未錯誤處理
			
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				String mem_id = req.getParameter("mem_id").trim();
				
				String cardNum1 = req.getParameter("cardNum1").trim();
				String cardNum2 = req.getParameter("cardNum2").trim();
				String cardNum3 = req.getParameter("cardNum3").trim();
				String cardNum4 = req.getParameter("cardNum4").trim();
				String CreditCardNum = cardNum1 + cardNum2 + cardNum3 + cardNum4;
				if(CreditCardNum.length() != 16 || !CreditCardNum.matches("[0-9]{16}")) {
					errorMsgs.put("cardError", "卡號錯誤");
				}
				
				Integer mm = new Integer(req.getParameter("mm").trim());
				if(mm > 12 || mm < 1 || mm == null) {
					errorMsgs.put("monthError", "請輸入正確年/月份");
				}
				
				Integer yy = new Integer(req.getParameter("yy").trim());
				
				if (yy == null || yy > 50 || yy < 20) {
					errorMsgs.put("monthError", "請輸入正確年/月份");
				}
				
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/payMethod.jsp");
					failureView.forward(req, res);
					return;
				}
				
				PayService paySvc = new PayService();
				paySvc.addPay(CreditCardNum, yy, mm, mem_id);
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/member/payMethod.jsp"); //新增成功後,轉交payMethod.jsp
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.put("cardError", "卡號錯誤");
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/member/payMethod.jsp");
				failureView.forward(req, res);
			}	
		}
		
		if("deleteCreditCard".equals(action)) { //尚未錯誤處理
			
			String credit_card_num = req.getParameter("credit_card_num").trim();
			
			PayService paySvc = new PayService();
			paySvc.deletePay(credit_card_num);
			
			RequestDispatcher successView = req.getRequestDispatcher("/front-end/member/payMethod.jsp"); //新增成功後,轉交payMethod.jsp
			successView.forward(req, res);
		}
		
		if("listMems".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				
				/***************************1.將輸入資料轉為Map**********************************/ 
				//採用Map<String,String[]> getParameterMap()的方法 
				//注意:an immutable java.util.Map 
				Map<String, String[]> map = req.getParameterMap();
				
				/***************************2.開始複合查詢***************************************/
				MemService memSvc = new MemService();
				List<MemVO> list  = memSvc.getAll(map);
				
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("list", list); // 資料庫取出的list物件,存入request
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/member/listMems.jsp"); // 成功轉交listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				
			}
		}
	}

}
