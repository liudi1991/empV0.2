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
				<h3 class="page-header">修改用户密码</h3>
				<form class="form-horizontal" action="user.do?method=modify" method="post">


					<input type="hidden" class="inputgri" name="id" value="${currentUser.id}" />

					<div class="form-group">
						<label class="control-label">姓名:</label>
						<div class="controls">
							<input id="username" value="${currentUser.username}" style="height: 30px"
								name="username" type="text" readonly>
							<span class="help-inline"></span>
						</div>


						<div class="form-group">
							<label class="control-label">请输入新密码</label>
							<div class="controls">
								<input id="password"  style="height: 30px"
									name="password" type="text" required="required"
									placeholder="请输入密码"> <span class="help-inline"></span>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label">密码确认：</label>
							<div class="controls">
								<input id="password1"  style="height: 30px" name="password1"
									type="text" required="required" placeholder="请输入密码"> <span
									class="help-inline"></span>
							</div>
							<hr>
							<div class="form-group">
								<label class="control-label"></label>

								<button type="submit" class="btn btn-primary">确定</button>
								<a href="user.do?method=home&id=${currentUser.id}"> <input class="btn btn-primary"
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














