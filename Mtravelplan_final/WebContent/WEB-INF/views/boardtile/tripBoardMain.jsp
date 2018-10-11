<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<style>
.overlay:hover {background-color: #FFDC7E;}
.list_table tr td { padding-top:0.6em; padding-bottom:0.6em;}
</style>



<br><br><br>
<table class="list_table" style="width:80%; margin-left: 10%; position: relative;">
<colgroup>
<col width="60"/><col width="250"/>
</colgroup>

<thead>
<tr style=" border-bottom: solid 2px #BDBDBD;">
<th>번호</th><th>소속 그룹</th>
</tr>
</thead>

<c:if test="${empty triplist}">
<tr>
	<td colspan="2">소속된 그룹이 없습니다</td>
</tr>
</c:if>


<c:forEach var="trip" items="${triplist}" varStatus="trips">
<tr style="border-bottom: solid 2px #BDBDBD;" class="overlay" >
	<td>${trips.count}</td>
	<td onclick="cclick(${trip.tseq})">${trip.tname}</td>
</tr>
</c:forEach>

</table>
	
	
	
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function cclick(tseq) {
		location.href="board.do?tseq="+tseq;
	}
</script>

