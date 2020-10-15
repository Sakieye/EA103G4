package com.publishers.model;

import java.util.*;


public interface PublisherDAO_interface {
	public void insert(Publisher publisher);
	public void update(Publisher publisher);
	public Publisher findByPrimaryKey(String publisher_id);
	public List<Publisher> getAll();
	public List<Publisher> findByPublisherName(String publisher_name);
	public Publisher findOneByPublisherName(String publisher_Name);
}
