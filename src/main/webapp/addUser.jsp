<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="jquery-ui.css">

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<script type="text/javascript" src="js/jquery-ui.js"></script>

<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css" />

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>

<script type="text/javascript" src="js/ajax.js"></script>

<script type="text/javascript">
 						
	$(function(){
		$(".form-horizontal").bootstrapValidator({
			feedbackIcons:{
				 valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
				
			}, 
			fields: {
				name : {
					validators : {

						notEmpty : {

							message : '姓名不能为空'
						},
						stringLength : {
							min : 2,
							max : 15,
							message : '姓名必须是2-15个汉字'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,15}$/,
							message : '姓名必须是2-15个汉字'
						}

					}
				},
				touxiang : {

					validators : {
						notEmpty : {

							message : '头像不能为空'
							
						},
						file : {
							extension : 'pdf,jpg,gif,png,bmp,jpeg',
							type : 'image/pdf,image/jpg,image/gif,image/png,image/bmp,image/jpeg',
							message : '头像不合法.'
						}
					}
				},  
				username : {
					validators : {

						notEmpty : {

							message : '用户名不能为空'
						},
						stringLength : {
							min : 3,
							max : 15,
							message : '用户名必须是3-15个字母或数字组成'
						},
						
						
						remote : {
							url : "validateUser",
							message : '该用户名已存在',
							delay : 500,
							type : 'GET',
							data : function(validator) {
								return {
									username : $("input[name=username]").val()

								}
							}

						}

					}

				},
				password : {
					validators : {
						notEmpty : {

							message : '密码不能为空'
						},
						different : {
							field : 'username',
							message : '密码不能和用户名一样'
						},
						regexp : {
							regexp : /^(?=.*\d)(?=.*[A-z])[A-z\d]{6,15}$/,
							message : '密码是6-15位，必须含有字母和数字'
						},
					}
				},
				phone : {
					validators : {
						notEmpty : {

							message : '电话号码不能为空'
						},
						regexp : {
							regexp : /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/,
							message : '请输入正确的电话号码'
						},
					}
				},
				
				date: {
	        validators: {
	        	notEmpty : {

					message : '日期不能为空'
					
				},
	            date: {
	                format: 'YYYY/MM/DD',
	                message: '日期不合法'
	            }
	        }
	    }
			
		}
		
			 
		})
		
	});

</script>

<title>Insert title here</title>

</head>

<body background="imgs/3.jpg">
  
   <div class="container">
  
   <h1 align="center" ><font color="black">添加用户信息</font></h1>
  
  <br>
  
   <form action="user" class="form-horizontal" method="post" enctype="multipart/form-data">
  
   <div class="form-group">
    
    <label for="name" class="col-sm-4 control-label">姓名</label>
    
    <div class="col-sm-4">
      
      <input type="text" class="form-control" id="name" name="name">
    
    </div>
  
   </div>
  
   <div class="form-group">
    
    <label for="touxiang" class="col-sm-4 control-label">头像</label>
    
    <div class="col-sm-4">
     
      <input type="file" class="form-control" id="touxiang" name="touxiang">
    
    </div>
 
   </div>
  
   <div class="form-group">
   
    <label for="username" class="col-sm-4 control-label">用户名</label>
    
    <div class="col-sm-4">
      
      <input type="text" class="form-control" id="username" name="username">
   
    </div>
  
  </div>
  
  <div class="form-group">
   
    <label for="password" class="col-sm-4 control-label">密码</label>
    
    <div class="col-sm-4">
      
      <input type="password" class="form-control" id="password" name="password">
   
    </div>
 
  </div>
  
  <div class="form-group">
   
    <label for="phone" class="col-sm-4 control-label">手机号码</label>
    
    <div class="col-sm-4">
     
      <input type="text" class="form-control" id="phone" name="phone">
    
    </div>
  
  </div>
  
  <div class="form-group">
   
    <label for="date" class="col-sm-4 control-label">注册时间</label>
    
    <div class="col-sm-4">
     
      <input type="date" class="form-control" id="date" name="date">
   
    </div>
  
  </div>
 
  <div class="form-group">
   
    <div align="center" class="col-sm-offset-4 col-sm-4">
     
      <button type="submit" class="btn btn-success btn-block">添加用户</button>
   
    </div>
 
  </div>

</form>

</div>

</body>

</html>