<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>

<link rel="stylesheet" type="text/css" href="asserts/app/css/index/style.css" />


<div class="nav-top">
	<span><a href="user.do?method=home&id=${currentUser.id}">Ա������ϵͳ</a></span>
    <div class="nav-topright">
    	<p id="timer"></p>
        <span><font color="red">���ã�${currentUser.username}</font></span>
        <span><a href="user.do?method=premodify&id=${currentUser.id}">�޸�����</a></span>
        <span><a href="user.do?method=logout">�˳�ϵͳ</a></span>
    </div> 
</div>
<div class="nav-down">
	<div class="leftmenu1">
        <div class="menu-oc"><img src="asserts/app/images/menu-all.png" /></div>
    	<ul>
        	<li>
            	<a class="a_list a_list1">Ա������</a>
                <div class="menu_list menu_list_first">
                	<a class="lista_first" href="emp.do?method=findAll">Ա�����</a>
                    <a href="emp.do?method=presave">���Ա��</a>
                    <a href="emp.do?method=prefind">����Ա��</a>
                  
                </div>
            </li>
            <li>
            	<a class="a_list a_list2">Ա��ҵ��</a>
                <div class="menu_list">
                	<a href="sortAsc.do">��������</a>
                    <a href="sortDesc.do">��������</a>
                    <a href="bar.do">���ʷ���</a>
                    <a href="emp.do?method=grid">jQgrid</a>
                </div>
            </li>
           <li>
            	<a class="a_list a_list2">Ա�����</a>
                <div class="menu_list">
                	<a href="emp.do?method=photo">Ա�����</a>
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
                	<span class="sp1"><i></i>Ա������</span>
                	<a class="j_lista_first" href="emp.do?method=findAll">Ա�����</a>
                    <a href="emp.do?method=presave">���Ա��</a>
                    <a href="emp.do?method=prefind">����Ա��</a>
                    
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list2"></a>
                <div class="j_menu_list">
                	<span class="sp2"><i></i>Ա��ҵ��</span>
                	<a href="sortAsc.do">��������</a>
                    <a href="sortDesc.do">��������</a>
                    <a href="bar.do">���ʷ���</a>
                    <a href="emp.do?method=grid">jQgrid</a>
                </div>
            </li>
            <li>
            	<a class="j_a_list j_a_list2"></a>
                <div class="j_menu_list">
                <span class="sp2"><i></i>Ա�����</span>
                	<a href="emp.do?method=photo">Ա�����</a>
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