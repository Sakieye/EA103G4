package com.Follow.model;

public class FollowService {
	private FollowJDBCDAO dao;
	
	public FollowService() {
		dao = new FollowJDBCDAO();
	}
	
	
	//追蹤
	public void subscribe(String memId,String aMemId) {
		FollowVO followVO = new FollowVO();
		followVO.setMemId(memId);
		followVO.setaMemId(aMemId);
		
		dao.insert(followVO);
	}
	
	//退追蹤
	public void unsubscribe(String memId,String aMemId) {
		FollowVO followVO = new FollowVO();
		followVO.setMemId(memId);
		followVO.setaMemId(aMemId);
		
		dao.delete(followVO);
	}
	
	
}
