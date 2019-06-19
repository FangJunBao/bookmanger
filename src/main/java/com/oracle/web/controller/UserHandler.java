package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.utils.DownUtils;
import com.oracle.web.bean.PageBean;
import com.oracle.web.bean.User;
import com.oracle.web.service.UserService;

@Controller
@Scope(value = "prototype")
public class UserHandler {

	@Autowired
	private UserService userService;

	// 验证用户
	@RequestMapping(value = "/validateUser", method = RequestMethod.GET)
	public String validateUser(String username, HttpServletResponse response) throws IOException {

		System.out.println(username);

		User a = this.userService.validateUser(username);

		if (a != null) {

			response.getWriter().write("{\"valid\":\"false\"}");// 存在
		} else {

			response.getWriter().write("{\"valid\":\"true\"}");// 不存在
		}

		return null;
	}

	// @RequestMapping(value="/users",method=RequestMethod.GET)
	// public String Users(HttpServletRequest request){
	//
	// List<User> list=userService.list();
	//
	// request.setAttribute("uList", list);
	//
	// return "showUser";
	//
	// }

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public String list(Integer pageNow, HttpServletRequest request) {

		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}

		PageBean<User> pb = userService.selectAllPage(pageNow);

		// System.out.println(pb);

		request.setAttribute("pb", pb);

		return "showUser";

	}

	// @RequestMapping(value = "/addUI", method = RequestMethod.GET)
	// public String addUI(HttpServletRequest request) {
	//
	// List<User> list = userService.list();
	//
	// request.setAttribute("List", list);
	//
	// return "addUser";
	// }

	// @RequestMapping(value = "/user", method = RequestMethod.POST)
	// public String add(User user) {
	//
	// userService.save(user);
	//
	// return "redirect:/users";
	// }

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String add(String name, MultipartFile touxiang, String username, String password, String phone, String date,
			HttpSession session) throws Exception {

		String realPath = session.getServletContext().getRealPath("/upload");

		int hashCode = touxiang.getOriginalFilename().hashCode();

		String hex = Integer.toHexString(hashCode);

		char c1 = hex.charAt(0);

		char c2 = hex.charAt(1);

		String redlName = UUID.randomUUID().toString() + "_" + touxiang.getOriginalFilename();

		String savepath = "/" + c1 + "/" + c2 + "/" + redlName;

		File saveFile = new File(realPath + savepath);

		saveFile.mkdirs();

		touxiang.transferTo(saveFile);

		String realsavepath = "upload" + savepath;

		System.out.println(realsavepath);

		System.out.println("date=" + date);

		User user = new User(null, name, realsavepath, username, password, phone, date);

		int i = this.userService.save(user);

		session.setAttribute("url", realsavepath);

		if (i > 0) {

			return "redirect:/users";

		} else {

			return "addUser";
		}

	}

	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") String ids) {

		 String[] arr = ids.split(",");
			
			for(String str : arr){
				
				System.out.println(str);
			}
			
			userService.delete1(arr);
		
