<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 引入核心css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="bootstrap/css/bootstrapValidator.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<title>Update</title>
<style>
h2 {
	font-size: 200%;
	color: skyblue;
	opacity: 0.75;
}
</style>
</head>
<body background="imgs/3.jpg">
	<div class="container">
		<form class="form-horizontal" action="book" method="post">

			<h3 class="text-center text-success">
				<font color="black">修改图书</font>
			</h3>
			<input type="hidden" value="PUT" name="_method"> 
			<input type="hidden" name="bid" value="${b.bid}" />

			<div class="form-group">
				<label for="fId" class="col-sm-4 control-label">分类名:</label>
				<div class="col-sm-4">
					<select name="fId" id="fId" class="form-control" value="${b.fId}">
						<c:forEach items="${flist}" var="f">

							<c:if test="${f.fId==fenlei.fId}">

								<option value="${f.fId}" selected="selected">${f.fname}</option>
							</c:if>
							<c:if test="${f.fId!=fenlei.fId}">
								<option value="${f.fId}">${f.fname}</option>
							</c:if>

						</c:forEach>
					</select>
				</div>

			</div>


			<div class="form-group">
				<label for="bname" class="col-sm-4 control-label">图书名称:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="bname" name="bname"
						value="${b.bname}">
				</div>
			</div>

			<div class="form-group">
				<label for="price" class="col-sm-4 control-label">价格:</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price"
						value="${b.price }">
				</div>
			</div>


			<div class="form-group">
				<label for="chubanshe" class="col-sm-4 control-label">出版社:</label>
				<div class="col-sm-4">
					<input class="form-control" id="chubanshe" name="chubanshe"
						value="${b.chubanshe}">
				</div>
			</div>


			<div class="form-group">
				<label for="zhuangtai" class="col-sm-4 control-label">状态:</label>
				<div class="col-sm-4">
					<input class="form-control" id="zhuangtai" name="zhuangtai"
						value="${b.zhuangtai}">
				</div>
			</div>

			<div class="form-group">
				<label for="jieshuren" class="col-sm-4 control-label">借书人:</label>
				<div class="col-sm-4">
					<input name="jieshuren" id="jieshuren" class="form-control"
						value="${b.jieshuren}" />
				</div>

			</div>


			<br>
			<div class="form-group">
				<label class="col-sm-4 control-label"></label>
				<div class="col-sm-4">
				<button type="submit" class="btn btn-primary btn-block">修改</button>
				<button type="reset" class="btn btn-primary btn-block">重填</button>
				</div>
			</div>

		</form>
	</div>
</body>
</html>