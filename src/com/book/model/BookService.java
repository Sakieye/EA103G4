package com.book.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.category.model.Category;
import com.category.model.CategoryService;

public class BookService {
	private final BookDAO bookDAO;

	public BookService(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}

	public Optional<Book> addBook(String publisherID, String languageID, String categoryID, String bookName,
			String isbn, String author, Double listPrice, Double salePrice, Double bookBP, Integer isSold,
			Date publicationDate, Integer stock, Integer safetyStock, String bookIntro, String bookNameOriginal) {
		// insert時，salePricePromo, bookBPPromo, EffectivePromos皆為空(null)
		Book book = new Book(null, publisherID, languageID, categoryID, bookName, isbn, author, listPrice, salePrice,
				bookBP, isSold, publicationDate, stock, safetyStock, bookIntro, bookNameOriginal, Double.NaN,
				Double.NaN, null);
		bookDAO.insert(book);

		Map<String, String> map = new HashMap<String, String>();
		map.put("isbn", isbn);
		map.put("bookName", bookName);

		return Optional.ofNullable(bookDAO.advSearch(map).get(0));
	}

	// 傳入ID回傳Optional<null>或Optional<Book>，必須先用Optional<Book>
	// book.isPresent()確認裡面不是null後才能用Optional<Book> book.get()取出VO
	public Optional<Book> getByBookID(String bookID) {
		return bookDAO.findByBookID(bookID);
	}

	public List<Book> getByBookISBN(String isbn) {
		return bookDAO.findByISBN(isbn);
	}

	public List<Book> getByBookName(String bookName) {
		return bookDAO.findByBookName(bookName);
	}

	public List<Book> getByAuthor(String author) {
		return bookDAO.findByAuthor(author);
	}

	public List<Book> getByPublisherName(String publisherName) {
		return bookDAO.findByPublisherName(publisherName);
	}

	public List<Book> getByCategoryID(String categoryID) {
		return bookDAO.findByCategoryID(categoryID);
	}

	public List<Book> getByParentCategoryID(String parentCategoryID, CategoryService categoryService) {
		List<Book> books = new ArrayList<Book>();

		if (parentCategoryID == null) {
			return books;
		}

		// 將本身加入books
		books.addAll(bookDAO.findByCategoryID(parentCategoryID));
		List<Category> childCategories = categoryService.getByParentCategoryID(parentCategoryID);

		childCategories.forEach(childCategory -> {
			String childCategoryID = childCategory.getCategoryID();

			List<Category> grandChildCategories = categoryService.getByParentCategoryID(childCategoryID);
			// 有子類別且該子類別下有其他子類別
			grandChildCategories.forEach(grandChildCategory -> {
				books.addAll(bookDAO.findByCategoryID(grandChildCategory.getCategoryID()));
			});

			books.addAll(bookDAO.findByCategoryID(childCategoryID));
		});

		return books;
	}

	public List<Book> getByAdvSearch(Map<String, String> map) {
		return bookDAO.advSearch(map);
	}

	public List<Book> getAll() {
		return bookDAO.getAll();
	}

	public Optional<Book> updateBook(String bookID, String publisherID, String languageID, String categoryID,
			String bookName, String isbn, String author, Double listPrice, Double salePrice, Double bookBP, Integer isSold,
			Date publicationDate, Integer stock, Integer safetyStock, String bookIntro, String bookNameOriginal) {
		// 一般update時，無法修改salePricePromo, bookBPPromo, promoEndTime
		// effectivePromos，但建構需傳入參數，暫時傳入NaN和null，但實際update方法並不會更新這幾格
		Book book = new Book(bookID, publisherID, languageID, categoryID, bookName, isbn, author, listPrice, salePrice,
				bookBP, isSold, publicationDate, stock, safetyStock, bookIntro, bookNameOriginal, Double.NaN,
				Double.NaN, null);
		bookDAO.update(book);

		return getByBookID(bookID);
	}

	public Optional<Book> updateBookSalePricePromo(String bookID, Double salePricePromo) {
		bookDAO.updateSalePricePromo(bookID, salePricePromo);
		return getByBookID(bookID);
	}

	public List<Book> getByBookIDList(List<String> bookIDs) {
		return bookDAO.findByBookIDList(bookIDs);
	}

	public List<Book> updateBookSalePricePromoBatch(List<String> bookIDs, List<Double> salePricePromos) {
		if (bookIDs.size() == salePricePromos.size()) {
			bookDAO.updateSalePricePromoBatch(bookIDs, salePricePromos);
		}
		return getByBookIDList(bookIDs);
	}

	public List<Book> updateBookBPPromoBatch(List<String> bookIDs, List<Double> bookBPPromos) {
		if (bookIDs.size() == bookBPPromos.size()) {
			bookDAO.updateBPPromoBatch(bookIDs, bookBPPromos);
		}
		return getByBookIDList(bookIDs);
	}

	public List<Book> updateBookIsSoldBatch(List<String> bookIDs, Integer isSold) {
		bookDAO.updateIsSoldBatch(bookIDs, isSold);
		return getByBookIDList(bookIDs);
	}

	public List<Book> updateEffPromoBatch(List<String> bookIDs, List<String> effectivePromos) {
		bookDAO.updateEffPromoBatch(bookIDs, effectivePromos);
		return getByBookIDList(bookIDs);
	}

	public List<Book> addBookBatch(List<Book> books) {
		bookDAO.insertBatch(books);
		List<String> bookIDs = new ArrayList<String>();
		books.forEach(book -> bookIDs.add(book.getBookID()));
		return getByBookIDList(bookIDs);
	}

	public String updateEffPromos(String effectivePromos) {
		bookDAO.updateEffPromos(effectivePromos);
		return effectivePromos;
	}

	public List<Book> updateBooks(List<Book> books) {
		bookDAO.updateBatch(books);
		List<String> bookIDs = new ArrayList<String>();
		books.forEach(book -> bookIDs.add(book.getBookID()));
		return getByBookIDList(bookIDs);
	}
}
