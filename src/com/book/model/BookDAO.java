package com.book.model;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface BookDAO {
	void insert(Book book);
	void insertBatch(List<Book> books);
	Optional<Book> findByBookID(String bookID);
	List<Book> findByISBN(String isbn);
	List<Book> findByBookName(String bookName);
	List<Book> findByAuthor(String author);
	List<Book> findByPublisherName(String publisherName);
	List<Book> findByCategoryID(String categoryID);
	List<Book> advSearch(Map<String, String> map);
	List<Book> getAll();
	void update(Book book);
	void updateSalePricePromo(String bookID, Double salePricePromo);
	void updateSalePricePromoBatch(List<String> bookIDs, List<Double> salePricePromos);
	void updateBPPromoBatch(List<String> bookIDs, List<Double> bookBPPromos);
	void updateEffPromoBatch(List<String> bookIDs, List<String> effectivePromos);
	void updateIsSoldBatch(List<String> bookIDs, Integer isSold);
	List<Book> findByBookIDList(List<String> bookIDs);
	void updateEffPromos(String effectivePromos);
	void updateBatch(List<Book> books);
}
