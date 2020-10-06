<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>ManagerLogin</title>
  	<link rel="stylesheet" type="text/css" href="css/easyui.css">
	<link rel="stylesheet" type="text/css" href="css/icon.css">
	<link rel="stylesheet" type="text/css" href="css/demo.css">
	<link rel="stylesheet" type="text/css" href="css/button.css">
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
</head>
<body>
	
	<div style="margin:20px 0;margin-left: 540px;margin-top: 240px;"id="div">
	<div class="easyui-panel" title="管理员登录" style="width:100%;max-width:400px;padding:30px 60px;">
		<form id="ff" method="post" action="ManagerLogin.action">
			<div style="margin-bottom:20px">
				<input id="number" class="easyui-textbox" name="number" style="width:100%" data-options="label:'帐号:'" required="" missingMessage="不能为空">
			</div>
			<div style="margin-bottom:20px">
				<input id = "password" class="easyui-passwordbox" name="password" style="width:100%" data-options="label:'密码:'"required="" missingMessage="不能为空">
			</div>
			<div style="text-align:center;padding:5px 0">
			<button class="easyui-linkbutton" style="width:80px;margin-left: 4px;" id="sdenglu" onclick="check();">登录</button>
			<a href="mforget.jsp" class="easyui-linkbutton"  style="width:80px;margin-left: 4px;" id="sforget">忘记密码</a>
			</div>
		</form>
		
	</div>
	</div>

</body>

<script type="text/javascript">
	function check(){
	
	var account = document.getElementById("number").value;
	var password = document.getElementById("password").value;
	if(account.length == 0 || account == null){
		alert("账号不能为空");
		return false;
	}
	if(password.length == 0 || password == null){
		alert("密码不能为空");
		return false;
	}
	
	return true;
	}
</script>
<s:if test="actionMessages!=null && actionMessages.size>0">
		<script type="text/javascript">
			var actionMessages;
			<s:iterator value="actionMessages">
				actionMessages='<s:property escape="false"/>'+'\n';
			</s:iterator>
			alert(actionMessages);
		</script>
	</s:if>
</html>
