<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta  charset="UTF-8">

<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="jquery-ui.css">

<script type="text/javascript" src="js/jquery-1.8.3.js"></script>

<script type="text/javascript" src="js/jquery-ui.js"></script>

<script type="text/javascript">

$(function() {
	
	$(".deleteId").click(function() {
		
		var $url = this.href;

		$("#deleteForm").attr("action", $url);
		
		// alert($url);
		
		$("#deleteForm").submit();

		return false;
	});
});

</script>

<script>
   
window.onload=function(){

	var selectAll=document.getElementById("selectAll");
			
			selectAll.onclick=function(){
				
				var chek=document.getElementsByName("ids");
				
				for(var i=0;i<chek.length;i++){
					
					chek[i].checked=true;
				};
				
			};
			
			var noselectAll=document.getElementById("noselectAll");
			
			noselectAll.onclick=function(){
				
			      	var chek=document.getElementsByName("ids");
					
					for(var i=0;i<chek.length;i++){
						
						chek[i].checked=false;
					}
			};
			
			var fanxuan=document.getElementById("fanxuan");
			
			fanxuan.onclick=function(){
				
				var chek=document.getElementsByName("ids");
				
				for(var i=0;i<chek.length;i++){
					
					if(chek[i].checked==true){
						
						chek[i].checked=false;
					}else{
						
						chek[i].checked=true;
					}
				}
			};
		
			
			/* var deleteStudent=document.getElementById("deleteStudent");
			var chek=document.getElementsByName("ids");
			deleteStudent.onclick=function(){
				
				var flag=false;
				
				for(var i=0;i<chek.length;i++){
					
					if(chek[i].checked==true){
						
						flag=true;
						
						break;
					}
				}
				
				if(flag==false){
					
					alert("请至少勾选一个进行删除");
					
					return;
				}
				
				
				var str="";
				
				for(var i=0;i<chek.length;i++){
					
					if(chek[i].checked==true){
						
						str+=chek[i].value+",";
					}
				}
				

				str=str.slice(0,str.length-1);
				
				var queren=confirm("您确认要删除这些学生吗？");
				
				if(queren==true){
					
					//拿到请求地址

					var $url = "http://localhost/ssm_book/user/" + str;
					
					//location.href="Userservlet?action=deleteUser&ids="+str;
				}else{
					
					location.reload();
				}
			}; */
		
var  outAll=document.getElementById("outAll");
			
			outAll.onclick=function(){
			
				var flag=confirm("你确定导出所有用户信息吗？");
				
				if(flag){
				
					//window.location.href="http://localhost:8080/bookmanager/outAllUser "
					
					window.location.href="outAllUser "
				
				}
			
			};
			
			var outSelect=document.getElementById("outSelect");
			
			outSelect.onclick=function(){
				
				var chek=document.getElementsByName("ids");
				
				var flag = false;

				for (i = 0; i < chek.length; i++) {

					if (chek[i].checked == true) {
					
						flag = true;
						
						break;
					}
				}

				if (flag == false) {
					
					alert("请至少选一项");
					
					return;

				} else {    
					
					var str = "";

					for (var i = 0; i < chek.length; i++) {

						if (chek[i].checked == true) {

							str += chek[i].value + ",";

						}
					}
					
					str = str.slice(0, str.length - 1);
					
					var flag = confirm("你确定导出选中的用户信息？");
					
					if (flag) {//确定
						
						//http://localhost:8080/SSM_bookmanger/outSelect/
						
						//window.location.href =  "http://localhost:8080/bookmanager/outSelectUser/"+str;
					
						window.location.href =  "outSelectUser/"+str;

					}
				}
				
			};

		};
			
		
		
	
        $(function(){
        	   
        	$("table tr:even").addClass("info");
        	  
        	$("table tr:odd").addClass("danger");
        	
        });
        		
         $(function() {
		        	       
		         $("#deleteStudent").button();
		        
		         $("#selectAll").button();
		        
		         $("#noselectAll").button();
		        
		         $("#fanxuan").button();
		        
		         $("#outSelect").button();
		        
		         $("#outAll").button();
		        
		         $("#adduser").button();
	
         });

</script>
	
</head>

