package com.detail.model;

import java.sql.Connection;
import java.util.List;

public interface DetailDAO_Interface {

	void doCreate(DetailVO dtVO , Connection con);
	
	
	public List<DetailVO> findbyid(String order_id); //哲維10/16更改 包括dao service
}
