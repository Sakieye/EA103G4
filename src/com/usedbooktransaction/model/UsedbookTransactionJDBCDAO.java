package com.usedbooktransaction.model;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsedbookTransactionJDBCDAO implements UsedbookTransactionDAO_interface {

	String DRIVER = "oracle.jdbc.driver.OracleDriver";
	String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	String USER = "BOOKSHOP";
	String PASSWORD = "123456";

	private static final String INSERT_STMT = "INSERT INTO USEDBOOK_TRANSACTION (PO_NO, BOOK_ID, SELLER_MEM_ID, BUYER_MEM_ID, BOOK_STATE, BOOK_STATE_PIC, UDB_SALE_PRICE, RELEASE_DATE, UDB_ORDER_STATE_NO, UDB_ORDER_DATE, PROD_STATE, PAYMENT_STATE) "
			+ "VALUES ('PO' || LPAD(PO_SEQ.NEXTVAL, 4, '0'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE USEDBOOK_TRANSACTION SET BOOK_STATE = ?,  BOOK_STATE_PIC = ? , UDB_SALE_PRICE = ? ,UDB_ORDER_STATE_NO = ?, PROD_STATE = ?, PAYMENT_STATE = ? WHERE PO_NO = ?";
	private static final String DELETE_BY_PO_NO = "DELETE FROM USEDBOOK_TRANSACTION WHERE PO_NO = ?";
	private static final String FIND_BY_PO_NO = "SELECT * FROM USEDBOOK_TRANSACTION WHERE PO_NO = ?";
	private static final String FIND_BY_SELLER_MEM_ID = "SELECT PO_NO, BOOK_ID, BUYER_MEM_ID, BOOK_STATE, BOOK_STATE_PIC, UDB_SALE_PRICE, RELEASE_DATE FROM USEDBOOK_TRANSACTION WHERE SELLER_MEM_ID = ?";
	private static final String FIND_BY_BUYER_MEM_ID = "SELECT PO_NO, BOOK_ID, SELLER_MEM_ID, BOOK_STATE, BOOK_STATE_PIC, UDB_SALE_PRICE, RELEASE_DATE FROM USEDBOOK_TRANSACTION WHERE BUYER_MEM_ID = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM USEDBOOK_TRANSACTION ORDER BY BOOK_ID";

	@Override
	public void insert(UsedbookTransactionVO usedbooktransactionVO) {

		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(INSERT_STMT);

			pstmt.setString(1, usedbooktransactionVO.getBook_id());
			pstmt.setString(2, usedbooktransactionVO.getSeller_mem_id());
			pstmt.setString(3, usedbooktransactionVO.getBuyer_mem_id());
			pstmt.setString(4, usedbooktransactionVO.getBook_state());
			pstmt.setBytes(5, usedbooktransactionVO.getBook_state_pic());
			pstmt.setInt(6, usedbooktransactionVO.getUdb_sale_price());
			pstmt.setTimestamp(7, usedbooktransactionVO.getRelease_date());
			pstmt.setInt(8, usedbooktransactionVO.getUdb_order_state_no());
			pstmt.setTimestamp(9, usedbooktransactionVO.getUdb_order_date());
			pstmt.setInt(10, usedbooktransactionVO.getProd_state());
			pstmt.setInt(11, usedbooktransactionVO.getPayment_state());

			pstmt.executeUpdate();
			System.out.println("新增成功");

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
//			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void update(UsedbookTransactionVO usedbooktransactionVO) {
		// BOOK_STATE = ?, BOOK_STATE_PIC = ? , UDB_SALE_PRICE = ? ,UDB_ORDER_STATE_NO =
		// ?,
		// PROD_STATE = ?, PAYMENT_STATEWHERE = ? WHERE PO_NO = ?
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, usedbooktransactionVO.getBook_state());
			pstmt.setBytes(2, usedbooktransactionVO.getBook_state_pic());
			pstmt.setInt(3, usedbooktransactionVO.getUdb_sale_price());
			pstmt.setInt(4, usedbooktransactionVO.getUdb_order_state_no());
			pstmt.setInt(5, usedbooktransactionVO.getProd_state());
			pstmt.setInt(6, usedbooktransactionVO.getPayment_state());
			pstmt.setString(7, usedbooktransactionVO.getPo_no());
			pstmt.executeUpdate();
			System.out.println("新增成功");

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
//			se.printStackTrace();
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public void delete(String po_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);

			pstmt = con.prepareStatement(DELETE_BY_PO_NO);

			pstmt.setString(1, po_no);
			pstmt.executeUpdate();
			System.out.println("delete ok");
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
	}

	@Override
	public UsedbookTransactionVO findByPrimaryKeyPoNo(String po_no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsedbookTransactionVO usedbooktransactionVO = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);

			pstmt = con.prepareStatement(FIND_BY_PO_NO);

			pstmt.setString(1, po_no);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				usedbooktransactionVO = new UsedbookTransactionVO();

				usedbooktransactionVO.setPo_no(po_no);
				usedbooktransactionVO.setBook_id(rs.getString("book_id"));
				usedbooktransactionVO.setSeller_mem_id(rs.getString("seller_mem_id"));
				usedbooktransactionVO.setBuyer_mem_id(rs.getString("buyer_mem_id"));
				usedbooktransactionVO.setBook_state(rs.getString("book_state"));
				usedbooktransactionVO.setBook_state_pic(rs.getBytes("book_state_pic"));
				usedbooktransactionVO.setUdb_sale_price(rs.getInt("udb_sale_price"));
				usedbooktransactionVO.setRelease_date(rs.getTimestamp("release_date"));
				usedbooktransactionVO.setUdb_order_state_no(rs.getInt("udb_order_state_no"));
				usedbooktransactionVO.setUdb_order_date(rs.getTimestamp("udb_order_date"));
				usedbooktransactionVO.setProd_state(rs.getInt("prod_state"));
				usedbooktransactionVO.setPayment_state(rs.getInt("payment_state"));
				System.out.println("(FIND_BY_PO_NO ok)");
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return usedbooktransactionVO;
	}

	@Override
	public List<UsedbookTransactionVO> getAll() {
		List<UsedbookTransactionVO> list = new ArrayList<UsedbookTransactionVO>();
		UsedbookTransactionVO usedbooktransactionVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);

			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				usedbooktransactionVO = new UsedbookTransactionVO();
				usedbooktransactionVO.setPo_no(rs.getString("po_no"));
				usedbooktransactionVO.setBook_id(rs.getString("book_id"));
				usedbooktransactionVO.setSeller_mem_id(rs.getString("seller_mem_id"));
				usedbooktransactionVO.setBuyer_mem_id(rs.getString("buyer_mem_id"));
				usedbooktransactionVO.setBook_state(rs.getString("book_state"));
				usedbooktransactionVO.setBook_state_pic(rs.getBytes("book_state_pic"));
				usedbooktransactionVO.setUdb_sale_price(rs.getInt("udb_sale_price"));
				usedbooktransactionVO.setRelease_date(rs.getTimestamp("release_date"));
				usedbooktransactionVO.setUdb_order_state_no(rs.getInt("udb_order_state_no"));
				usedbooktransactionVO.setUdb_order_date(rs.getTimestamp("udb_order_date"));
				usedbooktransactionVO.setProd_state(rs.getInt("prod_state"));
				usedbooktransactionVO.setPayment_state(rs.getInt("payment_state"));
				list.add(usedbooktransactionVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public UsedbookTransactionVO findByPrimaryKeySeller(String seller_mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsedbookTransactionVO usedbooktransactionVO = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);

			pstmt = con.prepareStatement(FIND_BY_SELLER_MEM_ID);

			pstmt.setString(1, seller_mem_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				usedbooktransactionVO = new UsedbookTransactionVO();

				usedbooktransactionVO.setSeller_mem_id(seller_mem_id);
				usedbooktransactionVO.setPo_no(rs.getString("po_no"));
				usedbooktransactionVO.setBook_id(rs.getString("book_id"));
				usedbooktransactionVO.setBuyer_mem_id(rs.getString("buyer_mem_id"));
				usedbooktransactionVO.setBook_state(rs.getString("book_state"));
				usedbooktransactionVO.setBook_state_pic(rs.getBytes("book_state_pic"));
				usedbooktransactionVO.setUdb_sale_price(rs.getInt("udb_sale_price"));
				usedbooktransactionVO.setRelease_date(rs.getTimestamp("release_date"));
				System.out.println("(FIND_BY_SELLER_MEM_ID ok)");
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return usedbooktransactionVO;
	}

	@Override
	public UsedbookTransactionVO findByPrimaryKeyBuyer(String buyer_mem_id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsedbookTransactionVO usedbooktransactionVO = null;

		try {

			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USER, PASSWORD);

			pstmt = con.prepareStatement(FIND_BY_BUYER_MEM_ID);

			pstmt.setString(1, buyer_mem_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				usedbooktransactionVO = new UsedbookTransactionVO();
				usedbooktransactionVO.setBuyer_mem_id(buyer_mem_id);

				usedbooktransactionVO.setPo_no(rs.getString("po_no"));
				usedbooktransactionVO.setBook_id(rs.getString("book_id"));
				usedbooktransactionVO.setBuyer_mem_id(rs.getString("seller_mem_id"));
				usedbooktransactionVO.setBook_state(rs.getString("book_state"));
				usedbooktransactionVO.setBook_state_pic(rs.getBytes("book_state_pic"));
				usedbooktransactionVO.setUdb_sale_price(rs.getInt("udb_sale_price"));
				usedbooktransactionVO.setRelease_date(rs.getTimestamp("release_date"));
				System.out.println("(FIND_BY_buyER_MEM_ID ok)");
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}

			if (con != null) {
				try {
					con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
		}
		return usedbooktransactionVO;

	}

	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
			baos.flush();
		}
		baos.close();
		fis.close();

		return baos.toByteArray();

	}

	public static void main(String[] args) throws IOException {

		UsedbookTransactionJDBCDAO dao = new UsedbookTransactionJDBCDAO();

		// add
//		UsedbookTransactionVO usedbooktransactionVO = new UsedbookTransactionVO();
//		usedbooktransactionVO.setBook_id("B00003");
//		usedbooktransactionVO.setSeller_mem_id("M0003");
//		usedbooktransactionVO.setBuyer_mem_id("M0001");
//		usedbooktransactionVO.setBook_state("好");
//		System.out.println("1");
//		byte[] pic = getPictureByteArray("WebContent/images/admins/ADM0001.png");
//		System.out.println("2" + pic);
//		usedbooktransactionVO.setBook_state_pic(pic);
//		usedbooktransactionVO.setUdb_sale_price(99);
//		usedbooktransactionVO.setRelease_date(java.sql.Timestamp.valueOf("2020-06-03 22:3:44"));
//		System.out.println("3");
//		usedbooktransactionVO.setUdb_order_state_no(1);
//		usedbooktransactionVO.setUdb_order_date(java.sql.Timestamp.valueOf("2020-06-03 22:3:44"));
//		usedbooktransactionVO.setProd_state(1);
//		usedbooktransactionVO.setPayment_state(1);
//		System.out.println("4");
//		dao.insert(usedbooktransactionVO); // Store the row in the list
//
//		System.out.println("insert ok");
//
//		// update
//
//		UsedbookTransactionVO usedbooktransactionVO2 = new UsedbookTransactionVO();
//
//		usedbooktransactionVO2.setBook_state("不好");
//		System.out.println("1");
//		byte[] pic2 = getPictureByteArray("WebContent/images/admins/ADM0005.png");
//		usedbooktransactionVO2.setBook_state_pic(pic2);
//		System.out.println("2" + pic2);
//		usedbooktransactionVO2.setUdb_sale_price(30);
//		System.out.println("3");
//		usedbooktransactionVO2.setUdb_order_state_no(1);
//		System.out.println("4");
//		usedbooktransactionVO2.setProd_state(1);
//		System.out.println("5");
//		usedbooktransactionVO2.setPayment_state(1);
//		System.out.println("6");
//		usedbooktransactionVO2.setPo_no("PO0001");
//		System.out.println("7");
//		dao.update(usedbooktransactionVO2);
//		System.out.println("update ok");
//
//		// delete 刪除OK
//		dao.delete("PO0009");
//		System.out.println("delet ok");
//
//		// select one pono
//
//		UsedbookTransactionVO usedbooktrasactionVO3 = dao.findByPrimaryKeyPoNo("PO0005");
//		System.out.print(usedbooktrasactionVO3.getPo_no() + ",");
//		System.out.print(usedbooktrasactionVO3.getBook_id() + ",");
//		System.out.print(usedbooktrasactionVO3.getSeller_mem_id() + ",");
//		System.out.print(usedbooktrasactionVO3.getBuyer_mem_id() + ",");
//		System.out.print(usedbooktrasactionVO3.getBook_state() + ",");
//		System.out.print(usedbooktrasactionVO3.getBook_state_pic() + ",");
//		System.out.print(usedbooktrasactionVO3.getUdb_sale_price() + ",");
//		System.out.print(usedbooktrasactionVO3.getRelease_date() + ",");
//		System.out.print(usedbooktrasactionVO3.getUdb_order_state_no() + ",");
//		System.out.print(usedbooktrasactionVO3.getUdb_order_date() + ",");
//		System.out.print(usedbooktrasactionVO3.getProd_state() + ",");
//		System.out.println(usedbooktrasactionVO3.getPayment_state());
//		System.out.println("");
//		
		// select one seller_mem_id
//		UsedbookTransactionVO usedbooktrasactionVO4 = dao.findByPrimaryKeySeller("M0001");
//		System.out.print(usedbooktrasactionVO4.getPo_no() + ",");
//		System.out.print(usedbooktrasactionVO4.getBook_id() + ",");
//		System.out.print(usedbooktrasactionVO4.getBuyer_mem_id() + ",");
//		System.out.print(usedbooktrasactionVO4.getBook_state() + ",");
//		System.out.print(usedbooktrasactionVO4.getBook_state_pic() + ",");
//		System.out.print(usedbooktrasactionVO4.getUdb_sale_price() + ",");
//		System.out.print(usedbooktrasactionVO4.getRelease_date() + ",");
//		System.out.println("");
//
		// select one buyer_mem_id
//		UsedbookTransactionVO usedbooktrasactionVO5 = dao.findByPrimaryKeyBuyer("M0002");
//		System.out.print(usedbooktrasactionVO5.getPo_no() + ",");
//		System.out.print(usedbooktrasactionVO5.getBook_id() + ",");
//		System.out.print(usedbooktrasactionVO5.getBuyer_mem_id() + ",");
//		System.out.print(usedbooktrasactionVO5.getBook_state() + ",");
//		System.out.print(usedbooktrasactionVO5.getBook_state_pic() + ",");
//		System.out.print(usedbooktrasactionVO5.getUdb_sale_price() + ",");
//		System.out.print(usedbooktrasactionVO5.getRelease_date() + ",");
//		System.out.println("");
//
//		// select all OK
//		List<UsedbookTransactionVO> list = dao.getAll();
//		for (UsedbookTransactionVO aUsedbookTransaction : list) {
//			System.out.print(aUsedbookTransaction.getPo_no() + ",");
//			System.out.print(aUsedbookTransaction.getBook_id() + ",");
//			System.out.print(aUsedbookTransaction.getSeller_mem_id() + ",");
//			System.out.print(aUsedbookTransaction.getBuyer_mem_id() + ",");
//			System.out.print(aUsedbookTransaction.getBook_state() + ",");
//			System.out.print(aUsedbookTransaction.getBook_state_pic() + ",");
//			System.out.print(aUsedbookTransaction.getUdb_sale_price() + ",");
//			System.out.print(aUsedbookTransaction.getRelease_date() + ",");
//			System.out.print(aUsedbookTransaction.getUdb_order_state_no() + ",");
//			System.out.print(aUsedbookTransaction.getUdb_order_date() + ",");
//			System.out.print(aUsedbookTransaction.getProd_state() + ",");
//			System.out.println(aUsedbookTransaction.getPayment_state());
//			System.out.println("");
//		}
	}

}
