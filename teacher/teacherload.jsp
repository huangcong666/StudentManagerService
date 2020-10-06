<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>TeacherUserload/title>
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
	name: {
		validator: function (value, param) {
		return /^[\u0391-\uFFE5]+$/.test(value);
		},
		message: '请输入汉字'
	},
	number:{
		validator: function (value, param) {
			return /^[0-9]+.?[0-9]*$/.test(value);
		},
		message: '请输入数字'
	},
	Password:{
		validator: function (value, param) {
			return /^[0-9]+.?[0-9]*$/.test(value);
		},
		message: '请输入数字'
	}
	});

});



function load(){
	$("#dg").datagrid({
         url:'TeacherLoad.action',  //数据来源 
         //冻结列
            columns:[[
               {field:'tid',title:'ID',width:80},
               {field:'tname',title:'姓名',width:80},
                 {field:'sex',title:'性别',width:80},   
                {field:'number',title:'教师编号',width:80},
                {field:'tnumber',title:'身份证号',width:140},   
                 {field:'password',title:'密码',width:100},
                 {field:'pnumber',title:'手机号',width:120},
                 {field:'adress',title:'家庭住址',width:120},
                 {field:'email',title:'邮箱',width:140},
                 {field:'college',title:'学院',width:120}
               
                
 
            ]],
            fitColumns:true,//自适应宽度，占满,不能和冻结列同时设置成true
            striped:true,   //斑马线效果
            idField:'id',    //主键列
            rownumbers:true,            //显示行号 
          	 toolbar:[
          	 		
                     {iconCls:'icon-edit',text:'修改',handler:function(){
                     
                     	edit();
                     }}
                     
            ]
          
            
    });
}

     
     function edit() {
		$('#wins1').dialog({
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
         $('#wins1').dialog({
             closed: true, // 隱藏列表 
        });
        var number = document.getElementById("numbers1").value;
        var password= document.getElementById("passwords1").value;
       
       	$.ajax({
					type:'post',
					url:'TeacherEdit.action',
					cache:true,
					data:{
					
						number:number,
						password:password
						
					},
					dataType:"json",
					success:function(data){
				 	
						
					},
					complete:function(data){
					
						load();
						alert("操作提醒:账号不存在则修改失败");
					}
			});
      
		
     }
 
  
</script>

     <div id="wins1" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
    closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
       	
			<div style="margin-bottom:20px">
				<input id="numbers1" class="easyui-textbox" name="number" style="width:100%" data-options="label:'教师编号:',required:'true' ,validType:'number'"  >
			</div>
			
			<div style="margin-bottom:20px">
				<input id = "passwords1" class="easyui-passwordbox" name="password" style="width:100%" data-options="label:'密码:',required:'true',validType:'Password'" >
			</div>
			
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="editForm()" style="width: 90px">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#wins1').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
    


<table id="dg">

</table>

</body>
</html>