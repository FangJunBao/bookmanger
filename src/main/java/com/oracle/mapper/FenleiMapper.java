package com.oracle.mapper;

import com.oracle.web.bean.Fenlei;
import java.util.List;

public interface FenleiMapper {

   
    int deleteByPrimaryKey(Integer fId);
//github.com/yuyichen47947/bookmanager.git

    
    //int insert(Fenlei record);

	//int deleteByPrimaryKey(Integer fId);

    
    Fenlei selectByPrimaryKey(Integer fId);

	int insert(Fenlei record);
    
    List<Fenlei> selectAll();

	//Fenlei selectByPrimaryKey(Integer fId);

    //int updateByPrimaryKey(Fenlei record);

	int updateByPrimaryKey(Fenlei record);
	
    int selectCount();

	List<Fenlei> selectBypage(int index);
	
	List<Fenlei> sesectAllBypage();
	
	int deleteByPrimaryKey(String[] arr);

	List<Fenlei> showUserById(String[] arr);

	List<Fenlei> selectAll2();
}