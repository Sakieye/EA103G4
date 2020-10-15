package com.order.model;

import java.util.List;

import com.detail.model.DetailVO;

public interface OrderDAO_Interface {
	
	void doCreate(OrderVO odvo, List<DetailVO> dtList);
	void update(OrderVO odvo);
	void cancel(String order_id);
	OrderVO findbyid(String order_id);
	List<OrderVO> getAll();
}
