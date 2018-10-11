<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>


<br/><br/><br/>

<font style="font-size: 14px; font-weight: bolder; margin-left: 10%;">&nbsp;<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;상세보기</font>
<br><br>

<table class="dtable" style="width: 60%; margin-left: 10%; border-collapse: collapse; ">
<colgroup>
<col width="30"/><col width="100"/>
</colgroup>
<tr>
	<th>아이디</th>
	<td align="left">&nbsp;${login.id}</td>
</tr>

<tr>
	<th>제목</th>
	<td>&nbsp;${board.title}</td>
</tr>

<tr>
	<c:choose>
		<c:when test="${fn:contains(board.filename, 'back')}">
		<th>사진</th>
		<td>&nbsp;사진이 없습니다</td></c:when>
		<c:otherwise>
		<th style="width: 80px;">사진</th>
		<td>&nbsp;<img class="img" src="./webimage/${board.filename}" style="width: 300px; height: auto;"/>
		</c:otherwise>
	</c:choose>
	
</tr>

<tr>
<th>내용</th>
	<td colspan="2" >&nbsp;${board.content}</td>
</tr>

</table>

<br>

<div style="width: 60%; margin-left: 10%; border-bottom: solid 1px #BDBDBD;" align="center">
<c:if test="${board.id eq login.id}">
<a href="board.do?tseq=${board.tseq}"><input type="button" value="목록"></a>&nbsp;&nbsp;
<a href="boardupdate.do?tbseq=${board.tbseq}"><input type="button" value="수정하기"></a><br><br>
</c:if>

<c:if test="${board.id ne login.id}">
<a href="board.do?tseq=${board.tseq}"><input type="button" value="목록"></a>&nbsp;&nbsp;<br><br>
</c:if>
</div>




<!-- 댓글 -->

<br><br><br>
<font style="font-size: 14px; font-weight: bolder; margin-left: 10%;">&nbsp;<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;댓글(${board.replycount})</font><br/><br/>
<form name="writereForm" id="_writereForm" method="post" action="">
<div style="width: 60%; margin-left: 10%;" align="left">

<input type="hidden" name="tbseq" value="${board.tbseq}">
<input type="hidden" name="id" value="${login.id}">
<input type="text" name="content" style="margin-top: 3px; border: solid 1.4px #DB3A00; border-radius: 4px; width: 80%; height: 18px;">&nbsp;
<input type="button" value="댓글달기" id="btbt2">
</div>
<br>
</form>
<div>
<table class="replytable" >


<col width="30"/><col width="70"/><col width="300"/>


<tr style="background-color: #FF5E00; color: white; height: 2.2em; ">
	<th>번호</th><th>아이디</th><th>내용</th>
</tr>


<c:forEach var="reply" items="${reply}" varStatus="replys">
<tr align="center" style="height: 1.8em; border-bottom: solid 1px gray;">
	<td>${replys.count}</td>
	
	<c:if test="${reply.id eq board.id}">
	<td style="color: red">글쓴이</td>
	</c:if>
	
	<c:if test="${reply.id ne board.id}">
	<td>${reply.id}</td>
	</c:if>
	
	<td align="left">&nbsp;${reply.content}</td>
</tr>
</c:forEach>

</table>
</div>
<br><br>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$("#btbt2").click(function() {
		$("#_writereForm").attr({ "target":"_self", "action":"boardreply.do" }).submit();
	})
</script>


