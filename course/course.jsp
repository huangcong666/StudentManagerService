<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
   $('#mg').combo({
				required:true,
				editable:false
			});
			$('#mgs').appendTo($('#mg').combo('panel'));
			$('#mgs input').click(function(){
				var v = $(this).val();
				var s = $(this).next('span').text();
				$('#mg').combo('setValue', v).combo('setText', s).combo('hidePanel');
			});
   $('#ms').combo({
				required:true,
				editable:false
			});
			$('#mts').appendTo($('#ms').combo('panel'));
			$('#mts input').click(function(){
				var v = $(this).val();
				var s = $(this).next('span').text();
				$('#ms').combo('setValue', v).combo('setText', s).combo('hidePanel');
			});
  $('#km').combo({
				required:true,
				editable:false
			});
			$('#kms').appendTo($('#km').combo('panel'));
			$('#kms input').click(function(){
				var v = $(this).val();
				var s = $(this).next('span').text();
				$('#km').combo('setValue', v).combo('setText', s).combo('hidePanel');
			});
			 $('#kg').combo({
				required:true,
				editable:false
			});
			$('#kgs').appendTo($('#kg').combo('panel'));
			$('#kgs input').click(function(){
				var v = $(this).val();
				var s = $(this).next('span').text();
				$('#kg').combo('setValue', v).combo('setText', s).combo('hidePanel');
			});
			$('#gg').combo({
				required:true,
				editable:false
			});
			$('#gs').appendTo($('#gg').combo('panel'));
			$('#gs input').click(function(){
				var v = $(this).val();
				var s = $(this).next('span').text();
				$('#gg').combo('setValue', v).combo('setText', s).combo('hidePanel');
			});
			 $('#gt').combo({
				required:true,
				editable:false
			});
			$('#gts').appendTo($('#gt').combo('panel'));
			$('#gts input').click(function(){
				var v = $(this).val();
				var s = $(this).next('span').text();
				$('#gt').combo('setValue', v).combo('setText', s).combo('hidePanel');
			});
	$.extend($.fn.validatebox.defaults.rules, {
	name: {
		validator: function (value, param) {
		return /^[\u0391-\uFFE5]+$/.test(value);
		},
		message: '请输入汉字'
	},

	});
})


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
 
            ]],
            fitColumns:true,//自适应宽度，占满,不能和冻结列同时设置成true
            striped:true,   //斑马线效果
            idField:'id',    //主键列
            rownumbers:true,            //显示行号 
          
            toolbar:[{iconCls:'icon-add',text:'发布课程',handler:function(){    
            	add();     
            }},
                     {iconCls:'icon-edit',text:'管理课程',handler:function(){
                     
                     	edit();
                     }},
                     {iconCls:'icon-remove',text:'删除课程',handler:function(){
                     	del();
                     }}
            ]
            
    });
    
}

