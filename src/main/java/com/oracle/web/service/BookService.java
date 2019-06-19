package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.SubBook;
import com.oracle.web.bean.PageBean;

public interface BookService {
	
	List<SubBook> list();

	int save(Book book);

	//void delete(Book book);

	Book queryOneBook(Integer bid);

	void update(Book book);

	PageBean<SubBook> showByPage(Integer pageNow);

	void deleteMany(String[] arr);

	List<Book> queryBooks(String[] arr);

	List<Book> list2();

}
