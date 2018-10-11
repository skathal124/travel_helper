<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<html>

<form name="frmForm" id="_frmForm" action="photoWriteAf.do" method="post" 
enctype="multipart/form-data">

<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 10%;">&nbsp;<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;글쓰기</font><br/><br/>


<table class="wtable" style="width: 60%; margin-left: 10%;" border="1">

<tr>
<th>아이디</th>
<td style="text-align: left"><input type="text" name='id' readonly="readonly"
value="${login.id}" size="50"/></td>
</tr>

<tr>
<th>제목</th>
<td style="text-align: left"><input type="text" name='title' style="width: 98%;"/></td>
</tr>


<tr>
<th>파일업로드</th>
<td style="text-align: left"><input type="file" name="fileload"></td>
</tr>




<tr>
<td colspan="2" style="height:50px; text-align:center;">
	<input id="_btnOk" type="submit" value="사진등록">
	<input type="hidden" value="${tseq}" name="tseq">
</td>
</tr>

</table>
</form>

</html>
<script type="text/javascript">
$("#_btnOk").click(function() {
	$("#_frmForm").submit();
	
	/* setTimeout("ozit_timer_test()", 10); */
});
</script>