function add(){

 $('#winc').dialog({
                 title: '发布课程',
               	 width: 450,
                 height: 240,
                 top:150,
                closed: false,//显示对话框
                 cache: false,
                 modal: true
            }); 
           
 }
  function submitForm(){
         $('#winc').dialog({
             closed: true, // 隱藏列表 
        });
        var name = document.getElementById("name").value;
        var nature= $('input[name="nature"]:checked').val();;
        var time= $('input[name="time"]:checked').val();
         var week= $('input[name="week"]:checked').val();
       	var grade= document.getElementById("grade").value;
       	var tname = document.getElementById("tname").value;
       	$.ajax({
					type:'post',
					url:'ManagerCourseAdd.action',
					cache:true,
					data:{
						name:name,
						nature:nature,
						time:time,
						grade:grade,
						week:week,
						tname:tname
					},
					dataType:"json",
					success:function(data){
				 	  
						
					},
					complete:function(data){
					
						load();
						alert("发布成功");
					}
			});
       
		
		
		
     } 
     
     
     
     
     
     function edit() {
		$('#winc1').dialog({
                 title: '管理课程',
               	 width: 450,
                 height: 240,
                 top:150,
                closed: false,//显示对话框
                 cache: false,
                 modal: true
            }); 
	} 
	function editForm(){
         $('#winc1').dialog({
             closed: true, // 隱藏列表 
        });
        var name = document.getElementById("name1").value;
        var nature= $('input[name="nature1"]:checked').val();;
        var time= $('input[name="time1"]:checked').val();
    		var tname = document.getElementById("tname1").value;
    		 var week= $('input[name="week1"]:checked').val();
       	$.ajax({
					type:'post',
					url:'ManagerCourseEdit.action',
					cache:true,
					data:{
						name:name,
						nature:nature,
						time:time,
						week:week,
						tname:tname
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

 $('#winc2').dialog({
                 title: '删除课程',
               	 width: 450,
                 height: 240,
                 top:150,
                 closed: false,//显示对话框
                 cache: false,
                 modal: true
            }); 
           
 } 
 function delForm(){
         $('#winc2').dialog({
             closed: true, // 隱藏列表 
        });
      var name = document.getElementById("name2").value;
       	$.ajax({
					type:'post',
					url:'ManagerCourseDelete.action',
					cache:true,
					data:{
						name:name
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
<div id="winc" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
          <div style="margin-bottom:20px">
				<input id="name" class="easyui-textbox" name="name" style="width:100%" data-options="label:'课程名称:',required:'true' ,validType:'name'" >
			</div>
			
			
			<div style="margin-bottom:20px" >
			<select id="gg" style="width:250px;" data-options="label:'课程性质:'"></select>
			<div id="gs">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a nature</div>
			<div>
			<input type="radio" name="nature" value="必修课"><span>必修课</span><br/>
			<input type="radio" name="nature" value="考查课"><span>考查课</span><br/>
			
			</div>
			</div>
		</div>
			<div style="margin-bottom:20px" >
			<select id="gt" style="width:250px;" data-options="label:'课程时间:'"></select>
			<div id="gts">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a time</div>
			<div>
			<input type="radio" name="time" value="8:00-12:10"><span>8:00-12:10</span><br/>
			<input type="radio" name="time" value="13:30-17:10"><span>13:30-17:10</span><br/>
			
		</div>
	</div>
	</div>
	<div style="margin-bottom:20px" >
			<select id="ms" style="width:250px;" data-options="label:'课程周数:'"></select>
			<div id="mts">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a week</div>
			<div>
			<input type="radio" name="week" value="1-10周"><span>1-10周</span><br/>
			<input type="radio" name="week" value="1-20周"><span>1-20周</span><br/>
			
		</div>
	</div>
	</div>
			<div style="margin-bottom:20px">
				<input id="grade" class="easyui-textbox" name="college" style="width:100%" data-options="label:'学分:',required:'true'" >
			</div>
			<div style="margin-bottom:20px">
				<input id="tname" class="easyui-textbox" name="tname" style="width:100%" data-options="label:'授课老师:',required:'true'" >
			</div>
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="submitForm()" style="width: 90px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#winc').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
     <div id="winc1" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
    closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
       	  
			<div style="margin-bottom:20px">
				<input id="name1" class="easyui-textbox" name="name" style="width:100%" data-options="label:'课程名称:',required:'true' ,validType:'name'" >
			</div>
			
			
			<div style="margin-bottom:20px" >
			<select id="km" style="width:250px;" data-options="label:'课程性质:'"></select>
			<div id="kms">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a nature</div>
			<div>
			<input type="radio" name=nature1 value="必修课"><span>必修课</span><br/>
			<input type="radio" name="nature1" value="考查课"><span>考查课</span><br/>
			
			</div>
			</div>
		</div>
			<div style="margin-bottom:20px" >
			<select id="kg" style="width:250px;" data-options="label:'课程时间:'"></select>
			<div id="kgs">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a time</div>
			<div style="padding:2px">
			<input type="radio" name="time1" value="8:00-12:10"><span>8:00-12:10</span><br/>
			<input type="radio" name="time1" value="13:30-17:10"><span>13:30-17:10</span><br/>
			
		</div>
	</div>
	</div>
	<div style="margin-bottom:20px" >
			<select id="mg" style="width:250px;" data-options="label:'周数:'"></select>
			<div id="mgs">
			<div style="color:#99BBE8;background:#fafafa;padding:5px;">Select a week</div>
			<div style="padding:2px">
			<input type="radio" name="week1" value="1-10周"><span>1-10周</span><br/>
			<input type="radio" name="week1" value="1-20周"><span>1-20周</span><br/>
			
		</div>
	</div>
	</div>
		<div style="margin-bottom:20px">
				<input id="tname1" class="easyui-textbox" name="tname" style="width:100%" data-options="label:'授课老师:',required:'true' ,validType:'name'" >
			</div>
			<div style="text-align:center;">
			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="editForm()" style="width: 90px">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#winc1').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
     <div id="winc2" class="easyui-dialog" title="提示"  style="width: 400px; padding: 10px 20px; height: 410px;"
         closed="true" buttons="#dlg-buttons">                             
       <form id="fm" name="frm" method="post" style="margin-top: 20px; margin-left: 20px;">
          
          	<div style="margin-bottom:20px">
				<input id="name2" class="easyui-textbox" name="number2" style="width:100%" data-options="label:'课程名称'" required="" >
			</div>
			
			
			<div style="text-align:center;">

			<a id="confirm" href="javascript:void(0)" class="easyui-linkbutton c6" iconcls="icon-ok" onclick="delForm()" style="width: 90px">删除</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-cancel" onclick="javascript:$('#winc2').dialog('close')" style="width: 90px">取消</a>
	
			</div>
        </form>
     </div>
<table id="dg">

</table>

</body>
</html>