//		User user = new User();
//
//		user.setId(id);
//
//		userService.delete(user);

		return "redirect:/users";
	}

	@RequestMapping(value = "/user/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id, HttpSession session) {

		User user = userService.queryOneUser(id);

		session.setAttribute("u", user);

		return "redirect:/changeUser.jsp";

	}

	@RequestMapping(value = "/user", method = RequestMethod.PUT)
	public String update(User user) {

		userService.update(user);

		System.out.println(user);

		return "redirect:/users";

	}

	// 修改头像
	@RequestMapping(value = "/updateTouxiang", method = RequestMethod.POST)
	public String updateTouxiang(Integer id, MultipartFile touxiang, HttpSession session) throws Exception {

		String realPath = session.getServletContext().getRealPath("/upload");

		int hashCode = touxiang.getOriginalFilename().hashCode();

		String hex = Integer.toHexString(hashCode);

		char c1 = hex.charAt(0);

		char c2 = hex.charAt(1);

		String redlName = UUID.randomUUID().toString() + "_" + touxiang.getOriginalFilename();

		String savepath = "/" + c1 + "/" + c2 + "/" + redlName;

		File saveFile = new File(realPath + savepath);

		saveFile.mkdirs();

		touxiang.transferTo(saveFile);

		User user = new User();

		String realsavepath = "upload" + savepath;

		user.setId(id);

		user.setTouxiang(realsavepath);

		this.userService.updateTouxoiang(user);

		return "redirect:/user/" + id;

	}

	// 6.选择导出用户
	@RequestMapping(value = "/outSelectUser/{ids}", method = RequestMethod.GET)
	public String outSelect(@PathVariable("ids") String ids, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String[] arr = ids.split(",");

		List<User> list = userService.showUserByIds(arr);

		String key = "勾选";

		HSSFWorkbook workbook = new HSSFWorkbook();// 1.创建一个工作簿

		HSSFSheet sheet = workbook.createSheet("用户信息表");// 2. 创建一个工作表

		// 设置单元格宽度

		sheet.setColumnWidth(4, 15 * 256);

		// 3.创建行，并在行中写入数据（）

		// 设置表头样式/颜色/对齐方式

		HSSFCellStyle style = workbook.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中

		HSSFFont font = workbook.createFont();// 设置字体颜色

		font.setBold(true);

		font.setColor(HSSFFont.COLOR_RED);

		style.setFont(font);

		String[] title = { "编号", "姓名", "用户名", "密码", "手机", "注册时间" };

		HSSFRow row = sheet.createRow(0);

		for (int i = 0; i < title.length; i++) {

			HSSFCell cell = row.createCell(i);

			cell.setCellStyle(style);

			cell.setCellValue(title[i]);

		}

		// 4.把list里面数据放进去

		// 创建一个样式对象

		HSSFCellStyle style2 = workbook.createCellStyle();

		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		for (int i = 0; i < list.size(); i++) {// 循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始

			User user = list.get(i);

			HSSFCell cell1 = row2.createCell(0);

			cell1.setCellStyle(style2);

			cell1.setCellValue(user.getId());

			HSSFCell cell2 = row2.createCell(1);

			cell2.setCellStyle(style2);

			cell2.setCellValue(user.getName());

			HSSFCell cell3 = row2.createCell(2);

			cell3.setCellStyle(style2);

			cell3.setCellValue(user.getUsername());

			HSSFCell cell4 = row2.createCell(3);

			cell4.setCellStyle(style2);

			cell4.setCellValue(user.getPassword());

			HSSFCell cell5 = row2.createCell(4);

			cell5.setCellStyle(style2);

			cell5.setCellValue(user.getPhone());

			HSSFCell cell6 = row2.createCell(5);

			cell6.setCellStyle(style2);

			cell6.setCellValue(user.getDate());

		}
		// 把内存中的数据输出到硬盘上

		File f = new File("用户信息.xls");

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容保存到person.xls上

		// 相应浏览器

		String file = f.getName();

		// file=new String(file.getBytes("ISO-8859-1"),"UTF-8");

		String mime = request.getSession().getServletContext().getMimeType(file);

		String fileName = DownUtils.filenameEncoding(key + f.getName(), request);

		String dispostition = "attachment;filename=" + fileName;

		response.setHeader("Content-Type", mime);

		response.setHeader("Content-DisPosition", dispostition);

		InputStream inputStream = new FileInputStream(file);

		ServletOutputStream out = response.getOutputStream();

		IOUtils.copy(inputStream, out);

		return null;

	}

	@RequestMapping(value = "/outAllUser", method = RequestMethod.GET)
	public String outAll(HttpServletRequest request, HttpServletResponse response) throws IOException {

		List<User> list = userService.list2();

		String key = "全部";

		HSSFWorkbook workbook = new HSSFWorkbook();// 1.创建一个工作簿

		HSSFSheet sheet = workbook.createSheet("用户信息表");// 2. 创建一个工作表

		// 设置单元格宽度

		sheet.setColumnWidth(4, 15 * 256);

		// 3.创建行，并在行中写入数据（）

		// 设置表头样式/颜色/对齐方式

		HSSFCellStyle style = workbook.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中

		HSSFFont font = workbook.createFont();// 设置字体颜色

		font.setBold(true);

		font.setColor(HSSFFont.COLOR_RED);

		style.setFont(font);

		String[] title = { "编号", "姓名", "用户名", "密码", "手机", "注册时间" };

		HSSFRow row = sheet.createRow(0);

		for (int i = 0; i < title.length; i++) {

			HSSFCell cell = row.createCell(i);

			cell.setCellStyle(style);

			cell.setCellValue(title[i]);

		}

		// 4.把list里面数据放进去

		// 创建一个样式对象

		HSSFCellStyle style2 = workbook.createCellStyle();

		style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		for (int i = 0; i < list.size(); i++) {// 循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始

			User user = list.get(i);

			HSSFCell cell1 = row2.createCell(0);

			cell1.setCellStyle(style2);

			cell1.setCellValue(user.getId());

			HSSFCell cell2 = row2.createCell(1);

			cell2.setCellStyle(style2);

			cell2.setCellValue(user.getName());

			HSSFCell cell3 = row2.createCell(2);

			cell3.setCellStyle(style2);

			cell3.setCellValue(user.getUsername());

			HSSFCell cell4 = row2.createCell(3);

			cell4.setCellStyle(style2);

			cell4.setCellValue(user.getPassword());

			HSSFCell cell5 = row2.createCell(4);

			cell5.setCellStyle(style2);

			cell5.setCellValue(user.getPhone());

			HSSFCell cell6 = row2.createCell(5);

			cell6.setCellStyle(style2);

			cell6.setCellValue(user.getDate());

		}
		// 把内存中的数据输出到硬盘上

		File f = new File("用户信息.xls");

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容保存到person.xls上

		// 相应浏览器

		String file = f.getName();

		// file=new String(file.getBytes("ISO-8859-1"),"UTF-8");

		String mime = request.getSession().getServletContext().getMimeType(file);

		String fileName = DownUtils.filenameEncoding(key + f.getName(), request);

		String dispostition = "attachment;filename=" + fileName;

		response.setHeader("Content-Type", mime);

		response.setHeader("Content-DisPosition", dispostition);

		InputStream inputStream = new FileInputStream(file);

		ServletOutputStream out = response.getOutputStream();

		IOUtils.copy(inputStream, out);

		return null;
	}

}
