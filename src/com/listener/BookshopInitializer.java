package com.listener;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

import com.book.model.BookDAO;
import com.book.model.BookDAOImpl;
import com.book.model.BookService;
import com.bookpic.model.BookPicDAO;
import com.bookpic.model.BookPicDAOImpl;
import com.bookpic.model.BookPicService;
import com.category.model.CategoryDAO;
import com.category.model.CategoryDAOImpl;
import com.category.model.CategoryService;
import com.language.model.LanguageDAO;
import com.language.model.LanguageDAO_interface;
import com.language.model.LanguageService;
import com.promo.model.PromoDAO;
import com.promo.model.PromoDAOImpl;
import com.promo.model.PromoService;
import com.promodetail.model.PromoDetailDAO;
import com.promodetail.model.PromoDetailDAOImpl;
import com.promodetail.model.PromoDetailService;
import com.publishers.model.PublisherDAO;
import com.publishers.model.PublisherDAO_interface;
import com.publishers.model.PublisherService;

import redis.clients.jedis.JedisPool;
import tools.JedisUtil;

@WebListener
public class BookshopInitializer implements ServletContextListener {
	public void contextInitialized(ServletContextEvent sce) {
		DataSource dataSource = getDataSource();
		ServletContext context = sce.getServletContext();

		BookDAO bookDAO = new BookDAOImpl(dataSource);
		context.setAttribute("bookService", new BookService(bookDAO));

		CategoryDAO categoryDAO = new CategoryDAOImpl(dataSource);
		context.setAttribute("categoryService", new CategoryService(categoryDAO));

		BookPicDAO bookPicDAO = new BookPicDAOImpl(dataSource);
		context.setAttribute("bookPicService", new BookPicService(bookPicDAO));

		PromoDAO promoDAO = new PromoDAOImpl(dataSource);
		context.setAttribute("promoService", new PromoService(promoDAO));
		
		PromoDetailDAO promoDetailDAO = new PromoDetailDAOImpl(dataSource);
		context.setAttribute("promoDetailService", new PromoDetailService(promoDetailDAO));

		PublisherDAO_interface publisherDAO_interface = new PublisherDAO(dataSource);
		context.setAttribute("publisherService", new PublisherService(publisherDAO_interface));
		
		LanguageDAO_interface languageDAO_interface = new LanguageDAO(dataSource);
		context.setAttribute("languageService", new LanguageService(languageDAO_interface));
				
	}

	private DataSource getDataSource() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			return (DataSource) envContext.lookup("jdbc/bookshop");
		} catch (NamingException e) {
			throw new RuntimeException(e);
		}
	}
	
}
