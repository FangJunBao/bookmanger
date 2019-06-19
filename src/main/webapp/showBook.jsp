<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="tubiao/iconfont.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="jquery-ui.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
	window.onload = function() {

		var selectAll = document.getElementById("selectAll");

		var flag = false;
		//按钮1
		selectAll.onclick = function() {

			var check = document.getElementsByName("bids");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = true;
			}

		};

		var unselsectAll = document.getElementById("unselectAll");

		unselsectAll.onclick = function() {

			var check = document.getElementsByName("bids");

			for (var i = 0; i < check.length; i++) {

				check[i].checked = false;
			}

		};

		var fanxuan = document.getElementById("fanxuan");

		fanxuan.onclick = function() {

			var check = document.getElementsByName("bids");

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					check[i].checked = false;

				} else {

					check[i].checked = true;
				}

			}

		};

		var deleteStudent = document.getElementById("deleteStudent");

		deleteStudent.onclick = function() {

			var check = document.getElementsByName("bids");

			var flag = false;

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					flag = true;

					break;
				}

			}
			if (flag == false) {

				alert("请至少勾选一个？？？");

				return;
			}

			var str = "";

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					str += check[i].value + ",";

				}
			}
			;

			str = str.slice(0, str.length - 1);

			var queren = confirm("你确定删除吗？");

			if (queren == true) {

				var $url = "delete/" + str;

				$("#deleteForm").attr("action", $url);

				//提交表单
				$("#deleteForm").submit();

				return false;

			} else {

				location.reload();
			}

		}

		//导出所有用户信息
		var outputAll = document.getElementById("outputAll");

		outputAll.onclick = function() {

			var queren = confirm("你确定导出所有页面数据吗？");

			if (queren == true) {

				window.location.href = "outputAll";
			}

		};

		//导出选中
		var outputSelect = document.getElementById("outputSelect")

		outputSelect.onclick = function() {

			var check = document.getElementsByName("bids");

			var flag = false;

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					flag = true;

					break;

				}

			}
			if (flag == false) {

				alert("请至少勾选一个？？？");

				return;
			}

			var str = "";

			for (var i = 0; i < check.length; i++) {

				if (check[i].checked == true) {

					str += check[i].value + ",";

				}
			}
			str = str.slice(0, str.length - 1);

			alert(str);

			var queren = confirm("你确定导出所选用户的数据吗？");

			if (queren == true) {

				location.href = "outputSelect/" + str;
			} else {

				location.reload();
			}

		};

		$(function() {
			$("table tr:even").addClass("warning");
			$("table tr:odd").addClass("danger");
		})

	};
</script>
<style type="text/css">
h1 {
	font-size: 200%;
	color: black;
	opacity: 0.75;
}

#div3 {
	margin-top: 30px;
	width: 1000px;
	height: 520px;
	margin-left: 30px;
}

#div2 {
	margin-left: 10px;
}

#div1 {
	background-image: url("tu/t6.jpg");
	background-size: cover;
}

#u1 {
	width: 300px;
	height: 365px;
	margin-left: 130px;
}

#li {
	color: #337AB7;
	font-size: 17px;
}
</style>
<body background="imgs/3.jpg">
	<div class="container">
		<caption align="top">
			<h1 align="center">
				<font>查看图书</font>
			</h1>
			<br>
		</caption>
		<div class="container">
			<table align="center" width="800px" height="300px" border="1px"
				class="table" cellspacing="0" bordercolor="silver">
				<tr align="center">
					<td>选项</td>
					<td>编号</td>
					<td>书名</td>
					<td>价格</td>
					<td>出版社</td>
					<td>状态</td>
					<td>借书人</td>
					<td>分类名称</td>
					<td>修改</td>
				</tr>

				<c:forEach items="${pb.beanList }" var="s" varStatus="q">
					<tr align=center>
						<td><input type="checkbox" name="bids" value="${s.bid}" /></td>
						<td>${s.bid }</td>
						<td>${s.bname }</td>
						<td>${s.price }</td>
						<td>${s.chubanshe }</td>
						<td>${s.zhuangtai }</td>
						<td>${s.jieshuren }</td>
						<td>${s.fenLei.fname }</td>
						<td><a href="book/${s.bid}" class=" btn btn-primary">修改</a></td>
					</tr>
				</c:forEach>

				<%-- <td colspan="10" align="center"><a href="book/${s.bid }"
					class="deleteId btn btn-danger">删除</a></td>
					 --%>

				<td colspan="10" align="center">
					<button id="deleteStudent" class="btn btn-danger btn-danger">删除</button>
					<button id="selectAll" class="btn btn-success btn-danger">全选</button>
					<button id="unselectAll" class="btn btn-warning  btn-danger">全不选</button>
					<button id="fanxuan" class="btn btn-primary btn-danger">反选</button>
					<button id="outputSelect" class="btn btn-success btn-danger">导出选择</button>
					<button id="outputAll" class="btn btn-primary btn-danger">导出全部</button>
				</td>

			</table>

			<form action="" method="POST" id="deleteForm">
				<input type="hidden" name="_method" value="DELETE" />
			</form>

		</div>

		<center>
			

			<div>
				<br>
				<p align="center">
					<a href="addUI" class="btn btn-primary btn-xs">添加图书</a>
				</p>



				<center>
					<!-- 更改分页的样式=====》ul列表 -->
					<ul class="pager">
						<li><a href="showByPage?pageNow=1">首页</a> &nbsp;&nbsp;
						<li><c:if test="${pb.pageNow>1 }">
								<li><a href="showByPage?pageNow=${pb.pageNow-1 }">上一页</a>
								<li>
							</c:if> &nbsp; <!-- 分两种情况：
		         如果页数小于10：
		         如果页数大于10：         
		        --> <c:choose>
								<c:when test="${pb.pages<=10 }">
									<c:set var="begin" value="1"></c:set>
									<c:set var="end" value="${pb.pages }"></c:set>
								</c:when>
								<c:otherwise>
									<c:set var="begin" value="${pb.pageNow-5 }"></c:set>
									<c:set var="end" value="${pb.pageNow+4 }"></c:set>
									<c:if test="${begin<=1 }">
										<c:set var="begin" value="1"></c:set>
										<c:set var="end" value="10"></c:set>
									</c:if>
									<c:if test="${end>=pb.pages }">
										<c:set var="begin" value="${pb.pages-9 }"></c:set>
										<c:set var="end" value="${pb.pages }"></c:set>
									</c:if>
								</c:otherwise>
							</c:choose> <!-- 循环十个数 --> <c:forEach begin="${begin }" end="${end }"
								var="i">
								<c:choose>
									<c:when test="${pb.pageNow==i }">
										<span>${i}</span>
									</c:when>
									<c:otherwise>
										<li><a href="showByPage?pageNow=${i }">${i }</a></li>
									</c:otherwise>
								</c:choose>

							</c:forEach> &nbsp; <c:if test="${pb.pageNow<pb.pages }">
								<li><a href="showByPage?pageNow=${pb.pageNow+1 }">下一页</a></li>
							</c:if> &nbsp;&nbsp;
						<li><a href="showByPage?pageNow=${pb.pages }">尾页</a></li>
					</ul>

					<p align="center">第${pb.pageNow }页/共${pb.pages }页</p>
					<br>
			</div>
	</div>
</body>
</html>