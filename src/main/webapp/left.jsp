<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="jquery-ui.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<style>
#accordion {
	width: 480px
}


li {
	list-style-type: none;
	padding-top: 5px;
}


a {
	text-decoration: none;
}
</style>
<script type="text/javascript">
	$(function() {
		//	$("#date").datepicker();
		$("#accordion").accordion();


	});
</script>
</head>
<body background="">
	<h1 class="demoHeaders">
		<font color="black" algin="center">菜单</font>
	</h1>
	<div id="accordion">
		<h1>
			分类管理
			</h2>
			<div>
				<ul>
					<li><a href="addFenlei.jsp" target="right"><span
							class="ui-icon ui-icon-star"></span>添加分类</a></li>
					<li><a href="monsters" target="right"><span
							class="ui-icon ui-icon-star"></span>查看分类</a></li>
				</ul>
			</div>


			<h2>图书管理</h2>
			<div>
				<ul>
					<li><a href="addUI" target="right"><span
							class="ui-icon ui-icon-star"></span>添加图书</a></li>
					<li><a href="showByPage" target="right"><span
							class="ui-icon ui-icon-star"></span>查看图书</a></li>
				</ul>
			</div>
			 
			  <h3>用户管理</h3>
		<div>
				<li><a  href="addUser.jsp" target="right"><span class="ui-icon ui-icon-circle-plus"></span>添加用户</a></li>
				<li><a href="users" target="right"  ><span class="ui-icon ui-icon-copy"></span>查看用户</a></li>
					 
	  </div>
			
		<h2>管理员信息管理</h2>
		<div>
			<ul>
				<li><a href="showAdmin" target="right"><span
						class="ui-icon ui-icon-star"></span>查看管理员信息</a></li>
				<li>
			<a href="updatePassword.jsp" target="right"><span
					class="ui-icon ui-icon-star"></span>修改密码</a>
				</li>
				<li>
			<a href="login.jsp" target="_parent"><span
					class="ui-icon ui-icon-star"></span>退出系统</a>
				</li>
				</ul>
		</div>


	</div>


</body>
</html>