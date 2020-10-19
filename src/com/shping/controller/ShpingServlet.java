package com.shping.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shping.model.Cart;
import com.order.model.*;

@WebServlet("/Shopping.html")
public class ShpingServlet extends HttpServlet {
	private static final long serialVersionUID = 06L;
	public ShpingServlet() {
		super();
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		String indexURL = "/front-end/shopping/bookindex.jsp";
		
		String cartURL = "/front-end/shopping/cart.jsp";
		String delURL = "http://localhost:8081/BookShop1014(2202)/front-end/shopping/cart.jsp";
		String payURL = "/front-end/shopping/pay.jsp";
		String whichPage = req.getParameter("whichPage");
		String showAll = req.getParameter("showAll");
		System.out.println("→ Shopping.html");

		@SuppressWarnings("unchecked")
		List<Cart> cartlist = (Vector<Cart>) session.getAttribute("shpingcart");
		String action = req.getParameter("action");
		ShpingServlet shping = new ShpingServlet();

		if (!action.equals("PAY")) {
			// 加入購物車
			if (action.equals("ADD")) {
				Cart cart1 = getPrd(req);

				if (cartlist == null) {
					cartlist = new Vector<Cart>();
					cartlist.add(cart1);
					System.out.println("新增全新CART" + cart1.toString());
				} else {
					if (cartlist.contains(cart1)) {
						Cart cart2 = cartlist.get(cartlist.indexOf(cart1));
						cart2.setComm_Qty(cart2.getComm_Qty() + cart1.getComm_Qty());
						System.out.println("增加品項" + cart2.toString());
					} else {
						cartlist.add(cart1);
						System.out.println(cart1.toString());
					}
				}
				String[] getTotal = shping.gettotal(cartlist);
				System.out.println(getTotal[0]);
				System.out.println(getTotal[1]);
				session.setAttribute("getTotal", getTotal);
				session.setAttribute("shpingcart", cartlist);
				req.getRequestDispatcher(indexURL).forward(req, res);
			}
			// 刪除商品
			if (action.contentEquals("DEL")) {
				String del = req.getParameter("del");
				int delindex = Integer.parseInt(del);
				cartlist.remove(delindex);

				String[] getTotal = shping.gettotal(cartlist);
				session.setAttribute("getTotal", getTotal);
				session.setAttribute("shpingcart", cartlist);

				// req.getRequestDispatcher(cartURL).forward(req, res);
				res.sendRedirect(delURL);
			}
			//付款確認
			if (action.equals("PAYCHECK")) {
				String[] getTotal = shping.gettotal(cartlist);
				session.setAttribute("getTotal", getTotal);
				session.setAttribute("shpingcart", cartlist);

//				res.sendRedirect(payURL);
				req.getRequestDispatcher(payURL).forward(req, res);

			}

		}

		// 頁面session
		if (session != null) {
			if (session.getAttribute("shpingcart") != null && (whichPage != null || showAll != null)) {
				req.setAttribute("shpingcart", session.getAttribute("shpingcart"));
				req.setAttribute("whichPage", whichPage);
				req.setAttribute("showAll", showAll);
			}
		}

	}

	private Cart getPrd(HttpServletRequest req) throws ServletException, IOException {
		String mem_Id = req.getParameter("mem_Id");

		String isbn = req.getParameter("isbn");
		String book_Id = req.getParameter("book_Id");
		String book_Name = req.getParameter("book_Name");
		String publisher_Id = req.getParameter("publisher_Id");
		String comm_Qty = req.getParameter("comm_Qty");
		String price = req.getParameter("price");
		String book_BP = req.getParameter("book_BP");

		Cart cart = new Cart();
		try {

		cart.setMem_Id(mem_Id);
		cart.setIsbn(isbn);
		cart.setBook_Id(book_Id);
		cart.setBook_Name(book_Name);
		cart.setPublisher_Id(publisher_Id);
		cart.setPrice(new Double(price));
		cart.setBook_BP(new Double(book_BP));
		cart.setComm_Qty(new Integer(comm_Qty));
		}catch(Exception e) {
			throw new RuntimeException("▲Error： [加入購物車失敗!]" + e.getMessage());
		}
		return cart;
	}


	private String[] gettotal(List<Cart> cartlist) {

		int total = 0;
		int Bonus = 0;

		for (int i = 0; i < cartlist.size(); i++) {
			Cart cart = cartlist.get(i);

			double book_BP = cart.getBook_BP();
			double price = cart.getPrice();
			int order_Qty = cart.getComm_Qty();
			total += (price * order_Qty);
			Bonus += (book_BP * order_Qty);
		}

		String[] totalArray = new String[2];
		String getTotal = String.valueOf(total);
		String get_Bonus = String.valueOf(Bonus);
		totalArray[0] = getTotal;
		totalArray[1] = get_Bonus;

		return totalArray;

	}

}
