package com.usedbooktransaction.model;

import java.util.List;

import com.admins.model.AdminsVO;

public interface UsedbookTransactionDAO_interface {
	public void insert(UsedbookTransactionVO usedbooktransactionVO);
	public void update(UsedbookTransactionVO usedbooktransactionVO);
	public void delete(String po_no);
	public UsedbookTransactionVO findByPrimaryKeySeller(String seller_mem_id);
	public UsedbookTransactionVO findByPrimaryKeyBuyer(String buyer_mem_id);
	public UsedbookTransactionVO findByPrimaryKeyPoNo(String po_no);
	public List<UsedbookTransactionVO> getAll();

}
