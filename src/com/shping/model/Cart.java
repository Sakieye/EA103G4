package com.shping.model;

import java.io.Serializable;

public class Cart implements Serializable {
	private static final long serialVersionUID = 06L;
	
	private String isbn;
	private String book_Name;
	private String publisher_Id;
	private Integer order_Qty;
	private Double price;
	private Double book_BP;
	
	


	public Cart() {
		super();
		isbn = "";
		book_Name ="";
		publisher_Id ="";
		order_Qty = 0;
		price = 0.0;
	}



	public Double getBook_BP() {
		return book_BP;
	}



	public void setBook_BP(Double book_BP) {
		this.book_BP = book_BP;
	}



	public String getIsbn() {
		return isbn;
	}


	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}


	public String getBook_Name() {
		return book_Name;
	}


	public void setBook_Name(String book_Name) {
		this.book_Name = book_Name;
	}


	public String getPublisher_Id() {
		return publisher_Id;
	}


	public void setPublisher_Id(String publisher_Id) {
		this.publisher_Id = publisher_Id;
	}


	public Integer getOrder_Qty() {
		return order_Qty;
	}


	public void setOrder_Qty(Integer order_Qty) {
		this.order_Qty = order_Qty;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}




//	@Override
//	public String toString() {
//		return "Cart [ISBN =" + isbn +", BookName=" + book_Name + ",  Publisher=" + publisher_Id + ", Price=" + price
//				+ ", Quantity=" + order_Qty + "]";
//	}
//
//	@Override
//	public int hashCode() {
//		final int prime = 31;
//		int result = 1;
//		result = prime * result + ((book_Name == null) ? 0 : book_Name.hashCode());
//		return result;
//	}
//
//	@Override
//	public boolean equals(Object obj) {
//		if (this == obj)
//			return true;
//		if (obj == null)
//			return false;
//		if (getClass() != obj.getClass())
//			return false;
//		Cart other = (Cart) obj;
//		if (book_Name == null) {
//			if (other.book_Name != null)
//				return false;
//		} else if (!book_Name.equals(other.book_Name))
//			return false;
//		return true;
//	}
	
	

}
