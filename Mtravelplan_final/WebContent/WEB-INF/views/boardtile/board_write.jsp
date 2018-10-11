<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 10%;">&nbsp;<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;글쓰기</font><br/><br/>

<form name="writeForm" id="_writeForm" method="post" action="" enctype="multipart/form-data">
<input type="hidden" name="tseq" value="${tseq}">

<table class="wtable" style="width: 70%; margin-left: 10%;" border="1">

<tr class="">
	<th>아이디</th>
	<td align="left"><input type="text" name="id" readonly="readonly" value="${login.id}"></td>
</tr>

<tr class="">
	<th>제목</th>
	<td><input type="text" name="title" style="width: 98%;"></td>
</tr>

<tr class="">
	<th>사진</th>
	<td><input type="file" name="fileload"></td>
</tr>

<tr class="">
	<td colspan="2"><textarea cols="115" rows="22" name="content"></textarea></td>
</tr>

<tr>
	<td colspan="2" style="text-align: center;"><input type="button" value="글쓰기" id="btbt"></td>
</tr>

</table>
</form>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$("#btbt").click(function() {
		$("#_writeForm").attr({ "target":"_self", "action":"boardwriteaf.do" }).submit();
	})
</script>


