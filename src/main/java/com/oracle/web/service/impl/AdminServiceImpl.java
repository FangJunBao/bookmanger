package com.oracle.web.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oracle.mapper.AdminMapper;
import com.oracle.web.bean.Admin;
import com.oracle.web.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {


	@Autowired
	private AdminMapper adminMapper;

	@Override
	@Transactional
	public int save(Admin admin) {
		// TODO Auto-generated method stub
		return this.adminMapper.insert(admin);
	}

	
	@Override
	@Transactional(readOnly=true)
	public Admin login(String username) {
		// TODO Auto-generated method stub
		return this.adminMapper.login(username);
	}


	@Override
	@Transactional(readOnly=true)
	public Admin showAdmin(String uname) {
		// TODO Auto-generated method stub
		return this.adminMapper.showAdmin(uname);
	}


	@Override
	@Transactional
	public Admin updatePassword(String uname, String newpassword) {
		// TODO Auto-generated method stub
		
		return adminMapper.updatePassword(uname,newpassword);
	}


	@Override
	@Transactional(readOnly=true)
	public Admin validatePassword(Admin admin) {
		// TODO Auto-generated method stub
		return adminMapper.validatePassword(admin);
	}

}