<body background="imgs/3.jpg">
	
	 <div class="container">
		
		<table align="center" width="600px" height="200px" border="1px" class="table"
			
			cellspacing="0" bordercolor="silver">
			
			<caption align="center" >
				
				<h1 align="center">
					
					<font color="black" >查看用户信息</font>
				
				</h1>
				
				<hr color="red" />
			
			</caption>
			
			<tr align="center">
			
			    <td>选择</td>
			
				<td>编号</td>
				
				<td>姓名</td>
				
				<td>头像</td>
				
				<td>用户名</td>
				
				<td>密码</td>
				
				<td>手机号码</td>
				
				<td>注册时间</td>
				
				<td>删除</td>
				
				<td>修改</td>
				
			</tr>
						
			<c:forEach items="${pb.beanList }" var="u" varStatus="s">
			
				<tr>
				
				<td><input type="checkbox" name="ids" value="${u.id}"></td>
				
				<td>${s.index+1 }</td>
				
				<td>${u.name }</td>
				
				<td><img src="${u.touxiang }" width="30" height="30"></td>
				
				<td>${u.username }</td>
				
				<td><input type="password" align="center"  value="${u.password}" disabled="disabled"/></td>
				
				<td>${u.phone }</td>
				
				<td>${u.date }</td>
				
				<!--<fmt:formatDate value="${u.date }" pattern="yyyy-MM-dd"/>-->
				
			    <!--  <td><input type="checkbox" name="ids" value="${u.id }" /></td>-->

			    <td><a href="user/${u.id  }" class="deleteId btn btn-danger">删除</a></td>
				
				<td><a href="user/${u.id  }" class="btn btn-primary">修改</a></td>
				
				</tr>
				
			</c:forEach>
			
			<tr align="center"><td colspan="10">
			<p>
			<button id="selectAll"><span class="ui-icon ui-icon-circle-check"></span>全选</button>
			<button id="noselectAll"><span class="ui-icon ui-icon-circle-close"></span>全不选</button>
			<button id="fanxuan"><span class="ui-icon ui-icon-circle-check"></span>反选</button>
			<button id="outSelect"><span class="ui-icon ui-icon-circle-triangle-n"></span>导出所选 </button>
			<button id="outAll"> <span class="ui-icon ui-icon-circle-arrow-n"></span>导出所有</button>
			<!-- <button id="deleteStudent"><span class="ui-icon ui-icon-trash ui-icon-sm"></span>删除</button> -->
			</p>
			</td>
			<tr>
			
		</table>
		<!-- 准备一个隐藏的表单 -->
		<form action="" method="post" id="deleteForm">
		  <input type="hidden" name="_method" value="DELETE"/>
		</form>
		<center>
		    <!-- 更改分页的样式=====》ul列表 -->
		    <ul class="pager text-center" >
			<li><a href="users?pageNow=1">首页</a> &nbsp;&nbsp;<li>
			<c:if test="${pb.pageNow>1 }">
				<li><a href="users?pageNow=${pb.pageNow-1 }">上一页</a><li>
			</c:if>
			&nbsp; 
			<!-- 分两种情况：
		         如果页数小于10：
		         如果页数大于10：         
		        -->
			  <c:choose>
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
			</c:choose> 
			<!-- 循环十个数 -->
		 <c:forEach begin="${begin }" end="${end }" var="i">
				<c:choose>
					<c:when test="${pb.pageNow==i }">
						<span>${i}</span>
					</c:when>
					<c:otherwise>
						<li><a href="users?pageNow=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			&nbsp;
			<c:if test="${pb.pageNow<pb.pages }">
				<li><a href="users?pageNow=${pb.pageNow+1 }">下一页</a></li>
			</c:if>
			&nbsp;&nbsp; <li><a href="users?pageNow=${pb.pages }">尾页</a></li>
           </ul>
		</center>
		<p align="center">第${pb.pageNow }页/共${pb.pages }页</p>
		
		<!-- <p align="center">
		
		 <button id="selectall" class="btn btn-info btn-xs">全选</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="noselect" class="btn btn-info btn-xs">全不选</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="fanxuan" class="btn btn-info btn-xs">反选</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="outAll" class="btn btn-info btn-xs">导出所有</button>&nbsp;&nbsp;&nbsp;&nbsp;
		 
		 <button id="outSelect" class="btn btn-info btn-xs">导出选中</button>
		
		</p> -->
		
		<p align="center">
		
			<a href="addUser.jsp" class="btn btn-success btn-block">添加用户</a>
			
		</p>
		
		</div>
</body>
</html>