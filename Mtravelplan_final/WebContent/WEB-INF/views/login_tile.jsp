<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/login.css" />
<style type="text/css">
</style>

</head>
<title>Travel</title>
<body>

	<div id="main_wrap" class="container" >
		
		<div id="login" class="row">
			<tiles:insertAttribute name="login"/>
		</div>
	
	</div>

</body>
</html>
