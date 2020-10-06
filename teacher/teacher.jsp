<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Teacher</title>
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
 
  
  $('#cc').combo({
				required:true,
				editable:false
			});
			$('#sp').appendTo($('#cc').combo('panel'));
			$('#sp input').click(function(){
				var v = $(this).val();
				var s = $(this).next('span').text();
				$('#cc').combo('setValue', v).combo('setText', s).combo('hidePanel');
			});
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
	},
	ID:{
		validator: function (value, param) {
			return /^\d{15}|\d{}18$/.test(value);
		},
		message: '请输入正确的身份证号'
	},
	email:{
		validator: function (value, param) {
			return /^\w{3,}(\.\w+)*@[A-z0-9]+(\.[A-z]{2,5}){1,2}$/.test(value);
		},
		message: '请输入正确的邮箱地址'
	},
	address: {
		validator: function (value, param) {
		return /^[\u0391-\uFFE5]+$/.test(value);
		},
		message: '请输入汉字'
	},
	phone: {
		validator: function (value, param) {
		return /^1[3-8]+\d{9}$/.test(value);
		},
		message: '请输入正确的手机号'
	},
	college: {
		validator: function (value, param) {
		return  /^[\u0391-\uFFE5]+$/.test(value);
		},
		message: '请输入汉字'
	},
	});
});



function load(){
	$("#dg").datagrid({
         url:'ManagerTeacherLoad.action',  //数据来源 
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

 $('#wins').dialog({
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
         $('#wins').dialog({
             closed: true, // 隱藏列表 
        });
        var number = document.getElementById("numbers").value;
        var password= document.getElementById("passwords").value;
        var name = document.getElementById("names").value;
        var sex = $('input[name="sex"]:checked').val(); 
        var tnumber = document.getElementById("tnumbers").value;
        var pnumber = document.getElementById("pnumbers").value;
        var adress=document.getElementById("adresss").value;
        var email = document.getElementById("emails").value;
        var college = document.getElementById("colleges").value;
       	$.ajax({
					type:'post',
					url:'ManagerTeacherAdd.action',
					cache:true,
					data:{
						name:name,
						sex:sex,
						number:number,
						tnumber:tnumber,
						password:password,
						pnumber:pnumber,
						adress:adress,
						email:email,
						college:college
						
					},
					dataType:"json",
					success:function(data){
				 	  
						
							
					},
					complete:function(data){
					
						
							load();
							alert("操作提醒:账号重复则添加失败");
						
						
					}
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
        var pnumber = document.getElementById("pnumbers1").value;
        var adress=document.getElementById("adresss1").value;
        var email = document.getElementById("emails1").value;
        var college = document.getElementById("colleges1").value;
       	$.ajax({
					type:'post',
					url:'ManagerTeacherEdit.action',
					cache:true,
					data:{
					
						number:number,
						password:password,
						pnumber:pnumber,
						adress:adress,
						email:email,
						college:college
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
  function del(){

 $('#wins2').dialog({
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
         $('#wins2').dialog({
             closed: true, // 隱藏列表 
        });
       var number = document.getElementById("numbers2").value;
       
       	$.ajax({
					type:'post',
					url:'ManagerTeacherDelete.action',
					cache:true,
					data:{
						number:number,
						
					},
					dataType:"json",
					success:function(data){
				
						 
					},
					complete:function(data){
					
						load();
					alert("操作提醒:账号不存在则删除失败");
					}
					
			});
       
		
		
     }
     
</script>
 <div id="wins" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
          <div style="margin-bottom:20px">
				<input id="names" class="easyui-textbox" name="name" style="width:100%" data-options="label:'姓名:',required:'true' ,validType:'name'" >
			</div>
			
			
			
			<div style="margin-bottom:20px" >
			<select id="cc" style="width:250px;" data-options="label:'性别:'"></select>
			<div id="sp">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a sex</div>
			<div>
			<input type="radio" name="sex" value="男" id="sex"><span>男</span><br/>
			<input type="radio" name="sex" value="女" id="sex"><span>女</span><br/>
			
		</div>
		</div>
	</div>
	
			
			<div style="margin-bottom:20px">
				<input id="numbers" class="easyui-textbox" name="number" style="width:100%" data-options="label:'教师编号:',required:'true' ,validType:'number'"  >
			</div>
			 <div style="margin-bottom:20px">
				<input id="tnumbers" class="easyui-textbox" name="tnumber" style="width:100%" data-options="label:'身份证号:',required:'true' ,validType:'ID'" >
			</div>
			<div style="margin-bottom:20px">
				<input id = "passwords" class="easyui-passwordbox" name="password" style="width:100%" data-options="label:'密码:',required:'true',validType:'Password'" >
			</div>
			 <div style="margin-bottom:20px">
				<input id="pnumbers" class="easyui-textbox" name="pnumber" style="width:100%" data-options="label:'电话号码:',required:'true' ,validType:'phone'"  >
			</div>
			 <div style="margin-bottom:20px">
				<input id="adresss" class="easyui-textbox" name="adress" style="width:100%" data-options="label:'地址:',required:'true' ,validType:'address'"  >
			</div>
			 <div style="margin-bottom:20px">
				<input id="emails" class="easyui-textbox" name="email" style="width:100%" data-options="label:'email:',required:'true' ,validType:'email'" >
			</div>
			<div style="margin-bottom:20px">
				<input id="colleges" class="easyui-textbox" name="college" style="width:100%" data-options="label:'学院:',required:'true' ,validType:'college'" >
			</div>
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="submitForm()" style="width: 90px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#wins').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
     <div id="wins1" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
    closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
       	
			<div style="margin-bottom:20px">
				<input id="numbers1" class="easyui-textbox" name="number" style="width:100%" data-options="label:'教师编号:',required:'true' ,validType:'number'"  >
			</div>
			
			<div style="margin-bottom:20px">
				<input id = "passwords1" class="easyui-passwordbox" name="password" style="width:100%" data-options="label:'密码:',required:'true',validType:'Password'" >
			</div>
			 <div style="margin-bottom:20px">
				<input id="pnumbers1" class="easyui-textbox" name="pnumber" style="width:100%" data-options="label:'电话号码:',required:'true' ,validType:'phone'"  >
			</div>
			 <div style="margin-bottom:20px">
				<input id="adresss1" class="easyui-textbox" name="adress" style="width:100%" data-options="label:'地址:',required:'true' ,validType:'address'"  >
			</div>
			 <div style="margin-bottom:20px">
				<input id="emails1" class="easyui-textbox" name="email" style="width:100%" data-options="label:'email:',required:'true' ,validType:'email'" >
			</div>
			<div style="margin-bottom:20px">
				<input id="colleges1" class="easyui-textbox" name="college" style="width:100%" data-options="label:'学院:',required:'true' ,validType:'college'" >
			</div>
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="editForm()" style="width: 90px">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#wins1').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
     <div id="wins2" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
          
          	<div style="margin-bottom:20px">
				<input id="numbers2" class="easyui-textbox" name="number" style="width:100%" data-options="label:'帐号:'" required="" >
			</div>
			
			
			<div style="text-align:center;">

			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="delForm()" style="width: 90px">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#wins2').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
<table id="dg">

</table>

</body>
</html>