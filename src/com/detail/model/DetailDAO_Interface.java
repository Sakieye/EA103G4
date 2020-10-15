package com.detail.model;

import java.sql.Connection;

public interface DetailDAO_Interface {

	void doCreate(DetailVO dtVO , Connection con);
	DetailVO findbyid(String order_id);
	
}
