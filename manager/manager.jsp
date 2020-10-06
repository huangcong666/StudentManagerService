<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Manager</title>
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
 
})


function load(){
	$("#dg").datagrid({
         url:'ManagerLoad.action',  //数据来源 
         //冻结列
            columns:[[
                {field:'id',title:'ID',width:100},   
                {field:'account',title:'账号',width:100},   
                {field:'password',title:'密码',width:100} 
               
                
 
            ]],
            fitColumns:true,//自适应宽度，占满,不能和冻结列同时设置成true
            striped:true,   //斑马线效果
            idField:'id',    //主键列
            rownumbers:true,            //显示行号 
          
            toolbar:[{iconCls:'icon-add',text:'添加',handler:function(){    
            	add();     
            }},
                     {iconCls:'icon-edit',text:'修改',handler:function(){
                     
                     	edit();
                     }},
                     {iconCls:'icon-remove',text:'删除',handler:function(){
                     	del();
                     }}
            ]
            
    });
    
}

function add(){

 $('#win').dialog({
                 title: '新增',
               	 width: 450,
                 height: 240,
                 top:150,
                closed: false,//显示对话框
                 cache: false,
                 modal: true
            }); 
           
 }
  function submitForm(){
         $('#win').dialog({
             closed: true, // 隱藏列表 
        });
        var account = document.getElementById("number").value;
        var password= document.getElementById("password").value;
       	$.ajax({
					type:'post',
					url:'ManagerAdd.action',
					cache:true,
					data:{
						account:account,
						password:password
					},
					dataType:"json",
					success:function(data){
				 	  
						
					},
					complete:function(data){
					
						load();
						alert("提示:账号重复则添加失败");
					}
			});
       
		
		
		
     } 
     
     
     
     
     
     function edit() {
		$('#win1').dialog({
                 title: '修改',
               	 width: 450,
                 height: 240,
                 top:150,
                closed: false,//显示对话框
                 cache: false,
                 modal: true
            }); 
	} 
	function editForm(){
         $('#win1').dialog({
             closed: true, // 隱藏列表 
        });
        var account = document.getElementById("number1").value;
        var password= document.getElementById("password1").value;
       	$.ajax({
					type:'post',
					url:'ManagerEdit.action',
					cache:true,
					data:{
						account:account,
						password:password
					},
					dataType:"json",
					success:function(data){
				 	
						
					},
					complete:function(data){
					
						load();
					alert("修改成功");
					}
			});
      
		
     }
  function del(){

 $('#win2').dialog({
                 title: '删除',
               	 width: 450,
                 height: 240,
                 top:150,
                 closed: false,//显示对话框
                 cache: false,
                 modal: true
            }); 
           
 } 
 function delForm(){
         $('#win2').dialog({
             closed: true, // 隱藏列表 
        });
        var account = document.getElementById("number2").value;
       
       	$.ajax({
					type:'post',
					url:'ManagerDelete.action',
					cache:true,
					data:{
						account:account
						
					},
					dataType:"json",
					success:function(data){
				
						 
					},
					complete:function(data){
					
						load();
					alert("删除成功");
					}
					
			});
       
		
		
     }
     
</script>
 <div id="win" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
          <div style="margin-bottom:20px">
				<input id="number" class="easyui-textbox" name="number" style="width:100%" data-options="label:'帐号:'" required="" >
			</div>
			<div style="margin-bottom:20px">
				<input id = "password" class="easyui-passwordbox" name="password" style="width:100%" data-options="label:'密码:'"required="">
			</div>
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="submitForm()" style="width: 90px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#win').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
     <div id="win1" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
          <div style="margin-bottom:20px">
				<input id="number1" class="easyui-textbox" name="number" style="width:100%" data-options="label:'帐号:'" required="" >
			</div>
			<div style="margin-bottom:20px">
				<input id = "password1" class="easyui-passwordbox" name="password" style="width:100%" data-options="label:'密码:'"required="">
			</div>
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="editForm()" style="width: 90px">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#win1').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
     <div id="win2" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
          <div style="margin-bottom:20px">
				<input id="number2" class="easyui-textbox" name="number" style="width:100%" data-options="label:'帐号:'" required="" >
			</div>
			
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="delForm()" style="width: 90px">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#win2').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
<table id="dg">

</table>

</body>
</html>