package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

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

import com.oracle.utils.DownUtils;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.PageBean;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class FenleiHandler {
	@Autowired
	private FenleiService fenleiService;

	@RequestMapping(value = "/monsters", method = RequestMethod.GET)
	public String list(Integer pageNow, HttpServletRequest request) {

		if (pageNow == null || pageNow < 1) {

			pageNow = 1;

		}

		PageBean<Fenlei> pb = fenleiService.selectAllPage(pageNow);

		request.setAttribute("pb", pb);

		System.out.println(pb);

		return "showFenlei";
	}

	@RequestMapping(value = "/addfenlei", method = RequestMethod.POST)
	public String add(Fenlei fenlei) {

		fenleiService.insert(fenlei);

		System.out.println(fenlei);

		return "redirect:/monsters";
	}

	@RequestMapping(value = "/monster/{id}", method = RequestMethod.GET)
	public String updateUI(@PathVariable("id") Integer id, HttpSession session) {

		Fenlei fenlei = fenleiService.queryOneMonster(id);

		session.setAttribute("m", fenlei);

		return "redirect:/updateFenlei.jsp";
	}

	@RequestMapping(value = "/monster", method = RequestMethod.PUT)
	public String update(Fenlei fenlei) {

		fenleiService.update(fenlei);

		System.out.println(fenlei);

		return "redirect:/monsters";

	}

	@RequestMapping(value = "/deletemonster/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable("id") String ids) {

        String[] arr=ids.split(",");
		
		for(String string:arr){
			
			System.out.println(string);
		}
	
		fenleiService.delete(arr);

		return "redirect:/monsters";
	}
	
	@RequestMapping(value="/outSelect/{ids}",method=RequestMethod.GET)
   	public String  outSelect(@PathVariable("ids") String ids,HttpServletRequest request,HttpServletResponse response) throws IOException{
    	
    	String [] arr=ids.split(",");
    	
    	List<Fenlei> list=fenleiService.showUserByIds(arr);
    	
    	String key="勾选";
    	
		HSSFWorkbook workbook = new HSSFWorkbook();// 1.创建一个工作簿

		HSSFSheet sheet = workbook.createSheet("分类信息表");//2. 创建一个工作表
        
		//设置单元格宽度
		
		sheet.setColumnWidth(4, 15*256);
		
		//3.创建行，并在行中写入数据（）
		
		//设置表头样式/颜色/对齐方式
		
		HSSFCellStyle style=workbook.createCellStyle();
		
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//居中
		
		HSSFFont font=workbook.createFont();//设置字体颜色
		
		font.setBold(true);
		
		font.setColor(HSSFFont.COLOR_RED);
		
		style.setFont(font);
		
		String[] title = {"编号", "姓名"};

		HSSFRow row = sheet.createRow(0);
		
		for (int i = 0; i < title.length; i++) {
			
			HSSFCell cell = row.createCell(i);
           
			cell.setCellStyle(style);
			
			cell.setCellValue(title[i]);

		}
	
		//4.把list里面数据放进去
		
		//创建一个样式对象
      
		HSSFCellStyle style2=workbook.createCellStyle();
       
       style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
       for (int i = 0; i < list.size(); i++) {//循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始

			Fenlei fenlei = list.get(i);

			HSSFCell cell1 = row2.createCell(0);

			cell1.setCellStyle(style2);

			cell1.setCellValue(fenlei.getfId());

			HSSFCell cell2 = row2.createCell(1);

			cell2.setCellStyle(style2);

			cell2.setCellValue(fenlei.getFname());
			
		}
		//把内存中的数据输出到硬盘上
		
        File f=new File("分类信息.xls");
		
		OutputStream outputStream=new FileOutputStream(f);
		
		workbook.write(outputStream);//把工作簿的内容保存到person.xls上
		
		//相应浏览器
		
		String file=f.getName();
		
		//file=new String(file.getBytes("ISO-8859-1"),"UTF-8");
		
		String mime=request.getSession().getServletContext().getMimeType(file);
		
		String fileName=DownUtils.filenameEncoding(key+f.getName(), request);   
		
		String dispostition="attachment;filename="+fileName;
		
		response.setHeader("Content-Type", mime);
		
		response.setHeader("Content-DisPosition", dispostition);
		
		InputStream inputStream=new FileInputStream(file);
		
		ServletOutputStream out=response.getOutputStream();
		
		IOUtils.copy(inputStream, out);
		
		return null;
	
	}
	
	@RequestMapping(value="/outAll",method=RequestMethod.GET)
	public String outAll(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
        List<Fenlei> list=fenleiService.list2();
    	
    	String key="全部";
    	
    	HSSFWorkbook workbook = new HSSFWorkbook();// 1.创建一个工作簿

		HSSFSheet sheet = workbook.createSheet("分类信息表");//2. 创建一个工作表
        
		//设置单元格宽度
		
		sheet.setColumnWidth(4, 15*256);
		
		//3.创建行，并在行中写入数据（）
		
		//设置表头样式/颜色/对齐方式
		
		HSSFCellStyle style=workbook.createCellStyle();
		
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//居中
		
		HSSFFont font=workbook.createFont();//设置字体颜色
		
		font.setBold(true);
		
		font.setColor(HSSFFont.COLOR_RED);
		
		style.setFont(font);
		
		String[] title = {"编号", "姓名"};

		HSSFRow row = sheet.createRow(0);
		
		for (int i = 0; i < title.length; i++) {
			
			HSSFCell cell = row.createCell(i);
           
			cell.setCellStyle(style);
			
			cell.setCellValue(title[i]);

		}
	
		//4.把list里面数据放进去
		
		//创建一个样式对象
      
		HSSFCellStyle style2=workbook.createCellStyle();
       
       style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		
       for (int i = 0; i < list.size(); i++) {//循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始

			Fenlei fenlei = list.get(i);

			HSSFCell cell1 = row2.createCell(0);

			cell1.setCellStyle(style2);

			cell1.setCellValue(fenlei.getfId());

			HSSFCell cell2 = row2.createCell(1);

			cell2.setCellStyle(style2);

			cell2.setCellValue(fenlei.getFname());
			
		}
		//把内存中的数据输出到硬盘上
		
        File f=new File("分类信息.xls");
		
		OutputStream outputStream=new FileOutputStream(f);
		
		workbook.write(outputStream);//把工作簿的内容保存到person.xls上
		
		//相应浏览器
		
		String file=f.getName();
		
		//file=new String(file.getBytes("ISO-8859-1"),"UTF-8");
		
		String mime=request.getSession().getServletContext().getMimeType(file);
		
		String fileName=DownUtils.filenameEncoding(key+f.getName(), request);   
		
		String dispostition="attachment;filename="+fileName;
		
		response.setHeader("Content-Type", mime);
		
		response.setHeader("Content-DisPosition", dispostition);
		
		InputStream inputStream=new FileInputStream(file);
		
		ServletOutputStream out=response.getOutputStream();
		
		IOUtils.copy(inputStream, out);
		
		return null;
	}

}
