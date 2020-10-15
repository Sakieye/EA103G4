package com.lecture.model;

import java.util.List;


public class LectureService {
	
	private LectureDAO_interface dao;

	public LectureService() {
		dao = new LectureDAO();
	}

	public LectureVO addSignup(String lc_class_id, String admin_id, String lc_name, String lc_place, java.sql.Timestamp lc_time, int lc_hr, java.sql.Timestamp lc_deadline, java.sql.Timestamp lc_start_time, int lc_peo_lim, int lc_peo_up, String lc_info, byte[] lc_pic, int lc_free, int lc_price, int lc_state, int lc_seat_row, int lc_seat_colume, String lc_seat_state) {

		LectureVO lectureVO = new LectureVO();

		lectureVO.setLc_class_id(lc_class_id);
		lectureVO.setAdmin_id(admin_id);
		lectureVO.setLc_name(lc_name);
		lectureVO.setLc_place(lc_place);
		lectureVO.setLc_time(lc_time);
		lectureVO.setLc_hr(lc_hr);
		lectureVO.setLc_deadline(lc_deadline);
		lectureVO.setLc_start_time(lc_start_time);
		lectureVO.setLc_peo_lim(lc_peo_lim);
		lectureVO.setLc_peo_up(lc_peo_up);
		lectureVO.setLc_info(lc_info);
		lectureVO.setLc_pic(lc_pic);
		lectureVO.setLc_free(lc_free);
		lectureVO.setLc_price(lc_price);
		lectureVO.setLc_state(lc_state);
		lectureVO.setLc_seat_row(lc_seat_row);
		lectureVO.setLc_seat_colume(lc_seat_colume);
		lectureVO.setLc_seat_state(lc_seat_state);
		dao.insert(lectureVO);

		return lectureVO;

	}

	public LectureVO update(String lc_place, java.sql.Timestamp lc_time, int lc_hr, java.sql.Timestamp lc_deadline, int lc_peo_lim, int lc_peo_up, int lc_free, int lc_price, int lc_state, int lc_seat_row, int lc_seat_colume, String lc_seat_state, String lc_id) {

		LectureVO lectureVO = new LectureVO();

		lectureVO.setLc_place(lc_place);
		lectureVO.setLc_time(lc_time);
		lectureVO.setLc_hr(lc_hr);
		lectureVO.setLc_deadline(lc_deadline);
		lectureVO.setLc_peo_lim(lc_peo_lim);
		lectureVO.setLc_peo_up(lc_peo_up);
		lectureVO.setLc_free(lc_free);
		lectureVO.setLc_price(lc_price);
		lectureVO.setLc_state(lc_state);
		lectureVO.setLc_seat_row(lc_seat_row);
		lectureVO.setLc_seat_colume(lc_seat_colume);
		lectureVO.setLc_seat_state(lc_seat_state);
		lectureVO.setLc_id(lc_id);
		
		dao.update(lectureVO);

		return lectureVO;

	}
	public LectureVO update_state1or2(String lc_place, java.sql.Timestamp lc_time, int lc_hr, java.sql.Timestamp lc_deadline, int lc_state, String lc_id) {
		
		LectureVO lectureVO = new LectureVO();
		lectureVO.setLc_place(lc_place);
		lectureVO.setLc_time(lc_time);
		lectureVO.setLc_hr(lc_hr);
		lectureVO.setLc_deadline(lc_deadline);
		lectureVO.setLc_state(lc_state);
		lectureVO.setLc_id(lc_id);
		
		dao.update_state1or2(lectureVO);
		return lectureVO;
	}
	
	public void deleteLecture(String lc_id) {
		dao.delete(lc_id);
	}
	
	public LectureVO getOneLecture(String lc_id) {
		return dao.findByPrimaryKey(lc_id);
	}
	
	public List<LectureVO> getOneLectureState(int lc_state) {
		return dao.findByState(lc_state);
	}
	
	
	public List<LectureVO> getAll() {
		return dao.getAll();
	}

}
