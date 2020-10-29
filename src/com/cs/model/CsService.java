package com.cs.model;

import java.util.List;

public class CsService {
	private CsDAO_interface dao;
	
	public CsService() {
		dao = new CsDAO();
	}
	
	//新增訊息
	public CsVO addCs(String cs_Email,String cs_Tel, String cs_Subject,String cs_Message,Integer cs_isSend) {
		CsVO csVO = new CsVO();
		
		csVO.setCs_Email(cs_Email);
		csVO.setCs_Tel(cs_Tel);
		csVO.setCs_Subject(cs_Subject);
		csVO.setCs_Message(cs_Message);
		csVO.setCs_isSend(cs_isSend);
		dao.insert(csVO);
		
		return csVO;		
	}
	public void deleteCs(String cs_ID) {
		dao.delete(cs_ID);
	}
	
	public List<CsVO> getAll(){
		return dao.getAll();
	}
	public CsVO getOneCs(String cs_ID) {
		return dao.findByPrimaryKey(cs_ID);
	}
	
}
