package com.adminpermission.model;

import java.util.List;
import java.util.Map;


public interface AdminPermissionDAO_interface {
	
	public void insert(AdminPermissionVO adminpermissionVO);
//	public void update(AdminPermissionVO adminpermissionVO);
	public void delete(String admin_id);
	public List<AdminPermissionVO> findByPrimaryKey(String admin_id);
		
	public List<AdminPermissionVO> getAll();
    //查詢某權限管理的管理員(一對多)(回傳 Set)
//	public List<AdminPermissionVO> getAll(Map<String, String[]> map); 

    
}
