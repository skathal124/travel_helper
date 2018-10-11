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
	href="<%=request.getContextPath()%>/css/board.css" />
<style type="text/css">
</style>
</head>


<body style="margin: 0;">


<div id="body_wrap">

	<div id="main_wrap">
		
		<div id="top_wrap" align="center" style="border-bottom: solid 1px white;">
			<tiles:insertAttribute name="top_inc"/>
		</div>
		
		<div id="top_pic" style="width: 80%; margin-left: 10%; border: 0; padding: 0;">
			<img src="image/board3.png" width="100%" height="auto">
		</div>
		
		<div id="tbmain_view">
			<tiles:insertAttribute name="tbmain_view"/>
		</div>
		
		


	</div>
	
	
</div>
</body>
</html>