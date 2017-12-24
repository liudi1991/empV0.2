<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>

<link rel="stylesheet" type="text/css" href="asserts/app/css/index/style.css" />


<div class="nav-top">
	<span><a href="user.do?method=home&id=${currentUser.id}">员工管理系统</a></span>
    <div class="nav-topright">
    	<p id="timer"></p>
        <span><font color="red">您好：${currentUser.username}</font></span>
        <span><a href="user.do?method=premodify&id=${currentUser.id}">修改密码</a></span>
        <span><a href="user.do?method=logout">退出系统</a></span>
    </div> 
</div>
<div class="nav-down">
	<div class="leftmenu1">
        <div class="menu-oc"><img src="asserts/app/images/menu-all.png" /></div>
    	<ul>
        	<li>
            	<a class="a_list a_list1">员工设置</a>
                <div class="menu_list menu_list_first">
                	<a class="lista_first" href="emp.do?method=findAll">员工浏览</a>
                    <a href="emp.do?method=presave">添加员工</a>
                    <a href="emp.do?method=prefind">查找员工</a>
                  
                </div>
            </li>
            <li>
            	<a class="a_list a_list2">员工业绩</a>
                <div class="menu_list">
                	<a href="sortAsc.do">升序排列</a>
                    <a href="sortDesc.do">降序排列</a>
                    <a href="bar.do">工资分析</a>
                    <a href="grid.do">jQgrid</a>
                </div>
            </li>
           <li>
            	<a class="a_list a_list2">员工风采</a>
                <div class="menu_list">
                	<a href="emp.do?method=photo">员工相册</a>
                    <a href="#">#</a>
                    <a href="#">#</a>
                    <a href="#">##</a>
                </div>
            </li>
        </ul>
    </div>
    <div class="leftmenu2">
    	<div class="menu-oc1"><img src="asserts/app/images/menu-all.png" /></div>
        <ul>
        	<li>
            	<a class="j_a_list j_a_list1"></a>
                <div class="j_menu_list j_menu_list_first">
                	<span class="sp1"><i></i>员工设置</span>
                	<a class="j_lista_first" href="emp.do?method=findAll">员工浏览</a>
                    <a href="emp.do?method=presave">添加员工</a>
                    <a href="emp.do?method=prefind">查找员工</a>
                    
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list2"></a>
                <div class="j_menu_list">
                	<span class="sp2"><i></i>员工业绩</span>
                	<a href="sortAsc.do">升序排列</a>
                    <a href="sortDesc.do">降序排列</a>
                    <a href="bar.do">工资分析</a>
                    <a href="grid.do">jQgrid</a>
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list2"></a>
                <div class="j_menu_list">
                <span class="sp2"><i></i>员工风采</span>
                	<a href="emp.do?method=photo">员工相册</a>
                    <a href="#">#</a>
                    <a href="#">#</a>
                    <a href="#">##</a>
                </div>
            </li>
            
        </ul>
        
    </div>
    
<script type="text/javascript" src="asserts/app/js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="asserts/app/js/index.js"></script>
<script language="javascript" type="text/javascript" charset="utf-8" src="asserts/app/js/timer.js"></script>