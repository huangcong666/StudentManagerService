<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="copyright" content="All Rights Reserved, Copyright (C) 2020 HC" />
<title>teacherMain</title>
<link rel="stylesheet" type="text/css" href="css/easyui.css" />
<link rel="stylesheet" type="text/css" href="css/wu.css" />
<link rel="stylesheet" type="text/css" href="css/icon.css" />
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
</head>
<body class="easyui-layout">
	<!-- begin of header -->
	<div class="wu-header" data-options="region:'north',border:false,split:true" style="height: 70px;">
    	<div class="wu-header-left">
        	<h1>教师中心</h1>
        </div>
        <div class="wu-header-right" >
        	<p><strong class="easyui-tooltip"><s:property value="#session.tname" /> 老师</strong>，欢迎您！</p>
            <p><a href="main.jsp">退出</a></p>
        </div>
    </div>
    <!-- end of header -->
    <!-- begin of sidebar -->
	<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'导航菜单'"> 
    	<div class="easyui-accordion" data-options="border:false"> 
        	
              <div title="个人中心" data-options="iconCls:'icon-user'" >
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-user"><a href="javascript:void(0)" data-icon="icon-user" data-link="teacher/teacherload.jsp" iframe="0" onclick="addTab();">个人中心</a></li>
                </ul>
                </div>
             <div title="课程中心" data-options="iconCls:'icon-user'" >
            	
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-user"><a href="javascript:void(0)" data-icon="icon-user" data-link="teacher/course.jsp" iframe="0">课程中心</a></li>
                	
                </ul>
           </div>
         <div title="学生管理" data-options="iconCls:'icon-user'" >
    			<ul class="easyui-tree wu-side-tree">
                	<li iconCls="icon-user"><a href="javascript:void(0)" data-icon="icon-user" data-link="teacher/student.jsp" iframe="0" >成绩上传中心</a></li>
                	<li iconCls="icon-user"><a href="javascript:void(0)" data-icon="icon-user" data-link="teacher/grade.jsp" iframe="0" >成绩查询中心</a></li>
                </ul>
         </div>
            
        </div>
    </div>	
    <!-- end of sidebar -->    
    <!-- begin of main -->
    <div class="wu-main" data-options="region:'center'">
        <div id="wu-tabs" class="easyui-tabs" data-options="border:false,fit:true">  
            <div title="首页" data-options="closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
        </div>
    </div>
    <!-- end of main --> 
    <!-- begin of footer -->
	<div class="wu-footer" data-options="region:'south',border:true,split:true" style="height: 40px;">
    	&copy; 2020HC
    </div>
    <!-- end of footer -->  
     
   
    <script type="text/javascript">
  
		$(function(){
			$('.wu-side-tree a').bind("click",function(){
				var title = $(this).text();
				var url = $(this).attr('data-link');
				var iconCls = $(this).attr('data-icon');
				var iframe = $(this).attr('iframe')==1?true:false;
				addTab(title,url,iconCls,iframe);
			});	
		})
		
	
		
		/**
		* Name 选项卡初始化
		*/
		$('#wu-tabs').tabs({
			tools:[{
				iconCls:'icon-reload',
				border:false,
				handler:function(){
					$('#wu-datagrid').datagrid('reload');
				}
			}]
		});
			
		/**
		* Name 添加菜单选项
		* Param title 名称
		* Param href 链接
		* Param iconCls 图标样式
		* Param iframe 链接跳转方式（true为iframe，false为href）
		*/	
		function addTab(title, href, iconCls, iframe){
			var tabPanel = $('#wu-tabs');
			if(!tabPanel.tabs('exists',title)){
				var content = '<iframe scrolling="auto" frameborder="0"  src="'+ href +'" style="width:100%;height:100%;"></iframe>';
				if(iframe){
					tabPanel.tabs('add',{
						title:title,
						content:content,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
				else{
					tabPanel.tabs('add',{
						title:title,
						href:href,
						iconCls:iconCls,
						fit:true,
						cls:'pd3',
						closable:true
					});
				}
			}
			else
			{
				tabPanel.tabs('select',title);
			}
		}
		/**
		* Name 移除菜单选项
		*/
		function removeTab(){
			var tabPanel = $('#wu-tabs');
			var tab = tabPanel.tabs('getSelected');
			if (tab){
				var index = tabPanel.tabs('getTabIndex', tab);
				tabPanel.tabs('close', index);
			}
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
</body>
</html>
