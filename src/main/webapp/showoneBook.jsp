<%@ page language="java"
	import="java.util.List,com.oracle.web.bean.User"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改界面</title>
</head>
<body background="imgs/3.jpg">
	
	<form action='Bookservlet?action=updateBook&id=${b.id}' method='post'>

		<caption align=center color=red>
			<h1 align="center">修改图书界面</h1>
		</caption>
		<hr color=red></hr>
		<table align=center height=500px width=1000px border=1>
			
			<input type='hidden' name='id' value='${b.id }%>' />
			<!--  <input type='hidden' name='stuNo' value='${u.id }' />-->
			<tr align='center'>
				<td>书名</td>
				<td><input type='text' name='name' value='${b.name}' /></td>
			</tr>


			<tr align='center'>
				<td>价格</td>
				<td><input type='text' name='jiage' value='${b.jiage }' /></td>
			</tr>

			<tr align='center'>
				<td>出版社：</td>
				<td><input type='text' name='chubanshe'
					value='${b.chubanshe}' /></td>
			</tr>
         
            <tr align='center'>
				<td>状态：</td>
				<td><input type='text' name='zhuangtai'
					value='${b.zhuangtai}' /></td>
			</tr>
            
            <tr align='center'>
				<td>借书人：</td>
				<td><input type='text' name='jieshuren'
					value='${b.jieshuren}' /></td>
			</tr>
            
            <tr align='center'>
				<td>分类：</td>
				<td><input type='text' name='fenlei'
					value='${b.fenlei}' /></td>
			</tr>
            
			
            
			<tr>
				<td align='center' colspan='2'><input type='submit' value='修改' /><button><a
					href='Bookservlet?action=showBookByPage'>取消</a></button></td>
			</tr>
			</table>		
	  </form>

</body>
</html>