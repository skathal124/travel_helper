<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html lang="ko">
<head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/mypage.css" />

<style type="text/css">
</style>

</head>
<title>MyPage</title>

<body style="margin: 0;">

<div id="body_wrap">

	<div id="main_wrap">

		<div id="top_wrap" align="center">
			<tiles:insertAttribute name="top_inc"/>
		</div>

		<div id="hap_wrap">
		
			<div id="left_view">
				<tiles:insertAttribute name="left_menu"/>
			</div>
			
			<div id="main_view">
				<tiles:insertAttribute name="main_view"/>
			</div>
		
		</div>
		
		
		

	</div>
</div>


</body>
</html>