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
<link rel="stylesheet"
	href="<%=basePath%>/asserts/lib/css/bootstrap.min.css">
<title>首页</title>

</head>

<body>
	<%@include file="/include/head.jsp"%>
	<div class="rightcon">
		<div class="right_con">

			<div class="container">
				<h3 class="page-header">修改员工信息</h3>
				<form class="form-horizontal" action="emp.do?method=modify" method="post">


					<input type="hidden" class="inputgri" name="id" value="${e.id}" />

					<div class="form-group">
						<label class="control-label">姓名:</label>
						<div class="controls">
							<input id="name" value="${e.name}" style="height: 30px"
								name="name" type="text" required="required" placeholder="请输入姓名">
							<span class="help-inline"></span>
						</div>


						<div class="form-group">
							<label class="control-label">薪水:</label>
							<div class="controls">
								<input id="salary" value="${e.salary}" style="height: 30px"
									name="salary" type="text" required="required"
									placeholder="请输入姓名"> <span class="help-inline"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label">年龄:</label>
							<div class="controls">
								<input id="age" value="${e.age}" style="height: 30px" name="age"
									type="text" required="required" placeholder="请输入姓名"> <span
									class="help-inline"></span>
							</div>
							<hr>
							<div class="form-group">
								<label class="control-label"></label>

								<button type="submit" class="btn btn-primary">确定</button>
								<a href="emp.do?method=findAll"> <input class="btn btn-primary"
									type="button" class="button" value="返回" />
								</a>
							</div>
				</form>


			</div>
		</div>
	</div>


	<%-- <script type="text/javascript"
	src="<%=basePath%>asserts/lib/js/jquery-1.9.1.min.js"></script> --%>
	<script type="text/javascript"
		src="<%=basePath%>asserts/lib/js/bootstrap.min.js"></script>
</body>
</html>














