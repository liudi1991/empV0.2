<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="asserts/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="asserts/easyui/themes/icon.css">


<title>首页</title>

</head>

<body>
	<%@include file="/include/head.jsp"%>
	<div class="rightcon">
		<div class="right_con">
			<div style="width: 80%;margin-left:5%" >
				<table id="emp_list"></table>
			</div>
			


		</div>
	</div>



	<%-- <script type="text/javascript"
	src="<%=basePath%>asserts/lib/js/jquery-1.8.0.min.js"></script> --%>
<script type="text/javascript"
	src="asserts/lib/js/jquery.easyui.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#emp_list').datagrid({
        title : '员工列表',
        url:"emp.do?method=findAll_ajax",
        fitColumns:true,
        autoRowHeight:true,
        striped:true,
        loadMsg:'正在加载',
        rownumbers:true,
        columns:[[
			{field:'id',title:'id',width:100,align:'center'},
			{field:'name',title:'Name',width:100,align:'center'},
			{field:'age',title:'age',width:100,align:'center'},
			{field:'salary',title:'salary',width:100,align:'center'}
			
	    ]]
    });

})

</script>
</body>
</html>






