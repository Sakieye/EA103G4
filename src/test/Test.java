package test;

import java.sql.SQLException;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;

import javax.naming.NamingException;
import javax.sql.DataSource;

import com.category.model.Category;
import com.category.model.CategoryDAO;
import com.category.model.CategoryDAOImpl;
import com.category.model.CategoryService;

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
		CategoryDAO categoryDAO = new CategoryDAOImpl(dataSource);
		CategoryService categoryService = new CategoryService(categoryDAO);
		String categoryID1 = "CAT0100000";
		String categoryID2 = "CAT0101000";
		String categoryID3 = "CAT0101001";

		String[] testArr = { categoryID1, categoryID2, categoryID3 };

		for (String categoryID : testArr) {
			Optional<Category> cat = categoryService.getByCategoryID(categoryID);
			if (cat.isPresent()) {
				String categoryName = cat.get().getCategoryName();
				String[] catagoryNameLevel = categoryName.split(",");
				Map<String, String> catLevelMap = new TreeMap<String, String>(); // ID : Name

				for (int i = catagoryNameLevel.length - 1; i > -1; i--) {
					catLevelMap.put(categoryID, catagoryNameLevel[i]);
					categoryID = cat.get().getParentCategoryID();
					cat = categoryService.getByCategoryID(categoryID);

					if (!cat.isPresent()) {
						break;
					}
				}
				catLevelMap.forEach((k, v) -> System.out.println(k + " - " + v));
			}

		}
	}
}
