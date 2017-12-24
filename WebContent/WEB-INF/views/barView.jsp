<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<!-- jquery -->


<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="asserts/lib/js/excanvas.min.js"></script><![endif]-->


</head>

<body>
	<%@include file="/include/head.jsp"%>
	<div class="rightcon">
		<div class="right_con">
			<div style="text-align: center">
			<h2 >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图表信息</h2>
				
				<div id="placeholder" style="width: 600px; height: 300px;"></div>

			




			</div>

		</div>
	</div>
	<!--[if lte IE 8]><script language="javascript" type="text/javascript" src="asserts/lib/js/excanvas.min.js"></script><![endif]-->
	
	<script type="text/javascript" src="asserts/lib/js/jquery-1.8.0.min.js"></script>

	<script language="javascript" type="text/javascript"
		src="asserts/lib/js/jquery.flot.js"></script>
		
		
	<!-- <script type="text/javascript">
        $(document).ready(function () {
            $.plot($("#flot-placeholder"),
                   data, 
                   options);
        });
    </script>	  -->
	<script type="text/javascript">
		$(function() {
			
			var d1 = [];
			for (var i = 0; i < 14; i += 0.5)
				d1.push([ i, Math.sin(i) ]);

			var d2 = [ [ 0, 3 ], [ 4, 8 ], [ 8, 5 ], [ 9, 13 ] ];

			// a null signifies separate line segments
			var d3 = [ [ 0, 12 ], [ 7, 12 ], null, [ 7, 2.5 ], [ 12, 2.5 ] ];

			$.plot($("#placeholder"), [ d1, d2, d3 ]);
		});
	</script>
</body>
</html>