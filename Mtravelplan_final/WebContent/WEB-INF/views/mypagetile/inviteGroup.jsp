<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 10%;">&nbsp;<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;초대받은 그룹</font><br/><br/>

<table class="list_table" style="width:80%; margin-left: 10%;">
<colgroup>
<col width="50"/><col width="350"/><col width="70"/><col width="70"/>
</colgroup>
<thead>
<tr>
<th>번호</th><th>여행 이름</th><th>승낙</th><th>거부</th>

</tr>
</thead>


<c:if test="${empty triplist}">
<tr class="_hover_tr">
<td colspan="4">초대받은 그룹이 없습니다</td>
</tr>
</c:if>

<c:if test="${!empty triplist}">
<c:forEach var="list" items="${triplist}" varStatus="lists">
<tr class="_hover_tr">
<td>${lists.count}</td>
<td>${list.tname}</td>
<td><input type="button" name="btnDown2" class="btn_Accetp" value="승낙" data-attache_file_name="${list.tseq}"/></td>
<td><input type="button" name="btnDown2" class="btn_fileDelete" value="거부" data-attache_file_name2="${list.tseq}"/></td>
</tr>
    	<form name="frmForm2" id="_frmForm2"  action="delmypage.do" method="post">
			<input type="hidden" id="_tseq2" name='tseq' />
		</form>
	 	<form name="frmForm1" id="_frmForm1" action="addmypage.do" method="post">
			<input type="hidden" id="_tseq1" name='tseq' />
		</form>

</c:forEach>
</c:if>
</table>
<script type="text/javascript">
$(".btn_fileDelete").click(function() { // 버튼마다 클래스 부여해서 해당하는 곳 this로 부름
	if (window.confirm("거절하시겠습니까?"))
	{			
	 	$("#_tseq2").val($(this).attr("data-attache_file_name2"));
		alert($("#_tseq2").val()); 
		$("#_frmForm2").attr( {"action":"delmypage.do"} ).submit();
	}
});

 $(".btn_Accetp").click(function() { // 버튼마다 클래스 부여해서 해당하는 곳 this로 부름
	if (window.confirm("그룹을 추가하시겠습니까?"))
	{			
		$("#_tseq1").val($(this).attr("data-attache_file_name"));
		alert($("#_tseq1").val());
		$("#_frmForm1").attr( {"action":"addmypage.do"} ).submit();
	}
});


</script>
