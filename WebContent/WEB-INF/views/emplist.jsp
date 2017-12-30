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

<title>��ҳ</title>

</head>

<body>
<%@include file="/include/head.jsp" %>
    <div class="rightcon">
    	<div class="right_con">
            <p style="text-align: center">
            
				<h1 align="center">Ա���б�</h1>
				<table class="table table-bordered" align="center">
					<tr class="table_header">
						<td>ID</td>
						<td>����</td>
						<td>нˮ</td>
						<td>����</td>
						<td>����</td>
					</tr>
					<c:if test="${empty employees}">
						<tr>
							<td colspan="5">û������</td>
						</tr>
					</c:if>
					<c:if test="${not empty employees }">
						<c:forEach var="e" items="${employees}">
							<tr>
								<td>${e.id}</td>
								<td>${e.name}</td>
								<td>��${e.salary }</td>
								<td>${e.age}</td>
								<td><a class="btn btn-info" href="emp.do?method=findByID&id=${e.id}">�鿴����</a>&nbsp;
									<a class="btn btn-warning" href="emp.do?method=premodify&id=${e.id}">�޸�</a>&nbsp;
									<a class="btn btn-danger" href="emp.do?method=delete&id=${e.id}"
									onclick="return confirm('ȷ��ɾ��${e.name}��?');">ɾ��</a></td>
							</tr>
						</c:forEach>
					</c:if>

				</table>
				</p>
            
        </div>
    </div>
</div>


<%-- <script type="text/javascript"
	src="<%=basePath%>asserts/lib/js/jquery-1.8.0.min.js"></script> --%>

</body>
</html>






