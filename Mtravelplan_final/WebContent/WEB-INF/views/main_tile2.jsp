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
	href="<%=request.getContextPath()%>/css/style2.css" />
	
<style type="text/css">
</style>


</head>
<title>Travel</title>
<body style="margin: 0;">

	<div id="body_wrap">
		
			<div id="top_wrap" align="center">
				<tiles:insertAttribute name="top_inc"/>
			</div>

			<div id="tripcal">
				<tiles:insertAttribute name="tripcal" />
			</div>
			
			<div id="view2">
				<tiles:insertAttribute name="view2" />
			</div>

	</div>
	
</body>
</html>
