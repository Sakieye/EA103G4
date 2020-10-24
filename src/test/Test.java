package test;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;

import javax.naming.NamingException;
import javax.sql.DataSource;

import com.book.model.Book;
import com.book.model.BookDAO;
import com.book.model.BookDAOImpl;
import com.book.model.BookService;
import com.category.model.Category;
import com.category.model.CategoryDAO;
import com.category.model.CategoryDAOImpl;
import com.category.model.CategoryService;
import com.promo.model.PromoDAO;
import com.promo.model.PromoDAOImpl;
import com.promo.model.PromoService;
import com.promodetail.model.PromoDetail;
import com.promodetail.model.PromoDetailDAO;
import com.promodetail.model.PromoDetailDAOImpl;
import com.promodetail.model.PromoDetailService;

import oracle.jdbc.pool.OracleDataSource;

public class Test {
	private static final SimpleDateFormat DATE_FORMATTER = new SimpleDateFormat("yyyy-MM-dd");

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

		List<String> bookIDs = bookService.getByBookIDLike("b0000005");
		bookIDs.forEach(id->System.out.println(id));
		System.out.println(bookIDs.size());

	}
}
