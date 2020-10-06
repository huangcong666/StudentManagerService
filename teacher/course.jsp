<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Course</title>
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
 
  
 
	
});



function load(){
	$("#dg").datagrid({
         url:'TeacherCourseLoad.action',  //数据来源 
         //冻结列
            columns:[[
              
                {field:'name',title:'课程名称',width:100}, 
                 {field:'grade',title:'学分',width:100},
                 {field:'nature',title:'课程性质',width:100},  
                {field:'time',title:'上课时间',width:100},
                {field:'week',title:'课程周数',width:100},
               
               
                
 
            ]],
            fitColumns:true,//自适应宽度，占满,不能和冻结列同时设置成true
            striped:true,   //斑马线效果
            idField:'id',    //主键列
            rownumbers:true,            //显示行号 
          
          
            
    });
}

</script>

<table id="dg">

</table>

</body>
</html>