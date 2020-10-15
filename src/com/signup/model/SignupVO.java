package com.signup.model;

import java.sql.Timestamp;

public class SignupVO {
	private String signup_id;
	private String mem_id;
	private String lc_id;
	private String signup_pay;
	private Integer pay_state;
	private Timestamp signup_time;
	private Timestamp pay_time;
	private String sign_seat;
	
	public String getSignup_id() {
		return signup_id;
	}
	public void setSignup_id(String signup_id) {
		this.signup_id = signup_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getLc_id() {
		return lc_id;
	}
	public void setLc_id(String lc_id) {
		this.lc_id = lc_id;
	}
	public String getSignup_pay() {
		return signup_pay;
	}
	public void setSignup_pay(String signup_pay) {
		this.signup_pay = signup_pay;
	}
	public Integer getPay_state() {
		return pay_state;
	}
	public void setPay_state(Integer pay_state) {
		this.pay_state = pay_state;
	}
	public Timestamp getSignup_time() {
		return signup_time;
	}
	public void setSignup_time(Timestamp signup_time) {
		this.signup_time = signup_time;
	}
	public Timestamp getPay_time() {
		return pay_time;
	}
	public void setPay_time(Timestamp pay_time) {
		this.pay_time = pay_time;
	}
	public String getSign_seat() {
		return sign_seat;
	}
	public void setSign_seat(String sign_seat) {
		this.sign_seat = sign_seat;
	}
	
	
}
