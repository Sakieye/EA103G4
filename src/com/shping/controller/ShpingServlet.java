package com.shping.controller;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shping.model.Cart;


@WebServlet("/Shopping.html")
public class ShpingServlet extends HttpServlet {
	private static final long serialVersionUID = 06L;

	public ShpingServlet() {
		super();
	}
//	List<Cart> totallist = null;
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		String indexURL = "/front-end/shopping/bookindex.jsp";
		String cartURL = "/front-end/shopping/cart.jsp";
		String payURL = "/front-end/shopping/pay.jsp";
		String whichPage = req.getParameter("whichPage");
		String showAll = req.getParameter("showAll");
//System.out.println("→ Shopping.html");

		@SuppressWarnings("unchecked")
		List<Cart> cartlist =  (Vector<Cart>) session.getAttribute("shpingcart");
		String action = req.getParameter("action");
		ShpingServlet shping = new ShpingServlet();

		if (!action.equals("PAY")) {
			
			if (action.equals("ADD")) {
				Cart cart1 = getPrd(req);
				if (cartlist == null) {
					cartlist = new  Vector<Cart>();
					cartlist.add(cart1);
//					System.out.println("新增全新CART" + cart1.toString());
				} else {
					if (cartlist.contains(cart1)) {
						Cart cart2 = cartlist.get(cartlist.indexOf(cart1));
						cart2.setOrder_Qty(cart2.getOrder_Qty() + cart1.getOrder_Qty());
//						System.out.println("增加品項"+cart2.toString());
					} else {
						cartlist.add(cart1);
//						System.out.println( cart1.toString());
					}
				}
				String getTotal = shping.gettotal(cartlist);
				session.setAttribute("getTotal", getTotal);
				session.setAttribute("shpingcart", cartlist);
				
				
				req.getRequestDispatcher(indexURL).forward(req, res);
			}
			if(action.contentEquals("DEL")) {
				String del = req.getParameter("del");
				int delindex = Integer.parseInt(del);
				cartlist.remove(delindex);
				
				session.setAttribute("shpingcart", cartlist);
				req.getRequestDispatcher(cartURL).forward(req, res);
			}
			

		}else if(action.equals("PAY")) {
//			System.out.println("PAY");
			req.getRequestDispatcher(payURL).forward(req, res);
		}
		
		if (session != null) {
			if (session.getAttribute("shpingcart") != null && (whichPage != null || showAll != null)) {
				req.setAttribute("shpingcart", session.getAttribute("list"));
				req.setAttribute("whichPage", whichPage);
				req.setAttribute("showAll", showAll);
			}
		}
		

	}

	private Cart getPrd(HttpServletRequest req) {
		String isbn = req.getParameter("isbn");
		String book_Name = req.getParameter("book_Name");
		String publisher_Id = req.getParameter("publisher_Id");
		String order_Qty = req.getParameter("order_Qty");
		String price = req.getParameter("price");
		String book_BP = req.getParameter("book_BP");

		Cart cart = new Cart();

		cart.setIsbn(isbn);
		cart.setBook_Name(book_Name);
		cart.setPublisher_Id(publisher_Id);
		cart.setOrder_Qty(new Integer(order_Qty));
		cart.setPrice(new Double(price));
		cart.setBook_BP(new Double(book_BP));
		return cart;

	}
	
	private String gettotal(List<Cart>cartlist) {
		
		int total = 0;
		
		for (int i = 0; i < cartlist.size(); i++) {
			Cart cart = cartlist.get(i);
			double price = cart.getPrice();
			int order_Qty = cart.getOrder_Qty();
			total += (price * order_Qty);
		}
		
		String getTotal = String.valueOf(total);
		return getTotal;
		
		
	}

}


