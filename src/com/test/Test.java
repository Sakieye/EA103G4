package com.test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.naming.NamingException;
import javax.sql.DataSource;

import com.book.model.Book;
import com.book.model.BookDAO;
import com.book.model.BookDAOImpl;
import com.book.model.BookService;

import oracle.jdbc.pool.OracleDataSource;

public class Test {

	public static void main(String[] args) throws NamingException, SQLException {
		OracleDataSource ds;
		ds = new OracleDataSource();
		ds.setDriverType("thin");
		ds.setServerName("localhost");
		ds.setPortNumber(1521);
		ds.setDatabaseName("XE"); // Oracle SID
		ds.setUser("BOOKSHOP");
		ds.setPassword("123456");
		DataSource dataSource = (DataSource) ds;
		BookDAO bookDAO = new BookDAOImpl(dataSource);
		BookService bookService = new BookService(bookDAO);

		Set<String> bookIDs = new HashSet<String>();
		List<Book> books = new ArrayList<Book>();

		books.addAll(bookService.getByBookIDList(new ArrayList<String>(bookIDs)));

		books.forEach(b -> System.out.println(b));
	}
}
