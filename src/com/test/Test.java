package com.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;


public class Test {
	private static final SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd 'at' HH:mm:ss z");

	public Test() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args) throws NamingException {
		Context initContext = new InitialContext();
		Context environmentContext = (Context) initContext.lookup("java:/comp/env");
		String googleMapKey = (String) environmentContext.lookup("googleMapKey");
		System.out.println(googleMapKey);

	}

}
