package com.oracle.mapper;

import com.oracle.web.bean.Admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table admin
	 *
	 * @mbg.generated Wed May 08 12:26:45 CST 2019
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table admin
	 *
	 * @mbg.generated Wed May 08 12:26:45 CST 2019
	 */
	int insert(Admin record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table admin
	 *
	 * @mbg.generated Wed May 08 12:26:45 CST 2019
	 */
	Admin selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table admin
	 *
	 * @mbg.generated Wed May 08 12:26:45 CST 2019
	 */
	List<Admin> selectAll();

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table admin
	 *
	 * @mbg.generated Wed May 08 12:26:45 CST 2019
	 */
	int updateByPrimaryKey(Admin record);

	Admin login(String username);

	Admin showAdmin(String uname);

	Admin validatePassword(Admin admin);

	Admin updatePassword(@Param("username") String uname, @Param("password")String newpassword);

}