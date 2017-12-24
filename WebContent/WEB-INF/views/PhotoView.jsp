<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
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
<title>首页</title>
<link rel="stylesheet"
	href="<%=basePath%>/asserts/lib/css/bootstrap.min.css">
<style>
.galleria {
	width: 800px;
	height: 450px;
	background: #000
}
</style>

</head>

<body>
	<%@include file="/include/head.jsp"%>
	<div class="rightcon">
		<div class="right_con">
			
			<div class="container">
			
				<h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员工风采</h2>
				<div class="galleria">
					<img src="asserts/photo/Chrysanthemum.jpg"> <img src="asserts/photo/Desert.jpg"> <img
						src="asserts/photo/Hydrangeas.jpg">
					<img src="asserts/photo/Jellyfish.jpg"><img src="asserts/photo/Koala.jpg">
					<img src="asserts/photo/Lighthouse.jpg"><img src="asserts/photo/Penguins.jpg">
					<img src="asserts/photo/Tulips.jpg">
				</div>
				
			</div>
			
			<a href="home.do"> <input class="btn btn-primary"
									type="button" class="button" value="返回" />
								</a>
			
		</div>
	</div>
	
	<script type="text/javascript" src="asserts/lib/js/jquery-1.8.0.min.js"></script>
	<script src="asserts/galleria/galleria-1.4.2.min.js"></script>
	<script>
		Galleria
				.loadTheme('asserts/galleria/themes/classic/galleria.classic.min.js');

		Galleria.run('.galleria');
	</script>

</body>
</html>