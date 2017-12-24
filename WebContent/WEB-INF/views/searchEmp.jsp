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
			<div style="text-align: center" >
				
				<h1>查找员工</h1>
				<table>
					<form id="add_from" action="emp.do?method=find" method="post">
						<div class="form-group">
							<label class="control-label">ID</label>
							<div class="controls">
								<input id="id" value="${e.name}" style="height: 30px"
									name="id" type="text" required="required" placeholder="请输入ID">
								<span class="help-inline"></span>
							</div>
								<div class="form-group">
									<label class="control-label"></label>
									<button type="submit" class="btn btn-primary">查找</button>
									<a href="emp.do?method=findAll"> <input class="btn btn-primary"
										type="button" class="button" value="返回" />
									</a>
								</div>
					</form>
				</table>

			</div>
		</div>
	</div>


	<%-- <script type="text/javascript"
	src="<%=basePath%>asserts/lib/js/jquery-1.9.1.min.js"></script> --%>
	<script type="text/javascript"
		src="<%=basePath%>asserts/lib/js/bootstrap.min.js"></script>
</body>
</html>









