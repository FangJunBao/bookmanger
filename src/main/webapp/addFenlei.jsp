<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>添加用户</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入核心css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
</head>
 <script type="text/javascript">
 $(function() {
		$("#login").bootstrapValidator({

			feedbackIcons : {
				valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
			},
			fields : {
				fname : {
					validators : {
						notEmpty : {
							message : '分类名称不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '分类名称必须是2~10个汉字'
						},
					}
				},
				 
				

				
			
				
			}

		})

	});
 
 </script>
<body background="imgs/3.jpg">
  <div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login" action="addfenlei" method="post">
				<br>
				<br>
					<h1 align="center">
				<font>查看图书</font>
			</h1>
			<br>
			<br>
					<div class="form-group">
						<label>请输入分类的名称:</label> <input type="text"
							name="fname" class="form-control" />
					</div>

                   	<br>
					<div class="form-group">
						<button type="submit" class="btn btn-success btn-block">添加</button>
						<br>
						<button type="reset" class="btn btn-success btn-block">重填</button>
					</div>
				</form>

			</div>


		</div>

	</div>
	
</body>
</html>