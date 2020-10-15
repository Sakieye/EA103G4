package com.revreport.model;

import java.util.List;

public class RevReportService {
	private RevReportDAO_interface dao;
	
	public RevReportService() {
		dao = new RevReportDAO();
	}
	
	public RevReportVO addRevReport(String rev_rep_reason, byte[] rev_rep_proof, String rev_id, String mem_id) {
		RevReportVO revReportVO = new RevReportVO();
		
		revReportVO.setRev_rep_reason(rev_rep_reason);
		revReportVO.setRev_rep_proof(rev_rep_proof);
		revReportVO.setRev_id(rev_id);
		revReportVO.setMem_id(mem_id);
		
		return revReportVO;
	}
	
	public RevReportVO updateStatus(Integer rev_rep_status, String rev_id) {
		RevReportVO revReportVO = new RevReportVO();
		
		revReportVO.setRev_rep_status(rev_rep_status);
		revReportVO.setRev_id(rev_id);
		dao.updateStatus(revReportVO);
		
		return revReportVO;
	}
	
	public RevReportVO getOneRevReport(String rev_rep_id) {
		return dao.findByPrimaryKey(rev_rep_id);
	}
	
	public List<RevReportVO> getRevReportByMem(String mem_id) {
		return dao.findByMemId(mem_id);
	}
	
	public List<RevReportVO> getAll() {
		return dao.getAll();
	}
}
