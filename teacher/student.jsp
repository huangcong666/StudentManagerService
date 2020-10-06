<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>TeacherToStudent</title>
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
         url:'CourseLoad.action',  //数据来源 
         //冻结列
            columns:[[
               
               {field:'number',title:'学号',width:80}, 
                 {field:'name',title:'课程名称',width:120},
                
                 
                 {field:'',title:'',width:100,
            	formatter: function(value,row,index){
            		
       			 var str = '<button class="easyui-linkbutton" id="sdenglu" onclick="add();" style="border-radius: 25px;font-weight:700;font-size:14px;letter-spacing:1.15px;background-color:#4B70E2;box-shadow: 8px 8px 16px #d1d9e6,-8px -8px 16px #f9f9f9;border: none;outline: none;">上传成绩</button>';
       			 return str; 
    			 } },
               
                 
    			 
                 
               
                
 
            ]],
            fitColumns:true,//自适应宽度，占满,不能和冻结列同时设置成true
            striped:true,   //斑马线效果
            idField:'id',    //主键列
            rownumbers:true,            //显示行号 
          
          
            
    });
    
}

function add(){
var row = $("#dg").datagrid("getSelected");

$("#number").textbox("setValue",""+row.number+"");
$("#number").textbox('textbox').attr('readonly',true);
$("#course").textbox("setValue",""+row.name+"");
 $('#winss').dialog({
                 title: '上传成绩',
               	 width: 450,
                 height: 240,
                 top:150,
                closed: false,//显示对话框
                 cache: false,
                 modal: true
            }); 
           
 }
  function submitForm(){
         $('#winss').dialog({
             closed: true, // 隱藏列表 
        });
       
        var number=$("#number").textbox('getValue');
        var course=$("#course").textbox('getValue');
        var grade = document.getElementById("grade").value;
         
       	$.ajax({
					type:'post',
					url:'GradeAdd.action',
					cache:true,
					data:{
						number:number,
						grade:grade,
						course:course
					},
					dataType:"json",
					success:function(data){
				 	  
						
							
					},
					complete:function(data){
					
						
							load();
							alert("成绩提交成功");
						
						
					}
			});
       
		
		
		
     } 
     
     
     
  

</script>
 <div id="winss" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
         
			
				
	
			
			<div style="margin-bottom:20px">
				<input id="number" class="easyui-textbox" name="number" style="width:100%" data-options="label:'学号:',required:'true'"   >
			</div>
			 <div style="margin-bottom:20px">
				<input id="grade" class="easyui-textbox" name="grade" style="width:100%" data-options="label:'成绩:',required:'true'" >
			</div>
			<div style="margin-bottom:20px">
				<input id="course" class="easyui-textbox" name="course" style="width:100%" data-options="label:'课程:',required:'true'" >
			</div>
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="submitForm()" style="width: 90px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#winss').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
    
   
        
<table id="dg">

</table>

</body>
</html>