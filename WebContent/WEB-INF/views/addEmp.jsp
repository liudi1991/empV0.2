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
			<div style="text-align: center">

				<h1>添加员工</h1>
				<table>
					<form id="add_from" action="emp.do?method=save" method="post"
						onsubmit="return check()">
						<div class="form-group">
							<label class="control-label">姓名</label>
							<div class="controls">
								<input id="name" value="" style="height: 30px" name="name"
									type="text" required="required" placeholder="请输入姓名"> <span
									class="help-inline"></span>
							</div>
						</div>


						<div class="form-group">
							<label class="control-label">薪水</label>
							<div class="controls">
								<input id="salary" value="" style="height: 30px" name="salary"
									type="text" required="required" placeholder="请输入薪水,格式为xxx.xx" />
							</div>
							<span class="help-inline"><font color="red"
								id='salaryError'></font></span>
						</div>
						<div class="form-group">
							<label class="control-label">年龄</label>
							<div class="controls">
								<input id="age" value="" style="height: 30px" name="age"
									type="text" required="required" placeholder="请输入年龄" />

							</div>
							<span class="help-inline"><font color="red" id='ageError'></font></span>
							<div class="form-group">
								<label class="control-label"></label>

								<button id='ok' type="submit" class="btn btn-primary">确定</button>
								<a href="emp.do?method=findAll"> <input class="btn btn-primary"
									type="button" class="button" value="返回" />
								</a>
							</div>
					</form>
				</table>

			</div>
		</div>
	</div>


	<script type="text/javascript"
		src="<%=basePath%>asserts/lib/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>asserts/lib/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		function check() {
			var salary = $("#salary").val();

			var reg = /^\d+/;
			if (reg.test(salary) == false) {
				$("#salaryError").text('薪水无效，请重新输入！');
				return false;
			}
			var age = $("#age").val();
			var reg = /^([1-9]\d)|100$/;
			if (reg.test(age) == false) {
				$("#ageError").text('年龄不合法，请重新输入！');
				return false;
			}
			return true;
		}
	</script>


</body>
</html>









