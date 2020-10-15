package com.Follow.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class FollowJDBCDAO implements FollowDAO_interface{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "BOOKSHOPG4";
	String passwd = "BOOKSHOPG4";
	
	//新增追蹤
	private static final String INSERT_STMT = 
			"INSERT INTO FOLLOW_LIST (MEMID,AMEMID) VALUES (?,?)";
	//刪除追蹤
	private static final String DELETE_STMT =
			"DELETE FROM FOLLOW_LIST WHERE MEMID = ? AND AMEMID = ?";
	
	//確認是否有追蹤
	private static final String GET_ALL_SUBSCRIBE =
			"SELECT AMEMID FROM FOLLOW_LIST WHERE MEMID = ?";

	
	@Override
	public void insert(FollowVO followVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			
			pstmt = con.prepareStatement(INSERT_STMT);
			
			pstmt.setString(1, followVO.getMemId());
			pstmt.setString(2, followVO.getaMemId());
			
			pstmt.executeUpdate();
			
			// Handle any driver errors  ( JDBC 驅動 )
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors  ( SQL 除錯 )
		} catch (SQLException e) {
			throw new RuntimeException("Couldn't load database driver. " +
					e.getMessage());
			// Clean up JDBC resources ( 關閉資源 )
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch(Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}

	@Override
	public void delete(FollowVO followVO) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userid,passwd);
			pstmt = con.prepareStatement(DELETE_STMT);
		
			pstmt.setString(1, followVO.getMemId());
			pstmt.setString(2, followVO.getaMemId());
		
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors  ( SQL 除錯 )
		} catch (SQLException e) {
			throw new RuntimeException("Couldn't load database driver. " +
					e.getMessage());
			// Clean up JDBC resources ( 關閉資源 )
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if(con != null) {
				try {
					con.close();
				} catch(Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		
	}
	
}
