package com.oracle.web.service;

import java.util.List;

import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;

public interface UserService {

	List<User> list();
	
	int save(User user);

	void delete(User user);
	
	void update(User user);

	PageBean<User> selectAllPage(Integer pageNow);

	PageBean<User> selectByPage(Integer pageNow, int pageSize);

	User queryOneUser(Integer id);

	List<User> showUserByIds(String[] arr);

	List<User> list2();

	void updateTouxoiang(User user);

	User validateUser(String username);

	void delete1(String[] arr);

}
