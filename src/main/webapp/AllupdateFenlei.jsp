<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 1.要使用Bootstrap的话，必须是html5文档 -->
<meta charset="UTF-8">
<!-- 2.移动设备优先 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 3.导入核心的css文件 -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="icon/iconfont.css"/>
<!-- 4.需要引入JQuery文件 -->
<script type="text/javascript" src="bootstrap/js/jquery.js"></script>
<!-- 5.引入BootStrap的核心JS文件 -->
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="icon/iconfont.js"></script>
<title>修改分类</title>
<script type="text/javascript" src="js/ajax.js"></script>
<script type="text/javascript">
    window.onload=function(){//页面加载完成
    	
    	ajax({
    		
    		method:"POST",
    		url:"FenleiServlet",
    		params:"action=updateShowFenlei",
    		type:"xml",
    		success:function(data){
    		   
    			var select=document.getElementById("fenleiList");
    			
                var fnames=data.getElementsByTagName("fname");
				
				for(var i=0;i<fnames.length;i++){
					
					var fname=fnames[i];
					
					var opt=document.createElement("option");
					
					var value;
					
					if(window.addEventListener){
						
						value=fname.textContent;
						
					}else{
						
						
						value=text;
					}
					
					opt.innerHTML=value;
					
					opt.value=value;
					
					
					select.appendChild(opt);
    	   }
    	}
    	
    	});
    };
    /*	var http=getXMLHttpRequest();
    
        var select=document.getElementById("fenleiList");
    
        http.open("POST","FenleiServlet",true);
        
	     http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		
	      http.send("action=updateShowFenlei");
		
		  http.onreadystatechange=function(){
					
			if(http.readyState==4 && http.status==200){
				
				var content=http.responseXML;
								
				var fnames=content.getElementsByTagName("fname");
				
				for(var i=0;i<fnames.length;i++){
					
					var fname=fnames[i];
					
					var opt=document.createElement("option");
					
					var value;
					
					if(window.addEventListener){
						
						value=fname.textContent;
						
					}else{
						
						
						value=text;
					}
					
					opt.innerHTML=value;
					
					opt.value=value;
					
					
					select.appendChild(opt);
					
				}
				
			}
			
		}
    	
   */ 	

</script>
<script type="text/javascript">
     $(function(){
    	 
    	 $("tr:even").css("background-color","#B0E0E6");
    	 $("tr:odd").css("background-color","#F5F5F5");

     });
</script>
</head>
<body background="images/003.jpg">
	<form action="FenleiServlet?action=update" method="post">
		<table align="center" width="400px" height="300px" border="2px"
		bordercolor="silver">
			<br>
				<p align="center">
					<font face="幼圆"color="black" size="7">修改分类页面</font>
				</p>
				<p align="center"><span class="iconfont icon-bianji" style="color:silver;font-size:45px;"></span></p>
		
			
			<tr align="center">
				<td>请选择您要修改的分类</td>
				<td><select name="fname" id="fenleiList">
				<option>--请选择您要修改的分类</option>
				</select></td>
			</tr>
			<tr align="center">
				<td>请输入新的分类名称:</td>
				<td><input type="text" name="newname" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input type="submit" value="修改" class="btn btn-success btn-default"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
					type="reset" value="清空" class="btn btn-info btn-default"/></td>
			</tr>
		</table>
	</form>
</body>
</html>