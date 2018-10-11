<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board.css" />

<div id="tempdate"  val='${tempdate }'></div>
<style>
.overlay:hover {background-color: #FFDC7E;}
</style>

<br/><br/><br/>
<div id="city_top" align="center">
	<font style="font-size: 25px; font-weight: bolder; font-family: monospace; color: #C92800">Path basket</font><br />
	<font style="font-size: 13px; font-weight: bold; color: #474747;">경로를 선택하세요</font><br /><br />
</div>
<div align="right" ><font style="font-size: 15px; font-weight: bold; color: #474747;">${tempdate }&nbsp;</font></div><br/>
<table class="list_table" align="center">
<colgroup>
<col width="80"/><col width="300"/><col width="60"/>
</colgroup>

<thead>
<tr>
<th>순서</th><th>제목</th><th></th>
</tr>
</thead>
<c:forEach var="basketlist" varStatus="number" items="${basketlist}">
	<tr class="overlay" align="center">
	<td>${number.count}</td>
	<td>${basketlist.basketname}</td>
	<td><input type="button" value=" 선택 " style=" margin-top: 3px;  border-radius: 3px; width: 80%; height:80%; 
	background-color: #FF7012; color: white; font-weight: bolder; " onClick="javascript:seqclick(${basketlist.planseq})"></td>
</tr>
</c:forEach>
</table>
<input type="hidden" id="tseq" value="${tseq }">
<input type="hidden" id="tcseq" value="${tcseq }">
<div align="right" style="margin-top: 11px">
	<span id='message'>
		<font style="font-size: 13px; font-weight: bold; color: #474747; ">선택을 누를시 ${tempdate }에 적용됩니다&nbsp;</font>
	</span>
</div>
<script>
	function seqclick(planseq){
		var tempdatee = $('#tempdate').attr("val");
		var tseq = document.getElementById("tseq").value;
		var tcseq = document.getElementById("tcseq").value;
		
		$.ajax({
	         type: "POST",
	         url: "./getbasketdaily.do",
	         async: true,         
	         data: {
	        	 "planseq":planseq,
	        	 "someday":tempdatee,
	        	 "tseq":tseq,
	        	 "tcseq":tcseq
	        	 },
	         success: function(msg){
	            if(msg == "OK"){
					alert('적용 완료');
					opener.location.reload(); // 부모창 새로 고침
	             	location.reload(); // 새로고침
	             	self.close();
	            }
	            else {
	            	alert('등록 실패');
	            }
	         }
	    }); 
		
	}
</script>