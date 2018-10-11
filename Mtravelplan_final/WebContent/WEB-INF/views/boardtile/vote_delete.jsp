<%@page import="com.travel.plan.tripboard.model.TripPoll"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="com.travel.plan.tripboard.help.DateUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<c:if test="${empty plist}">
<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 1%;">&nbsp;
<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;투표</font><br/><br/>

<table class="vote_table" border="1">

<colgroup>
<col width="40"/><col width="80"/><col width="220"/><col width="80"/><col width="80"/><col width="50"/><col width="50"/><col width="50"/><col width="80"/>
</colgroup>
	
	
	
   <tr>
     <td>등록된 투표가 없습니다.</td>
   </tr>
	



</table>

</c:if>
<c:if test="${!empty plist}">
<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 1%;">&nbsp;
<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;투표 지우기</font><br/><br/>

<table class="vote_table" border="1">

<colgroup>
<col width="40"/><col width="80"/><col width="220"/><col width="80"/><col width="80"/><col width="80"/><col width="70"/>
</colgroup>
	

	
   <tr>
      <th>번호</th><th>아이디</th><th>질문</th><th>결과</th><th>투표수</th><th>등록일</th><th>삭제</th>
   </tr>

	<c:forEach var="plist" items="${plist}"  varStatus="count">
	 <tr bgcolor='#aabbcc'>
        <td>${count.count}</td>
        <td>${plist.id}</td>
		<td>${plist.question}</td>
		<td><a href='voteDeleteresult.do?tpseq=${plist.tpseq}&tseq=${plist.tseq}'>결과보기</a></td>
		<td>${plist.polltotal}</td>
		<td>${plist.regdate}</td>
		<td><input type="button" value="삭제" class="btn_delete"
		data-attache_file_tpseq="${plist.tpseq}" data-attache_file_tseq="${plist.tseq}" ></td>

	</tr>
	</c:forEach>
	
</table>
<br><br><br>
<form action="" method="post" id="_poll_delete_form">
	<input type="hidden"  name="tpseq" id="_tpseq" />
	<input type="hidden"  name="tseq" id="_tseq" />
</form>
</c:if>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
 $(document).ready(function()
{
 $('tr:odd').addClass('odd');
  $('tr:even').addClass('even');
  
 });
 
 $(".btn_delete").click(function(){
	
	 if (window.confirm("투표를 삭제 하시겠습니까?")){
		 $("#_tpseq").val($(this).attr("data-attache_file_tpseq"));
		 $("#_tseq").val($(this).attr("data-attache_file_tseq")); 
		 alert($("#_tpseq").val());
		$("#_poll_delete_form").attr( {"action":"voteDeleteAf.do"} ).submit(); 
	 }

});
 
</script>