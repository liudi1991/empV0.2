<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>首页</title>

</head>

<body>
	<%@include file="/include/head.jsp"%>
	
	<div class="rightcon">
		<div class="right_con">


			<h1 align="center" style="width: 70%">员工列表</h1>
			<table class="table table-bordered table-hover " 
				style="margin-left: 50px;width: 70%;">
				<thead>
					<tr class="table_header">
						<th>ID</th>
						<th>姓名</th>
						<th>薪水</th>
						<th>年龄</th>
						<th>操作</th>
					</tr>


				</thead>

				<c:if test="${empty employees}">
					<tr>
						<td colspan="5">没有数据</td>
					</tr>
				</c:if>
				<c:if test="${not empty employees }">
					<c:forEach var="e" items="${employees}">
						<tr >
							<td >${e.id}</td>
							<td >${e.name}</td>
							<td >￥${e.salary }</td>
							<td >${e.age}</td>
							<td style="text-align: left"><a class="btn btn-info"
								href="emp.do?method=findByID&id=${e.id}">查看详情</a>&nbsp; <a
								class="btn btn-warning"
								href="emp.do?method=premodify&id=${e.id}">修改</a>&nbsp; <a
								class="btn btn-danger" href="emp.do?method=delete&id=${e.id}"
								onclick="return confirm('确定删除${e.name}吗?');">删除</a></td>
						</tr>
					</c:forEach>
				</c:if>

			</table>



		</div>
	</div>


	<%-- <script type="text/javascript"
	src="<%=basePath%>asserts/lib/js/jquery-1.8.0.min.js"></script> --%>

</body>
</html>






