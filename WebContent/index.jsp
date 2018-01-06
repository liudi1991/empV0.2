<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="gbk">
<title>员工管理系统登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="login">
<meta name="author" content="liudi">

<!-- CSS -->
<!-- 引用google字体-->
<link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
<!-- 引用Supersized插件
特性：
自动等比例调整图片并填充整浏览器个屏幕。
循环展示图片，支持滑动和淡入淡出等多种图片切换效果。
导航按钮，支持键盘方向键导航。 -->
<link rel="stylesheet" href="asserts/app/css/supersized.css">

<link rel="stylesheet" href="asserts/app/css/index.css">

</head>

<body>
	<div class="page-container">
		<h1>员工管理系统</h1>
		<c:if test="${not empty error }">
			<br>
			<div class="alert fade in">
				<font color="red">${error}</font>
			</div>
		</c:if>
		<form action="user.do?method=find" method='post'>
			<input type="text" name="username" class="username" placeholder="请输入用户名">
			<input type="password" name="password" class="password"
				placeholder="请输入密码">
			<button class="login" type="button">登陆</button>
			<button class="register" type="button">注册</button>
			<div class="error">
				<span>+</span>
			</div>
		</form>
	</div>


	<!-- Javascript -->
	<script src="asserts/app/js/jquery-1.8.2.min.js"></script>
	<script src="asserts/app/js/supersized.3.2.7.min.js"></script>
	
	<script src="asserts/app/js/index-supersized-init.js"></script>
	
	<script src="asserts/app/js/index.js"></script>

</body>
</html>