<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<title>添加图书</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript" src="jQuery/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function() {
		$("#login").bootstrapValidator({

			feedbackIcons : {
				valid : "glyphicon glyphicon-ok",
				invalid : "glyphicon glyphicon-remove",
				validating : "glyphicon glyphicon-refresh"
			},
			fields : {
				bname : {
					validators : {
						notEmpty : {
							message : '书名不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{1,20}$/,

							message : '书名必须是1~20个汉字'
						},
					}
				},
				price : {
					validators : {
						notEmpty : {
							message : '书的价格不能为空'
						},
						regexp : {
							regexp : /^[0-9]+$/,
							message : '书的价格必须是数字'
						},

					}
				},

				chubanshe : {
					validators : {
						notEmpty : {
							message : '出版社不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{5,10}$/,
							message : '出版社必须是5~10位汉字'
						},
					}
				},
				zhuangtai : {
					validators : {
						notEmpty : {
							message : '必须选择书籍的状态'
						},
					}
				},

				jieshuren : {
					validators : {
						notEmpty : {
							message : '借书人不能为空'
						},
						regexp : {
							regexp : /^[\u0391-\uFFE5]{2,10}$/,
							message : '借书人的名字必须是2~10位汉字'
						},
					}
				}
			}

		});
	});
</script>
<meta charset="UTF-8">
<title>添加图书</title>
</head>
<body background="imgs/3.jpg">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<form id="login" action="addBook" method="post">
					<h3 class="text-center text-success">
						<font color="black">添加图书</font>
					</h3>
					<br>

					<div class="form-group">
						<label>请选择您想要添加的分类:</label> 
						<select name="fId" class="form-control">
							<c:forEach items="${flist }" var="f">
								<option value="${f.fId}">${f.fname}</option>
							</c:forEach>
						</select>
					</div>

					<div class="form-group">
						<label>图&nbsp;书&nbsp;名&nbsp;称:</label> <input type="text"
							name="bname" class="form-control" />
					</div>


					<div class="form-group">
						<label>图&nbsp;书&nbsp;价&nbsp;格:</label> <input type="text"
							name="price" class="form-control" />
					</div>


					<div class="form-group">
						<label>出&nbsp;&nbsp;&nbsp;版&nbsp;&nbsp;&nbsp;社:</label> <input
							type="text" name="chubanshe" class="form-control" />
					</div>


					<div class="form-group">
						<label>状&nbsp;&nbsp;态：</label>
						<div class="radio">
							<label class="radio-inline"><input type="radio"
								name="zhuangtai" value="未借出" />未借出</label> <label class="radio-inline"><input
								type="radio" name="zhuangtai" value="借出" />借出</label>
						</div>
					</div>


					<div class="form-group">
						<label>借&nbsp;&nbsp;&nbsp;书&nbsp;&nbsp;&nbsp;人:</label> <input
							type="text" name="jieshuren" class="form-control" />
					</div>
					<br>

					<div class="form-group">
						<button type="submit" class="btn btn-success btn-block">添加</button>
						<button type="reset" class="btn btn-success btn-block">重填</button>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>