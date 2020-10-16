package com.order.model;

import java.util.List;
import java.util.Map;

import com.detail.model.DetailVO;

public interface OrderDAO_Interface {
	
	void doCreate(OrderVO odvo, List<DetailVO> dtList);
	void update(OrderVO odvo);
	void cancel(String order_id);
	OrderVO findbyid(String order_id);
	List<OrderVO> getAll();
	//哲維增加
	public List<OrderVO> allSelect(Map<String, String[]> map);
}
