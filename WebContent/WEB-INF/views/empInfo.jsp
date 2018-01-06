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

<title>首页</title>

</head>

<body>
	<%@include file="/include/head.jsp"%>
	<div class="rightcon">
		<div class="right_con">
			<div style="text-align: center">

				<p style="text-align: center"><h1>员工详细信息</h1>
				<table class="table table-bordered">
					<tr class="table_header">
						<td>ID</td>
						<td>姓名</td>
						<td>薪水</td>
						<td>年龄</td>

					</tr>
					<c:if test="${empty e}">
						<tr>
							<td colspan="4">没有数据</td>
						</tr>
					</c:if>
					<c:if test="${not empty e }">
						
							<tr>
								<td>${e.id}</td>
								<td>${e.name}</td>
								<td>￥${e.salary }</td>
								<td>${e.age}</td>	
							</tr>
							
								
						
					</c:if>

				</table>
				<p>
					<a class="btn btn-warning" href="emp.do?method=premodify&id=${e.id}">修改</a>&nbsp;
									<a class="btn btn-danger" href="emp.do?method=delete&id=${e.id}"
						onclick="return confirm('确定删除${e.name}吗?');">删除</a>
					<a href="emp.do?method=findAll"> <input class="btn btn-primary"
									type="button" class="button" value="返回" />
								</a>	
				</p>
				
				
            
        </div>
    </div>
</div>



</body>
</html>
