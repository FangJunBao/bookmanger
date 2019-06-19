package com.oracle.web.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.web.bean.Admin;
import com.oracle.web.service.AdminService;

@Controller
@Scope(value = "prototype")
public class AdminHandler {

	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/admin")
	public String register(String name, String phone, String username, String password,
			@RequestParam("touxiang") MultipartFile filetx, HttpServletRequest request)
			throws IllegalStateException, IOException {

		String str = request.getSession().getServletContext().getRealPath("/touxiang");

		File file = new File(str + "\\" + filetx.getOriginalFilename());

		filetx.transferTo(file);

		String touxiang = str + "\\" + filetx.getOriginalFilename();

		System.out.println(touxiang);

		Admin admin = new Admin(null, touxiang, name, phone, username, password);

		adminService.save(admin);

		return "login";

	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			Admin admin, HttpSession session) {

		session.setAttribute("username", username);

		session.setAttribute("password", password);

		System.out.println(password);

		Admin a = adminService.login(admin.getUsername());

//		a.setUsername(username);
//		
//		a.setPassword(password);
		
		
		if (a == null) {

			return "login";

		} else if (!a.getPassword().equals(admin.getPassword())) {

			return "login";

		} else {

			String str = a.getTouxiang().substring(a.getTouxiang().lastIndexOf("\\") + 1);

			session.setAttribute("touxiang", str);

			return "index";

		}

	}

	@RequestMapping(value = "/yanzheng", method = RequestMethod.GET)
	public void queryByUsername(@RequestParam("username") String username, HttpServletResponse response)
			throws IOException {

		System.out.println(username);

		Admin a = adminService.login(username);

		if (a != null) {

			response.getWriter().write("{\"valid\":\"false\"}");

		} else {

			response.getWriter().write("{\"valid\":\"true\"}");

		}

	}

	@RequestMapping(value = "/showAdmin", method = RequestMethod.GET)
	public String showAdmin(HttpServletResponse response, HttpServletRequest request, HttpSession session) {

		String uname = (String) session.getAttribute("username");

		Admin a = adminService.showAdmin(uname);

		session.setAttribute("admin", a);

		return "showAdmin";
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	public String updatePassword(@RequestParam("password") String password,
			HttpServletResponse response, HttpServletRequest request, HttpSession session) {

	    String uname=(String) session.getAttribute("username");
		
	    String newpassword=request.getParameter("newpassword");
	    
	    Admin a=adminService.updatePassword(uname,newpassword);
			
        	return "showAdmin";
        

	}

	@RequestMapping(value = "/validatePassword", method = RequestMethod.POST)
	public void queryByPassword(@RequestParam("password") String password,Admin admin, HttpServletResponse response, HttpSession session)
			throws IOException {
		
		System.out.println("ok");
		
		admin.setUsername((String)session.getAttribute("username"));
		
	//	admin.setPassword((String)session.getAttribute("password"));
		
		admin.setPassword(password);		

		System.out.println(admin);
		
		Admin a=adminService.validatePassword(admin);
		
		System.out.println(a);
		
		response.getWriter().write(String.valueOf(a));

	}
}
