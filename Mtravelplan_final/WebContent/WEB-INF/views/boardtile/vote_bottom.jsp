
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="com.travel.plan.tripboard.help.DateUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<html>
<div align="center">
<input type="button" align="middle" onclick="javascript:writev()" value="투표 만들기" style="width:140px; height: 40px; font-size: 15px;background: #FF8224; color: black;">
</div>


	
</html>
<script type="text/javascript">
function writev() {
	   location.href="voteWrite.do?tseq="+${tseq};
	}
</script>