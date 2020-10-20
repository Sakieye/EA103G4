package com.order.model;

import java.sql.Connection;

import com.detail.model.DetailDAO;
import com.detail.model.DetailVO;
import com.mem.model.MemDAO;

import tools.jdbcUtil_CompositeQuery_Order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class OrderDAO implements OrderDAO_Interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/bookshop");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	private static final String INS_ORD = "INSERT INTO ORDERS VALUES(('OD'||LPAD(ODID_SEQ.NEXTVAL,10,'0')),?,?,?,?,DEFAULT,?,?,?,?,?,?,DEFAULT,?)";
	private static final String UPD_ORD = "UPDATE ORDERS SET REC_NAME=?, REC_TEL=?, REC_ADD=?, ORDER_PAY=?, DELIVERY=?, ORDER_STATUS=?, MEM_NOTE=? WHERE ORDER_ID=?";
	private static final String DEL_ORD = "UPDATE ORDERS SET ORDER_QTY=0, ORDER_TOTAL=0, GET_BONUS=0, USE_BONUS=0, ORDER_STATUS=4 WHERE ORDER_ID=?";
	private static final String GO_ORD =  "UPDATE ORDERS SET ORDER_STATUS=? WHERE ORDER_ID=?";
	private static final String FIND_ID = "SELECT * FROM ORDERS WHERE ORDER_ID=?";
	private static final String GET_ALL = "SELECT * FROM ORDERS ORDER BY ORDER_ID";


	@Override
	public void doCreate(OrderVO odvo) {
		
		Connection con =null;
		PreparedStatement pstmt =null;
		try {
			
			con = ds.getConnection();
			pstmt = con.prepareStatement(INS_ORD);
			
			pstmt.setString(1,odvo.getMem_id());
			pstmt.setString(2,odvo.getRec_name());
			pstmt.setString(3,odvo.getRec_tel());
			pstmt.setString(4,odvo.getRec_add());
			pstmt.setInt(5,odvo.getOrder_qty());
			pstmt.setInt(6,odvo.getOrder_total());
			pstmt.setInt(7,odvo.getOrder_pay());
			pstmt.setInt(8,odvo.getDelivery());
			pstmt.setInt(9,odvo.getGet_bonus());
			pstmt.setInt(10,odvo.getUse_bonus());
			pstmt.setString(11, odvo.getMem_note());
			
			pstmt.executeUpdate();		

		}catch(SQLException sqle) {
			throw new RuntimeException("▲Error： [doCreate]" + sqle.getMessage());
		}finally {
			if(pstmt !=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if(con !=null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}
	
	@Override
	public void doCreateODDT(OrderVO odCartVO, List<DetailVO> cartlist, Double newBonus) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		
		try {
			
			//訂單ID
			String[] orid = {"order_id"};
			//擷取訂單ID(轉送明細)
			String orid_next =null;
			con = ds.getConnection();
			pstmt = con.prepareStatement(INS_ORD, orid);
			
			//關閉自動更新
			con.setAutoCommit(false);

			pstmt.setString(1, odCartVO.getMem_id());
			pstmt.setString(2, odCartVO.getRec_name());
			pstmt.setString(3, odCartVO.getRec_tel());
			pstmt.setString(4, odCartVO.getRec_add());
			pstmt.setInt(5, odCartVO.getOrder_qty());
			pstmt.setInt(6, odCartVO.getOrder_total());
			pstmt.setInt(7, odCartVO.getOrder_pay());
			pstmt.setInt(8, odCartVO.getDelivery());
			pstmt.setInt(9, odCartVO.getGet_bonus());
			pstmt.setInt(10, odCartVO.getUse_bonus());
			pstmt.setString(11, odCartVO.getMem_note());

			pstmt.executeUpdate();
			
			//訂單與明細對應的自增主鍵值
			ResultSet rs = pstmt.getGeneratedKeys();
			if (rs.next()) {
				orid_next =  rs.getString(1); 
				
				System.out.println("取出訂單ID： " + orid_next);
			}else {
				System.out.println("▲Error： [無法取得訂單ID]");
			}rs.close();
			
			//新增訂單明細
			DetailDAO dtDAO = new DetailDAO();
			for(DetailVO dtVO:cartlist) {
				dtVO.setOrder_id(orid_next);
				dtDAO.doCreate(dtVO, con);
			}
			
			//修改會員紅利點數
			MemDAO memDAO = new MemDAO();
			memDAO.updateBonus(odCartVO.getMem_id(), newBonus, con);
			
			con.commit();
			con.setAutoCommit(true);
			
			System.out.println("本次新增訂單："+orid_next+" 包含"+cartlist.size()+" 筆明細.");
		} catch (SQLException sqle) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException("▲Error： [doCreateOD]" + sqle.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
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
	public void update(OrderVO odvo) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(UPD_ORD);
			con.setAutoCommit(false);

			pstmt.setString(1, odvo.getRec_name());
			pstmt.setString(2, odvo.getRec_tel());
			pstmt.setString(3, odvo.getRec_add());
			pstmt.setInt(4, odvo.getOrder_pay());
			pstmt.setInt(5, odvo.getDelivery());
			pstmt.setInt(6, odvo.getOrder_status());
			pstmt.setString(7, odvo.getMem_note());
			pstmt.setString(8, odvo.getOrder_id());

			pstmt.executeUpdate();

			con.commit();

		} catch (SQLException sqle) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException("▲Error： [Update]" + sqle.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
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
	public void cancel(String order_id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(DEL_ORD);
			con.setAutoCommit(false);

			pstmt.setString(1, order_id);

			pstmt.executeUpdate();

			con.commit();

		} catch (SQLException sqle) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException("▲Error： [cancel]" + sqle.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
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
	public OrderVO findbyid(String order_id) {
		OrderVO odVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(FIND_ID);
			pstmt.setString(1, order_id);
			con.setAutoCommit(false);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				odVO = new OrderVO();
				odVO.setOrder_id(rs.getString("order_id"));
				odVO.setMem_id(rs.getString("mem_id"));
				odVO.setRec_name(rs.getString("rec_name"));
				odVO.setRec_tel(rs.getString("rec_tel"));
				odVO.setRec_add(rs.getString("rec_add"));
				odVO.setOrder_date(rs.getTimestamp("order_date"));
				odVO.setOrder_qty(rs.getInt("order_qty"));
				odVO.setOrder_total(rs.getInt("order_total"));
				odVO.setOrder_pay(rs.getInt("order_pay"));
				odVO.setDelivery(rs.getInt("delivery"));
				odVO.setGet_bonus(rs.getInt("get_bonus"));
				odVO.setUse_bonus(rs.getInt("use_bonus"));
				odVO.setOrder_status(rs.getInt("order_status"));
				odVO.setMem_note(rs.getString("mem_note"));
			}

			con.commit();
		} catch (SQLException sqle) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException("▲Error： [Findbytime]" + sqle.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
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
		return odVO;
	}

	@Override
	public List<OrderVO> getAll() {
		List<OrderVO> list = new ArrayList<OrderVO>();
		OrderVO odVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL);
			rs = pstmt.executeQuery();
			con.setAutoCommit(false);

			while (rs.next()) {
				odVO = new OrderVO();
				odVO.setOrder_id(rs.getString("order_id"));
				odVO.setMem_id(rs.getString("mem_id"));
				odVO.setRec_name(rs.getString("rec_name"));
				odVO.setRec_tel(rs.getString("rec_tel"));
				odVO.setRec_add(rs.getString("rec_add"));
				odVO.setOrder_date(rs.getTimestamp("order_date"));
				odVO.setOrder_qty(rs.getInt("order_qty"));
				odVO.setOrder_total(rs.getInt("order_total"));
				odVO.setOrder_pay(rs.getInt("order_pay"));
				odVO.setDelivery(rs.getInt("delivery"));
				odVO.setGet_bonus(rs.getInt("get_bonus"));
				odVO.setUse_bonus(rs.getInt("use_bonus"));
				odVO.setOrder_status(rs.getInt("order_status"));
				odVO.setMem_note(rs.getString("mem_note"));
				list.add(odVO);
			}

			con.commit();
		} catch (SQLException sqle) {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			throw new RuntimeException("▲▲Error： [GetAll]" + sqle.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
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
	public List<OrderVO> allSelect(Map<String, String[]> map) {
		List<OrderVO> list = new ArrayList<OrderVO>();
		OrderVO odVO = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {

			con = ds.getConnection();
			String finalSQL = "SELECT * FROM ORDERS "
			+ jdbcUtil_CompositeQuery_Order.get_WhereCondition(map)
			+ "ORDER BY ORDER_ID DESC";
			pstmt = con.prepareStatement(finalSQL);
			

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				odVO = new OrderVO();
				odVO.setOrder_id(rs.getString("order_id"));
				odVO.setMem_id(rs.getString("mem_id"));
				odVO.setRec_name(rs.getString("rec_name"));
				odVO.setRec_tel(rs.getString("rec_tel"));
				odVO.setRec_add(rs.getString("rec_add"));
				odVO.setOrder_date(rs.getTimestamp("order_date"));
				odVO.setOrder_qty(rs.getInt("order_qty"));
				odVO.setOrder_total(rs.getInt("order_total"));
				odVO.setOrder_pay(rs.getInt("order_pay"));
				odVO.setDelivery(rs.getInt("delivery"));
				odVO.setGet_bonus(rs.getInt("get_bonus"));
				odVO.setUse_bonus(rs.getInt("use_bonus"));
				odVO.setOrder_status(rs.getInt("order_status"));
				odVO.setMem_note(rs.getString("mem_note"));
				list.add(odVO);
			}

			
		} catch (SQLException sqle) {
			throw new RuntimeException("�Error嚗� [Findbytime]" + sqle.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
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
	
	

}
