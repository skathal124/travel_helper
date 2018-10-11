<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://query.yahooapis.com/v1/public/yql?q=select wind from weather.forecast where woeid in (select woeid from geo.places(1) where text='chicago, il')&format=json&callback=callbackFunction"></script>


<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 10%;">&nbsp;<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;경로 바구니</font><br/><br/>


<style>
.overlay:hover {background-color: #FFDC7E;}
</style>

<table class="list_table" style=" margin-left: 8%;">
<colgroup>
<col width="80"/><col width="500"/><col width="60"/>
</colgroup>

<thead>
<tr>
<th>순서</th><th>제목</th><th></th>
</tr>
</thead>
<c:forEach var="basketlist" varStatus="status" items="${basketlist}">
	<tr class="overlay" align="center" >
	<td>${status.count}</td>
	<td>&nbsp;${basketlist.basketname}</td>
	<td><input type="button" value=" 삭제 " style=" margin-top: 3px;  border-radius: 3px; width: 80%; height:80%; 
	background-color: #FF7012; color: white; font-weight: bolder; " onClick="javascript:seqclick(${basketlist.planseq})"></td>
</tr>
</c:forEach>
</table>

<script>
	function seqclick(planseq){
		$.ajax({
			type : "POST",
			url : "sharedelete.do",
			async : true,
			data: {
	        	"planseq":planseq
	       	},
			success : function(msg) {
				if(msg == 1){
					alert("삭제되었습니다");
					location.reload(); // 새로고침
				}
				else{
					alert("삭제 실패");
				}
			}
		});
		
	}
	
</script>
