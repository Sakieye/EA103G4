package test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

public class Test {

	public static void main(String[] args) throws NamingException, SQLException {
		List<String> errorMsgs = new ArrayList<String>();
		errorMsgs.add("e1");
		errorMsgs.add("e2");
		errorMsgs.add("e3");
		System.out.println(errorMsgs);

	}
}
