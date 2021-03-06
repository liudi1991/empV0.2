<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">


<meta charset="gbk">
<title>员工管理系统注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="login">
<meta name="author" content="liudi">

<!-- CSS -->
<link rel='stylesheet'
	href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>

<link rel="stylesheet" href="asserts/lib/css/supersized.css">
<link rel="stylesheet" href="asserts/app/css/index.css">

</head>

<body>
	<div class="page-container">
		<h1>账号注册</h1>
		<c:if test="${not empty error }">
				<br>
			<div class="alert fade in"><font color="red">${error}</font></div>
		</c:if>
		<form action="user.do?method=save" method="post">
			<input type="text" name="username" class="username" placeholder="用户名">
			<input type="password" name="password" class="password"
				placeholder="密码">

			<button class="register" type="submit">注册</button>
			<button class="return" type="submit">返回</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>

	</div>


	<!-- Javascript -->
	<script src="asserts/lib/js/jquery-1.8.2.min.js"></script>
	<script src="asserts/lib/js/supersized.3.2.7.min.js"></script>
	
	<script src="asserts/app/js/index-supersized-init.js"></script>
	<script src="asserts/app/js/index.js"></script>

</body>
</html>