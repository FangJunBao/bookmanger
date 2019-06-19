<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 String path=request.getContextPath();
 String base=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+path+"/";
%>
<!DOCTYPE html >
<html>
<head>
<meta  charset="UTF-8">
<link rel="stylesheet" href="<%=base %>bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="<%=base %>tubiao/iconfont.css">

<script type="text/javascript" src="<%=base %>bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="<%=base %>bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="<%=base %>jquery-ui.css">

<script type="text/javascript" src="<%=base %>js/jquery-1.8.3.js"></script>

<script type="text/javascript" src="<%=base %>js/jquery-ui.js"></script>

<title>Insert title here</title>

</head>

 <c:if test="${!(empty msg) }">
   <script>
    alert("${msg}");
   </script>
   <c:remove var="msg" scope="session"></c:remove>
   </c:if>
   <script type="text/javascript">
   
   $(function(){
	   
	   $(".deleteId").click(function(){
		   
		   var $url=this.href;
		   
		   //alert($url);
		   
		   $("#deleteForm").attr("action",$url);
		   
		   //提交表单
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
			
			var deleteStudent=document.getElementById("deleteStudent");
			deleteStudent.onclick=function(){
				var chek=document.getElementsByName("ids");
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
				
				var queren=confirm("您确认要删除这些分类吗？");
				
				if(queren==true){
					
					
					var $url="deletemonster/"+str;
					

					  $("#deleteForm").attr("action",$url);
					   
					   //提交表单
					   $("#deleteForm").submit();
					   
					   return false;

				}else{
					
					location.reload();
				}
			};
			
			
    var  outAll=document.getElementById("outAll");
			
			outAll.onclick=function(){
			
				var flag=confirm("你确定导出所有用户信息吗？");
				
				if(flag){
				
			//		window.location.href="http://localhost/bookmanager/outAll "
					window.location.href="outAll"
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
						
						window.location.href = "outSelect/"+str;

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
<body background="<%=base %>/imgs/3.jpg">
 
    <div class="container">
		
		<table class="table" align="center" width="200px" height="100px" border="1px" cellspacing="0" bordercolor="silver">
			
			<caption align="top">
				
				<h1 align="center">
					
					<font color="black" >查看分类</font>
				
				</h1>
				
				<hr size="2px" color="red" width="600px" />
			
			</caption>
				
			<tr align="center" class="warning">
			    
			    <td>选择</td>
				
				<td>编号</td>
				
				<td>id</td>
				
				<td>分类名称</td>
				
				<td>修改</td>
				
			   <!--  <td>删除</td>   --> 
			
			</tr>
			
			<c:forEach items="${pb.beanList}" var="s" varStatus="f">
				
				<tr align=center>
                   
                <td><input type="checkbox" name="ids" value="${s.fId}"></td>
					
				<td>${f.index+1}</td>
					
				<td>${s.fId}</td>
					
				<td>${s.fname}</td>
  	             
  	            <td><a href="monster/${s.fId }" class="btn btn-primary">修改</a></td>

				</tr>
			
			</c:forEach>
			
			<tr align="center"><td colspan="6">
			
			<p>
			
			<button id="selectAll"><span class="ui-icon ui-icon-circle-check"></span>全选</button>
			
			<button id="noselectAll"><span class="ui-icon ui-icon-circle-close"></span>全不选</button>
			
			<button id="fanxuan"><span class="ui-icon ui-icon-circle-check"></span>反选</button>
			
			<button id="outSelect"><span class="ui-icon ui-icon-circle-triangle-n"></span>导出所选 </button>
			
			<button id="outAll"> <span class="ui-icon ui-icon-circle-arrow-n"></span>导出所有</button>
			
		    <button id="deleteStudent"><span class="ui-icon ui-icon-trash ui-icon-sm"></span>删除</button>
			
			</p>
			
			</td>
			
			<tr>
			<!--  <tr align="center"> <td colspan="5"><input type="submit" value="删除"></td></tr>-->
			<!--  <tr align="center"><td colspan="5">
			<button id="deleteStudent">
			<span class="ui-icon ui-icon-trash"></span><a href="monster/${s.id }" class="deleteId ">删除</a></button>
			</td></tr>
			<tr align="center"><td colspan="5">
			<p>
			<button id="selectAll"><span class="ui-icon ui-icon-circle-check">
			</span>全选</button>
			<button id="noselectAll"><span class="ui-icon ui-icon-circle-close"></span>全不选</button>
			<button id="fanxuan"><span class="ui-icon ui-icon-circle-check"></span>反选</button>
			</p>
			</td>
			<tr>-->
		</table>
		
		
		
		<!-- 准备一个隐藏的表单 -->
		
		<form action="" method="post" id="deleteForm">
		 
		  <input type="hidden" name="_method" value="DELETE"/>
		
		</form>	
		
		<hr>
		<center>
		    <!-- 更改分页的样式=====》ul列表 -->
		    <ul class="pager text-center" >
			<li><a href="monsters?pageNow=1">首页</a> &nbsp;&nbsp;<li>
			<c:if test="${pb.pageNow>1 }">
				<li><a href="monsters?pageNow=${pb.pageNow-1 }">上一页</a><li>
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
						<li><a href="monsters?pageNow=${i }">${i }</a></li>
					</c:otherwise>
				</c:choose>

			</c:forEach>
			&nbsp;
			<c:if test="${pb.pageNow<pb.pages }">
				<li><a href="monsters?pageNow=${pb.pageNow+1 }">下一页</a></li>
			</c:if>
			&nbsp;&nbsp; <li><a href="monsters?pageNow=${pb.pages }">尾页</a></li>
           </ul>
		</center>
		<p align="center">第${pb.pageNow }页/共${pb.pages }页</p>
		<br>
    
		<table align="center">
			<tr align="center">
				
				<td><h3>没有您想要的分类？您可以点击这里</h3><button class="btn btn-sm" id="addfeilei">
				<span class="ui-icon ui-icon-circle-plus"></span>
				<a href="addFenlei.jsp">添加分类</a></td>
			</tr>
		</table>
	</form>
</body>
</html>