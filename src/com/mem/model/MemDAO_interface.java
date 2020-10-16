package com.mem.model;

import java.util.List;
import java.util.Map;


public interface MemDAO_interface {
	public MemVO insert(MemVO memVO);
    public void update(MemVO memVO);
    public void updatePwd(MemVO memVO);
    public void delete(String mem_id);
    public MemVO findByPrimaryKey(String mem_id);
    public MemVO signIn(String mem_account, String mem_password);
    public List<MemVO> getAll();
    public boolean checkAcc(String mem_account); //檢查帳號
    public boolean checkEmail(String mem_email);	//檢查EMAIL
    public String getMemIdByMail (String mem_email);
    public List<MemVO> getAll(Map<String, String[]> map);
    
}
