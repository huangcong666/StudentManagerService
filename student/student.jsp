<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Student</title>
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
  $('#tt').combo({
				required:true,
				editable:false
			});
			$('#ts').appendTo($('#tt').combo('panel'));
			$('#ts input').click(function(){
				var v = $(this).val();
				var s = $(this).next('span').text();
				$('#tt').combo('setValue', v).combo('setText', s).combo('hidePanel');
			});
  		 $('#kk').combo({
				required:true,
				editable:false
			});
			$('#ks').appendTo($('#kk').combo('panel'));
			$('#ks input').click(function(){
				var v = $(this).val();
				var s = $(this).next('span').text();
				$('#kk').combo('setValue', v).combo('setText', s).combo('hidePanel');
			});
			$('#tt1').combo({
				required:true,
				editable:false
			});
			$('#ts1').appendTo($('#tt1').combo('panel'));
			$('#ts1 input').click(function(){
				var v = $(this).val();
				var s = $(this).next('span').text();
				$('#tt1').combo('setValue', v).combo('setText', s).combo('hidePanel');
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
         url:'ManagerStudentLoad.action',  //数据来源 
         //冻结列
            columns:[[
               {field:'id',title:'ID',width:80},
               {field:'number',title:'学号',width:80},
               {field:'name',title:'姓名',width:80},
                {field:'sex',title:'性别',width:80},   
                {field:'pnumber',title:'手机号',width:120},
                 {field:'password',title:'密码',width:100},
                {field:'IDnumber',title:'身份证号',width:140},   
                 {field:'classs',title:'班级',width:120},
                 {field:'adress',title:'家庭住址',width:140}
               
               
                
 
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

 $('#winss').dialog({
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
         $('#winss').dialog({
             closed: true, // 隱藏列表 
        });
        var number = document.getElementById("numberss").value;
        var password= document.getElementById("passwordss").value;
        var name = document.getElementById("namess").value;
        var sex = $('input[name="sex"]:checked').val(); 
        var IDnumber = document.getElementById("IDnumberss").value;
        var pnumber = document.getElementById("pnumberss").value;
        var adress=document.getElementById("adressss").value;
        var classs = $('input[name="class"]:checked').val(); 
        var college = document.getElementById("collegess").value;
       	$.ajax({
					type:'post',
					url:'ManagerStudentAdd.action',
					cache:true,
					data:{
						name:name,
						sex:sex,
						number:number,
						IDnumber:IDnumber,
						password:password,
						pnumber:pnumber,
						adress:adress,
					
						classs:classs,
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
		$('#winss1').dialog({
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
         $('#winss1').dialog({
             closed: true, // 隱藏列表 
        });
      	 var number = document.getElementById("numberss1").value;
        var password= document.getElementById("passwordss1").value;
        var pnumber = document.getElementById("pnumberss1").value;
        var adress=document.getElementById("adressss1").value;
        var classs = $('input[name="class"]:checked').val(); 
        var college = document.getElementById("collegess1").value;
       	$.ajax({
					type:'post',
					url:'ManagerStudentEdit.action',
					cache:true,
					data:{
					
						number:number,
						password:password,
						pnumber:pnumber,
						adress:adress,
						classs:classs,
						college:college
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

 $('#winss2').dialog({
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
         $('#winss2').dialog({
             closed: true, // 隱藏列表 
        });
       var number = document.getElementById("numberss2").value;
     
       	$.ajax({
					type:'post',
					url:'ManagerStudentDelete.action',
					cache:true,
					data:{
						number:number
					
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
 <div id="winss" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
          <div style="margin-bottom:20px">
				<input id="namess" class="easyui-textbox" name="name" style="width:100%" data-options="label:'姓名:',required:'true' ,validType:'name'" >
			</div>
			
			
			<div style="margin-bottom:20px" >
			<select id="kk" style="width:250px;" data-options="label:'性别:'"></select>
			<div id="ks">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a sex</div>
			<div>
			<input type="radio" name="sex" value="男"><span>男</span><br/>
			<input type="radio" name="sex" value="女"><span>女</span><br/>
			
			</div>
			</div>
		</div>
			
			
				
	
			
			<div style="margin-bottom:20px">
				<input id="numberss" class="easyui-textbox" name="number" style="width:100%" data-options="label:'学号:',required:'true' ,validType:'number'"  >
			</div>
			 <div style="margin-bottom:20px">
				<input id="IDnumberss" class="easyui-textbox" name="IDnumber" style="width:100%" data-options="label:'身份证号:',required:'true' ,validType:'ID'" >
			</div>
			<div style="margin-bottom:20px">
				<input id = "passwordss" class="easyui-passwordbox" name="password" style="width:100%" data-options="label:'密码:',required:'true',validType:'Password'" >
			</div>
			 <div style="margin-bottom:20px">
				<input id="pnumberss" class="easyui-textbox" name="pnumber" style="width:100%" data-options="label:'电话号码:',required:'true' ,validType:'phone'"  >
			</div>
			 <div style="margin-bottom:20px">
				<input id="adressss" class="easyui-textbox" name="adress" style="width:100%" data-options="label:'地址:',required:'true' ,validType:'address'"  >
			</div>
			<div style="margin-bottom:20px" >
			<select id="tt" style="width:250px;" data-options="label:'班级:'"></select>
			<div id="ts">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a class</div>
			<div style="padding:2px">
			<input type="radio" name="class" value="171401"><span>171401</span><br/>
			<input type="radio" name="class" value="171402"><span>171402</span><br/>
			<input type="radio" name="class" value="171403"><span>171403</span><br/>
			<input type="radio" name="class" value="171404"><span>171404</span><br/>
			<input type="radio" name="class" value="171405"><span>171405</span><br>
		</div>
	</div>
	</div>
			<div style="margin-bottom:20px">
				<input id="collegess" class="easyui-textbox" name="college" style="width:100%" data-options="label:'学院:',required:'true' ,validType:'college'" >
			</div>
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="submitForm()" style="width: 90px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#winss').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
     <div id="winss1" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
    closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
       	  
			<div style="margin-bottom:20px">
				<input id="numberss1" class="easyui-textbox" name="number" style="width:100%" data-options="label:'学号:',required:'true' ,validType:'number'"  >
			</div>
			
			<div style="margin-bottom:20px">
				<input id = "passwordss1" class="easyui-passwordbox" name="password" style="width:100%" data-options="label:'密码:',required:'true',validType:'Password'" >
			</div>
			 <div style="margin-bottom:20px">
				<input id="pnumberss1" class="easyui-textbox" name="pnumber" style="width:100%" data-options="label:'电话号码:',required:'true' ,validType:'phone'"  >
			</div>
			 <div style="margin-bottom:20px">
				<input id="adressss1" class="easyui-textbox" name="adress" style="width:100%" data-options="label:'地址:',required:'true' ,validType:'address'"  >
			</div>
			<div style="margin-bottom:20px" >
			<select id="tt1" style="width:250px;" data-options="label:'班级:'"></select>
			<div id="ts1">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a class</div>
			<div style="padding:2px">
			<input type="radio" name="class" value="171401"><span>171401</span><br/>
			<input type="radio" name="class" value="171402"><span>171402</span><br/>
			<input type="radio" name="class" value="171403"><span>171403</span><br/>
			<input type="radio" name="class" value="171404"><span>171404</span><br/>
			<input type="radio" name="class" value="171405"><span>171405</span><br>
		</div>
	</div>
	</div>
			<div style="margin-bottom:20px">
				<input id="collegess1" class="easyui-textbox" name="college" style="width:100%" data-options="label:'学院:',required:'true' ,validType:'college'" >
			</div>
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="editForm()" style="width: 90px">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#winss1').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
     <div id="winss2" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
          
          	<div style="margin-bottom:20px">
				<input id="numberss2" class="easyui-textbox" name="number" style="width:100%" data-options="label:'学号:'" required="" >
			</div>
			
			
			<div style="text-align:center;">

			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="delForm()" style="width: 90px">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#winss2').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
<table id="dg">

</table>

</body>
</html>