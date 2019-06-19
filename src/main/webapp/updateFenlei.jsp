<%@ page language="java"
	import="java.util.List,com.oracle.web.bean.User"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrap/css/bootstrap.css">

<link rel="stylesheet" href="tubiao/iconfont.css">

<script type="text/javascript" src="bootstrap/js/jquery.js"></script>

<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>

<link type="text/css" rel="stylesheet" href="jquery-ui.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>
<script type="text/javascript">
  $(function(){
	   $("table tr:even").addClass("warning");
	   $("table tr:odd").addClass("danger");
	})
</script>
<title>修改界面</title>
</head>
<body background="imgs/3.jpg">
	
	<form action="monster" method="post"  class="form-horizontal">
        
		<caption align=center color=red>
			<h1 align="center">修改分类界面</h1>
		</caption>
		<hr color=red></hr>
		<div class="container">
		  <input type="hidden" name="_method" value="PUT">
		<table align=center width="200px" height="100px"  border=1 class="table"
			cellspacing="0" bordercolor="silver">
			 <input type="hidden" name="fId" value="${m.fId }"/> 
			
		
			<tr align='center'>
				<td>分类名</td>
				<td><input type='text' name='fname' value='${m.fname}' /></td>
			</tr>


			<tr>
				<td align='center' colspan='2'><input type='submit' value='修改' class="btn btn-primary" />
				   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;<a
					href='monsters' class="btn btn-primary">取消</a></td>
			</tr>
			</table>		
	  </form>
</div>
</body>
</html>