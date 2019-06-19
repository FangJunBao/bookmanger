package com.oracle.web.service;

import com.oracle.web.bean.Admin;

public interface AdminService {

	int save(Admin admin);

	Admin login(String username);

	Admin showAdmin(String uname);

	Admin validatePassword(Admin admin);

	Admin updatePassword(String uname, String newpassword);
	
}
