package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.PageBean;


public interface FenleiService {

	int insert(Fenlei fenlei);

	void delete(String[] arr);

	void update(Fenlei fenlei);


	 List<Fenlei> list() ;

	Fenlei queryOneMonster(Integer id);

	PageBean<Fenlei> selectByPage(Integer pageNow, int pageSize);

	PageBean<Fenlei> selectAllPage(Integer pageNow);

	List<Fenlei> showUserByIds(String[] arr);

	List<Fenlei> list2();
//github.com/yuyichen47947/bookmanager.git

}
