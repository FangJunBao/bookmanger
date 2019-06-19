<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
     $(function(){
    	 
    	 $("tr:even").css("background-color","#FFCC66");
    	 $("tr:odd").css("background-color","#FFE4B5");
     });
</script>
<title>修改用户</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	//1.验证姓名
	function validateName() {
		var name = document.updateUser.name;
		nameReg = /^[\u0391-\uFFE5]{2,10}$/;
		var flag = nameReg.test(name.value);
		var nameMsg = document.getElementById("nameMsg");
		if (flag) {
			nameMsg.style.color = "green";
			nameMsg.innerHTML = "姓名合法";
			return true;
		} else {
			nameMsg.style.color = "red";
			nameMsg.innerHTML = "姓名必须是2-10位汉字";
			name.focus();
			return false;
		}
	}
	//2.验证用户名
	var flag;
	function validateUserName() {	
		var username = document.updateUser.username;
		var xmlhttp = getXMLHttpRequest();
		xmlhttp.open("POST", "UserServlet", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("action=validateUserName&username=" + username.value);			
		var reg = /^[A-z0-9_]{3,15}$/;
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {//响应成功			
				var content = xmlhttp.responseText;//拿到服务器响应的数据了
				var usernameMsg = document.getElementById("usernameMsg");
				if (content == "0") {//用户名不存在，可以注册						
					flag=true;
					 if (reg.test(username.value)) {
							usernameMsg.style.color = "green";
							usernameMsg.innerHTML = "用户名合法";
							flag=true;
						} else {
							usernameMsg.style.color = "red";
							usernameMsg.innerHTML = "必须是3-15位数字字母下划线";
							username.focus();
							flag=false;
						}		 
				}else{//用户名存在，请换一个
					usernameMsg.style.color="red";
					usernameMsg.innerHTML="用户名已存在，请换一个";
					username.focus();
					flag= false;
				}
			}			
		}
	}
	//3.验证密码
	function validatePassword() {
		var password = document.updateUser.password;
		var reg = /^(\w|\w){6,15}$/;
		var passwordMsg = document.getElementById("passwordMsg");
		if (reg.test(password.value)) {
			passwordMsg.style.color = "green";
			passwordMsg.innerHTML = "密码合法";
			return true;
		} else {
			passwordMsg.style.color = "red";
			passwordMsg.innerHTML = "必须是6-15位数字字母下划线或者特殊字符";
			password.focus();
			return false;
		}
	}

	//4.验证手机
	function validatePhone() {
		var phone = document.updateUser.phone;
		var reg = /^1[3-9][0-9]{9}$/;
		var phoneMsg = document.getElementById("phoneMsg");
		if (reg.test(phone.value)) {
			phoneMsg.style.color = "green";
			phoneMsg.innerHTML = "手机号合法";
			return true;
		} else {
			phoneMsg.style.color = "red";
			phoneMsg.innerHTML = "手机号不合法";
			phone.focus();
			return false;
		}
	}
	//5.验证注册时间
	function validateTime(){
		var time= document.updateUser.time;
		var date=new Date();
		var year=date.getFullYear();
		var moth=date.getMonth()+1;
		var day=date.getDate();
		time.value=year+"-"+moth+"-"+day;
		var timeMsg=document.getElementById("timeMsg");
		if(time.value){
		 timeMsg.style.color = "green";
		 timeMsg.innerHTML="时间合法";
		 return true;
		}else{
			timeMsg.style.color = "red";
			 timeMsg.innerHTML="格式为年-月-日";
			 time.focus();
			return false;
		}
	}
	
	function jiaoyan() {
		return validateName() && flag && validatePassword()
				&& validatePhone()&&validateTime();
	}
</script>
</head>
<body background="imgs/3.jpg">
	<h1 align="center">
		<font size="7" face="宋体">修改用户信息</font>
	</h1>
	<hr size="5px" width="600px" color="#cc6600" />
	<br>
	<form action="updateUser" method="post"name="updateUser" onsubmit="return jiaoyan()"
		enctype="multipart/form-data">
		<table frame="box" border="1" width="600px" height="400px"
			cellspacing="0" align="center">
				<input type='hidden' name='id' value="${u.id}"/>
			<tr align="center">
				<td>姓名</td>
				<td><input
					type="text" name="name" value="${u.name }" onblur="validateName()"/></td>
			    <td><span id="nameMsg"></span></td>
			</tr>

			<tr align="center">
				<td>用户名</td>
				<td><input 
				type="text" name="username" value="${u.username }" onblur="validateUserName()"/></td>
			    <td><span id="usernameMsg"></span></td>
			</tr>

			<tr align="center">
				<td>密码：</td>
				<td><input type="text" name="password" value="${u.password }"
					onblur="validatePassword()" /></td>
				<td><span id="passwordMsg"></span></td>
			</tr>

			<tr align="center">
				<td>手机号码</td>
				<td><input 
				type="text" name="phone" value="${u.phone }" onblur="validatePhone()" />
				</td>
			<td><span id="phoneMsg"></span></td>
			</tr>

			<tr align="center">
				<td>注册时间</td>
				<td><input name="time" value="${u.time }" onblur="validateTime()"/></td>
	            <td><span id="timeMsg"></span></td>		
			</tr>
			
			<tr align="center">
				<td>头像</td>
				<td><img src="/img${u.touxiang }" style="width:60px;height:50px" class="img-circle img-responsive"/>
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="touxiang"/>		
				</td>
				<td><span></span></td>
			</tr>
			<tr height="45px" align="center">
				<td size="3" color="black" align="center" colspan="3"><input
					type="submit" value="修&nbsp改" class="btn btn-active btn-default"/> &nbsp; &nbsp; <input type="reset"
					value="重置" class="btn btn-active btn-default"/></td>
			</tr>
		</table>
	</form>
</body>
</html>