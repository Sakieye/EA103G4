package com.shping.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Optional;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.shping.model.Cart;
import com.book.model.Book;
import com.book.model.BookService;
import com.bookpic.model.BookPicService;
import com.bookpic.model.BookPicture;

@WebServlet("/Shopping.html")
public class ShpingServlet extends HttpServlet {
	private static final long serialVersionUID = 06L;

	public ShpingServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String detailURL = "/front-end/shopping/prddetail.jsp";
		String indexURL = "/front-end/shopping/bookindex.jsp";

		System.out.println("inBOOKDETAIL");
		String book_id = req.getParameter("book_id");
		BookService bkSvc = (BookService) getServletContext().getAttribute("bookService");
		BookPicService bkpicSvc = (BookPicService) getServletContext().getAttribute("bookPicService");
		Optional<Book> prddetail = bkSvc.getByBookID(book_id);
		List<BookPicture> bookPiclist = bkpicSvc.getByBookID(book_id);
		if (prddetail.isPresent()) {
			req.setAttribute("prddetail", prddetail.get());
			req.setAttribute("bookPiclist", bookPiclist);
			req.setAttribute("bookID", book_id);
			req.getRequestDispatcher(detailURL).forward(req, res);
		}else {
			req.getRequestDispatcher(indexURL).forward(req, res);
		}
		

	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();

		String indexURL = "/front-end/shopping/bookindex.jsp";
		String detailURL = "http://localhost:8081/EA103G4/Shopping.html?book_id=B00000020741";
		String cartURL = "/front-end/shopping/cart.jsp";
		String delURL = "http://localhost:8081/BookShop1014(2202)/front-end/shopping/cart.jsp";
		String payURL = "/front-end/shopping/pay.jsp";
		String whichPage = req.getParameter("whichPage");
		String showAll = req.getParameter("showAll");

		@SuppressWarnings("unchecked")
		List<Cart> cartlist = (Vector<Cart>) session.getAttribute("shpingcart");
		String action = req.getParameter("action");
		ShpingServlet shping = new ShpingServlet();
		
		if (!action.equals("BOOKDETAIL")) {
			JSONArray careFormJSON = new JSONArray();
			// 加入購物車
			if (action.equals("ADD") || action.equals("DETAILADD")) {
				Cart cart1 = getPrd(req);

				if (cartlist == null) {
					cartlist = new Vector<Cart>();
					cartlist.add(cart1);
				} else {
					if (cartlist.contains(cart1)) {
						Cart cart2 = cartlist.get(cartlist.indexOf(cart1));
						cart2.setComm_Qty(cart2.getComm_Qty() + cart1.getComm_Qty());
					} else {
						cartlist.add(cart1);
					}
				}
				for(Cart cart:cartlist) {
					JSONObject obj = new JSONObject();
					try {
						obj.put("mem_id", cart.getMem_Id());
						obj.put("isbn", cart.getIsbn());
						obj.put("book_id", cart.getBook_Id());
						obj.put("book_name", cart.getBook_Name());
						obj.put("publisher_id", cart.getPublisher_Id());
						obj.put("price", cart.getPrice());
						obj.put("book_bp", cart.getBook_BP());
						obj.put("comm_qty", cart.getComm_Qty());
						careFormJSON.put(obj);
					} catch (JSONException e) {
						throw new RuntimeException("▲Error： [加入JSON失敗!]" + e.getMessage());
					}
					
				}
				
				String[] getTotal = shping.gettotal(cartlist);
				session.setAttribute("getTotal", getTotal);
				session.setAttribute("shpingcart", cartlist);
				
				res.setContentType("text/plain");
				res.setCharacterEncoding("UTF-8");
				PrintWriter out = res.getWriter();
				out.write(careFormJSON.toString());
				out.flush();
				out.close();
				
			}
			// 刪除商品
			if (action.contentEquals("DEL")) {
				String del = req.getParameter("del");
				int delindex = Integer.parseInt(del);
				cartlist.remove(delindex);

				String[] getTotal = shping.gettotal(cartlist);
				session.setAttribute("getTotal", getTotal);
				session.setAttribute("shpingcart", cartlist);

				req.getRequestDispatcher(cartURL).forward(req, res);
//				res.sendRedirect(delURL);
			}
			// 付款確認
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
		} catch (Exception e) {
			throw new RuntimeException("▲Error： [加入購物車失敗!]" + e.getMessage());
		}
		return cart;
	}

	private String[] gettotal(List<Cart> cartlist) {

		int total = 0;
		int bonus = 0;
		int qty = 0;

		for (int i = 0; i < cartlist.size(); i++) {
			Cart cart = cartlist.get(i);

			double book_BP = cart.getBook_BP();
			double price = cart.getPrice();
			int comm_Qty = cart.getComm_Qty();
			total += (price * comm_Qty);
			bonus += (book_BP * comm_Qty);
			qty += comm_Qty;
		}

		String[] totalArray = new String[3];
		String get_Total = String.valueOf(total);
		String get_Bonus = String.valueOf(bonus);
		String get_Qty = String.valueOf(qty);
		totalArray[0] = get_Total;
		totalArray[1] = get_Bonus;
		totalArray[2] = get_Qty;

		return totalArray;

	}

}
