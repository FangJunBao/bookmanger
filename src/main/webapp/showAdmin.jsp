<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
     $(function(){
    	 
    	 $("tr:even").css("background-color","#FFFFF0");
    	 $("tr:odd").css("background-color","#B0E0E6");
     });
</script>
<title>查看管理员信息</title>
</head>
<body align="center" background="imgs/3.jpg">
		<caption>
			<font size="7" face="宋体">查看管理员信息</font>
		</caption>
		<h1 class="text-center text-danger"><span class="glyphicon glyphicon-user"></span></h1>

		<table bordercolor="#993300" border="1" align="center" width="500px"
			height="300px" cellspacing="0">
			<tr align="center">
				<td>编号</td>
				<td>${admin.id}</td>
			</tr>
			
			<tr align="center">
			    <td>头像</td>
				<td><img src="touxiang/${sessionScope.touxiang }" style="width:60px;height:50px" class="img-circle img-responsive"/></td>
			</tr>
			
			<tr align="center">
				<td>姓名</td>
				<td>${admin.name}</td>
			</tr>
			
			<tr align="center">
				<td>手机</td>
				<td>${admin.phone}</td>
			</tr>
			
			
			<tr align="center">
				<td>账号</td>
				<td>${admin.username}</td>
			</tr>
			<tr align="center">
				<td>密码</td>
				<td><input type="password" value="${admin.password}" disabled="disabled"/></td>
			</tr>
			
		</table>
</body>
</html>