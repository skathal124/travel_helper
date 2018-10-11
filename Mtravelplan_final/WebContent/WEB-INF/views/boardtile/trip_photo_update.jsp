<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<html>

<title>Insert title here</title>
<br><br><br>
<form name="frmForm" id="_frmForm" action="updateGroupPhotoAf.do" method="post" 
enctype="multipart/form-data">
<table class="list_table" style="width:85%;">
<h3>Group Photo 수정</h3>
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>
<tr>
<th>아이디</th>
<td style="text-align: left"><input type="text" name='id' readonly="readonly"
value="${talbum.id}" size="50"/></td>
</tr>
<tr>
<th>제목</th>
<td style="text-align: left"><input type="text" name='title' size="50" value="${talbum.title}"/></td>
</tr>
<tr>
<tr>
<th>파일업로드</th>
<td style="text-align: left"><input type="file" name="fileload" style=" width : 400px;"></td>
</tr>

<tr>
<td colspan="2" style="height:50px; text-align:center;">
			<input id="_btnOk" type="submit" value="수정하기">
</td>
</tr>
</table>
<input type="hidden" value='${talbum.seq}' name="seq">
<input type="hidden" value='${talbum.tseq}' name="tseq">
</form>

</html>
<script type="text/javascript">
$("#_btnOk").click(function() {
	$("#_frmForm").submit();
	
	/* setTimeout("ozit_timer_test()", 10); */
});
</script>