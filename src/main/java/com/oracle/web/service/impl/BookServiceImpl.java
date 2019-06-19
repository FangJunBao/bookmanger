package com.oracle.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.oracle.mapper.BookMapper;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.SubBook;
import com.oracle.web.service.BookService;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookMapper bookMapper;

	@Override
	@Transactional(readOnly=true)
	public List<SubBook> list() {
		// TODO Auto-generated method stub
		return this.bookMapper.selectWithOneSQL();
	}

	@Override
	@Transactional
	public int save(Book book) {
		// TODO Auto-generated method stub
		return this.bookMapper.insert(book);
	}

//	@Override
//	@Transactional
//	public void delete(Book book) {
//		// TODO Auto-generated method stub
//		this.bookMapper.deleteByPrimaryKey(book.getBid());
//	}

	@Override
	@Transactional
	public Book queryOneBook(Integer bid) {
		// TODO Auto-generated method stub
		return this.bookMapper.selectByPrimaryKey(bid);
	}

	@Override
	@Transactional
	public void update(Book book) {
		// TODO Auto-generated method stub
		this.bookMapper.updateByPrimaryKey(book);
	}

	@Override
	@Transactional
	public PageBean<SubBook> showByPage(Integer pageNow) {
		// TODO Auto-generated method stub
		PageBean<SubBook> pb = new PageBean<SubBook>();

		// 当前页的数据
		PageHelper.startPage(pageNow, 4);

		// 已经是分页好的数据了
		List<SubBook> list = this.bookMapper.showByPageHelper();

		pb.setBeanList(list);

		// 总记录数
		PageInfo<SubBook> pi = new PageInfo<SubBook>(list);

		pb.setCounts((int) pi.getTotal());

		// 当前页
		pb.setPageNow(pi.getPageNum());

		// 每页显示的条数，自定义
		pb.setPageSize(pi.getPageSize());

		return pb;
	}

	@Override
	@Transactional
	public void deleteMany(String[] arr) {
		// TODO Auto-generated method stub
		this.bookMapper.deleteByPrimaryKey(arr);
	}

	@Override
	@Transactional
	public List<Book> queryBooks(String[] arr) {
		// TODO Auto-generated method stub
		return this.bookMapper.queryBooks(arr);
	}

	@Override
	@Transactional
	public List<Book> list2() {
		// TODO Auto-generated method stub
		return this.bookMapper.selectAll2();
	}

}
