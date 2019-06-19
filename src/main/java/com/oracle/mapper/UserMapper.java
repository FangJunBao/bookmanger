package com.oracle.mapper;

import com.oracle.web.bean.User;
import java.util.List;

public interface UserMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);
    
    int updateByPrimaryKeySelective(User record);

	int selectCount();

	List<User> selectBypage(int index);

	List<User> selectAllBypage();
	
	List<User> showUserById(String[] arr);

	List<User> selectAll2();

	User selectValidate(String username);

	void deleteByPrimaryKey(String[] arr);

	//void updateByPrimaryKeySelective(User user);

}