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
<title>��ҳ</title>

</head>

<body>
	<%@include file="/include/head.jsp"%>
	<div class="rightcon">
		<div class="right_con">
			<p style="text-align: center">
			<div class="container">
				<form action="sortDesc.do" method="post">
					<div class="radio">
						<label> <input type="radio" name="sort"
							id="optionsRadios1" value="id" checked>
						<h3>����id��������</h3>
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="sort"
							id="optionsRadios2" value="age">
							<h3>�������併������</h3>
						</label>
					</div>
					<div class="radio">
						<label> <input type="radio" name="sort"
							id="optionsRadios2" value="salary">
							<h3>���չ��ʽ�������</h3>
						</label>
					</div>

					<div class="radio">
						<label> <input type="radio" name="sort"
							id="optionsRadios2" value="name">
							<h3>����������������</h3>
						</label>
					</div>
					<div class="form-group">
						<label class="control-label"></label>

						<button type="submit" class="btn btn-primary">ȷ��</button>
						<a href="home.do"> <input class="btn btn-primary"
							type="button" class="button" value="����" />
						</a>
					</div>
				</form>
			</div>
			</p>


		</div>
	</div>
	</div>


	<script type="text/javascript"
		src="<%=basePath%>asserts/lib/js/jquery-1.8.0.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>asserts/lib/js/bootstrap.min.js"></script>
</body>
</html>






