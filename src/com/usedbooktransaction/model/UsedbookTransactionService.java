package com.usedbooktransaction.model;

import java.sql.Timestamp;
import java.util.List;

public class UsedbookTransactionService {
	private UsedbookTransactionDAO_interface dao;

	public UsedbookTransactionService() {
		dao = new UsedbookTransactionDAO();
	}

	public UsedbookTransactionVO addUsedbookTransaction(String book_id, String seller_mem_id,
			String buyer_mem_id, String book_state, byte[] book_state_pic, 
			Integer udb_sale_price, Timestamp release_date, Integer udb_order_state_no, 
			Timestamp udb_order_date, Integer prod_state, Integer payment_state) {

		UsedbookTransactionVO usedbooktransactionVO = new UsedbookTransactionVO();

		usedbooktransactionVO.setBook_id(book_id);
		usedbooktransactionVO.setSeller_mem_id(seller_mem_id);
		usedbooktransactionVO.setBuyer_mem_id(buyer_mem_id);
		usedbooktransactionVO.setBook_state(book_state);
		usedbooktransactionVO.setBook_state_pic(book_state_pic);
		usedbooktransactionVO.setUdb_sale_price(udb_sale_price);
		usedbooktransactionVO.setRelease_date(release_date);
		usedbooktransactionVO.setUdb_order_state_no(udb_order_state_no);
		usedbooktransactionVO.setUdb_order_date(udb_order_date);
		usedbooktransactionVO.setProd_state(prod_state);
		usedbooktransactionVO.setPayment_state(payment_state);

		dao.insert(usedbooktransactionVO);

		return usedbooktransactionVO;
	}

	public UsedbookTransactionVO updateUsedbookTransaction(String po_no, String book_state, byte[] book_state_pic, 
			Integer udb_sale_price, Integer udb_order_state_no, Integer prod_state, Integer payment_state) {

		UsedbookTransactionVO usedbooktransactionVO = new UsedbookTransactionVO();

		usedbooktransactionVO.setPo_no(po_no);
		usedbooktransactionVO.setBook_state(book_state);
		usedbooktransactionVO.setBook_state_pic(book_state_pic);
		usedbooktransactionVO.setUdb_sale_price(udb_sale_price);
		usedbooktransactionVO.setUdb_order_state_no(udb_order_state_no);
		usedbooktransactionVO.setProd_state(prod_state);
		usedbooktransactionVO.setPayment_state(payment_state);		
		dao.update(usedbooktransactionVO);

		return usedbooktransactionVO;
	}

	public void deleteUsedbookTransaction(String po_no) {
		dao.delete(po_no);
	}

	public UsedbookTransactionVO getOneUsedbookTransactionPONo(String po_no) {
		return dao.findByPrimaryKeyPoNo(po_no);
	}
	public UsedbookTransactionVO getOneUsedbookTransactionSeller(String seller_mem_id) {
		return dao.findByPrimaryKeySeller(seller_mem_id);
	}
	public UsedbookTransactionVO getOneUsedbookTransaction(String buyer_mem_id) {
		return dao.findByPrimaryKeyBuyer(buyer_mem_id);
	}

	public List<UsedbookTransactionVO> getAll() {
		return dao.getAll();
	}
	
}
