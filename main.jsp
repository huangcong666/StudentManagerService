<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>学生管理系统</title>
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<link rel="stylesheet" type="text/css" href="css/button.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>
<body>
	
	<div style="margin:20px 0;margin-left: 500px;margin-top: 250px;"id="div">
	<div class="easyui-panel" title="登录" style="width:400px;">
		<div style="padding:10px 60px 20px 60px;">
	    <form id="ff" method="post">
	    	<table cellpadding="5">
	    			<a href="studentsLogin.jsp" class="easyui-linkbutton" style="width:180px;margin-left:50px;" id='student'>学生登录</a>
	    			<a href="managerLogin.jsp" class="easyui-linkbutton" style="width:180px;margin-left:50px;margin-top: 40px;"id='manager'>管理员登录</a>
	    			<a href="teacherLogin.jsp" class="easyui-linkbutton" style="width:180px;margin-left:50px;margin-top: 40px" id='teacher'>教师登录</a>
	    	</table>
	    </form>
	    
	    </div>
	</div>
	</div>

</body>
</html>