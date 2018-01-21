<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>首页</title>

</head>

<body>
	<%@include file="/include/head.jsp"%><!--静态包含-->
	<div class="rightcon">
		<div class="right_con">
			<div id='map'></div>
			<div id="layerControl" class="layerControl">
				<div class="title">
					<label>图层列表</label>
				</div>
				<ul id="layerTree" class="layerTree"></ul>
			</div>
			<div id="menu">
				<button id="zoom-out" class="btn btn-default">点击缩小</button>
				<button id="zoom-in" class="btn btn-default">点击放大</button>
				<button id="panTo" class="btn btn-default">平移到【武汉】</button>
				<button id="reset" class="btn btn-default">复位</button>
			</div>

			<div id="mouse-position"></div>

		</div>
	</div>
	<script type="text/javascript" charset="utf-8"
		src="asserts/lib/js/ol.js"></script>
	<script type="text/javascript" charset="utf-8"
		src="asserts/app/js/gis.js"></script>
</body>
</html>