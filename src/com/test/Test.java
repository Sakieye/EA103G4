package com.test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.Set;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.catalina.tribes.util.Arrays;

import com.book.model.Book;
import com.book.model.BookDAO;
import com.book.model.BookDAOImpl;
import com.book.model.BookService;
import com.category.model.CategoryDAO;
import com.category.model.CategoryDAOImpl;
import com.category.model.CategoryService;
import com.promo.model.Promo;
import com.promo.model.PromoDAO;
import com.promo.model.PromoDAOImpl;
import com.promo.model.PromoService;
import com.promodetail.model.PromoDetailDAO;
import com.promodetail.model.PromoDetailDAOImpl;
import com.promodetail.model.PromoDetailService;

import oracle.jdbc.pool.OracleDataSource;

public class Test {

	public static void main(String[] args) throws NamingException, SQLException {
		List<Integer> l = new ArrayList<Integer>();

	

		System.out.println(Arrays.toString(l.toArray()));
		System.out.println(Arrays.toString(l.subList(0, l.size() / 2).toArray()));
		System.out.println(Arrays.toString(l.subList(l.size() / 2, l.size()).toArray()));
	}
}
