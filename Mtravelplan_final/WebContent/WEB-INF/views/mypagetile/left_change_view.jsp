<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<style>
<!--
.menu_table li.menu_item a:hover { background-image:url("<%=request.getContextPath()%>/image/arrow.gif"); background-repeat:no-repeat; background-position:5px 7px; background-color:#FFFFFF; }
-->
</style>
<div class="menu_table">
	<br/><br/>
	<ul style="width:100%;">
	<li class="title">My Page</li>
	<li class="subtitle">&nbsp;그룹</li>
	<li class="menu_item"><a href="changeinfo.do" >회원정보 수정</a></li>		
	<li class="menu_item"><a href="deleteinfo.do" >회원 탈퇴</a></li>						
	</ul>
	<br/><br/>

</div>
			