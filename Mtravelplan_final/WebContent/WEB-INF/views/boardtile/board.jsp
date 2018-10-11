<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<style>
.overlay:hover {background-color: #FFDC7E;}
</style>

<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 8%;">&nbsp;<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;게시판</font><br/><br/>

<table class="list_table" style="width:84%; margin-left: 8%;">
<colgroup>
<col width="40"/><col width="80"/><col width="265"/><col width="42"/><col width="42"/><col width="80"/><col width="55"/>
</colgroup>

<thead>
<tr>
<th>번호</th><th>아이디</th><th>제목</th><th>댓글수</th><th>조회수</th><th>작성일</th><th>삭제</th>
</tr>
</thead>
<c:if test="${empty board}">
	<tr><td colspan="7" style="height: 30px;">게시물이 없습니다</td></tr>
</c:if>


<c:forEach var="board" items="${board}" varStatus="boards">
<c:if test="${board.id eq login.id}">
<tr class="overlay" >
	<td>${boards.count}</td>
	<td>${board.id}</td>
	<td style="text-align: left;" onclick="cclick(${board.tbseq})">&nbsp;${board.title}</td>
	<td>${board.replycount}</td>
	<td>${board.readcount}</td>
	<td>${fn:substring(board.wdate,4,16)}</td>
	<td><input type="button" id="boarddel" value="삭제"  onclick="boarddel(${board.tbseq})" 
	style="vertical-align: top; width: 55px; font-size: 12px; height: 25px;"></td>
</tr>
</c:if>
</c:forEach>



<c:forEach var="board" items="${board}" varStatus="boards">
<c:if test="${board.id ne login.id}">
<tr class="overlay" style="height: 30px;">
	<td>${boards.count}</td>
	<td>${board.id}</td>
	<td style="text-align: left;" onclick="cclick(${board.tbseq})">&nbsp;${board.title}</td>
	<td>${board.replycount}</td>
	<td>${board.readcount}</td>
	<td>${fn:substring(board.wdate,4,16)}</td>
	<td>권한없음</td>
</tr>
<form name="writeForm3" id="_writeForm3" method="post" action="">
<input type="hidden" name="tbseq" value="${board.tbseq}">
</form>
</c:if>
</c:forEach>


</table>

<br><br><br>
<div align="center">
<input type="button" value="글쓰기" onclick="writeboard();">

</div>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
function cclick(tbseq) {
	location.href="boarddetail.do?tbseq="+tbseq;
}

function writeboard() {
	location.href="boardwrite.do?tseq="+${tseq};
}

function boarddel(tbseq){
 	if(window.confirm("정말 삭제하시겠습니까?"))
	location.href="boarddelete.do?tbseq="+ tbseq;
}

</script>

