<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>StudentCourse</title>
<!-- 1.导jQuery的JS包 -->
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<!-- 2.导入css资源 -->
<link rel="stylesheet" type="text/css" href="css/easyui.css">
<!-- 3.导入图标资源 -->
<link rel="stylesheet" type="text/css" href="css/icon.css">
<!--4. EasyUI的js包 -->
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<!-- 5.本地语言 -->
<script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
 
</head>
<body>

<script type="text/javascript">
$(function(){
    //创建DataGrid
  load();
  
$.extend($.fn.validatebox.defaults.rules, {
	
	number:{
		validator: function (value, param) {
			return /^[0-9]+.?[0-9]*$/.test(value);
		},
		message: '请输入数字'
	}

	});
});


function load(){

	$("#dg").datagrid({
         url:'ManagerCourseLoad.action',  //数据来源 
         //冻结列
            columns:[[
              
                 {field:'id',title:'ID',width:100},   
                {field:'name',title:'课程名称',width:100}, 
                 {field:'grade',title:'学分',width:100},
                 {field:'nature',title:'课程性质',width:100},  
                {field:'time',title:'上课时间',width:100},
                {field:'week',title:'课程周数',width:100},
                {field:'tname',title:'授课老师',width:100},
               
                {field:'',title:'',width:120,
            	formatter: function(value,row,index){
            		
       			 var str = '<a id="add" href="javascript:void(0)" onclick="select();return false;">选课</a>';
       			 return str; 
    			 } },
               
                
 
            ]],
           
            fitColumns:true,//自适应宽度，占满,不能和冻结列同时设置成true
            striped:true,   //斑马线效果
            idField:'id',    //主键列
            rownumbers:true,            //显示行号 
          	checkOnselect:true
          
           
            
            
    });
    

}


 

</script>
<script type="text/javascript">

function select(){
var row = $("#dg").datagrid("getSelected");

            var name = row.name;
            var time = row.time;
            var tname = row.tname;
            var grade = row.grade;
            var week = row.week;
            var nature=row.nature;
            	$.ajax({
					type:'post',
					url:'ScourseAdd.action',
					cache:true,
					data:{
						name:name,
						time:time,
						tname:tname,
						grade:grade,
						week:week,
						nature:nature
					},
					dataType:"json",
					success:function(data){
				 	  
						
							
					},
					complete:function(data){
					
						
							load();
							alert("选课成功");
						}
			});
 	}

</script>

       
<table id="dg">

</table>

</body>

</html>