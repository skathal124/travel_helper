<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/board.css" />
<c:if test="${empty sharelist}">
		<div align="center" style="vertical-align: middle;">
		
		<br /><br />
			<a style="font-size: 14px; font-weight: bolder;">등록된 일정이 없습니다</a> <br />
			<br />

		</div>
</c:if>


<style>
.overlay:hover {background-color: #FFDC7E;}
.list_table td {height: 27px;}
</style>

<div align="center">
<font style="font-size: 14px; font-weight: bolder;">&nbsp;<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;일정 공유 게시판</font><br/><br/>
</div>







	<form name="frmForm1" id="_frmFormSearch" method="post" action="">
		<table
			style="margin-top: 3px; margin-bottom: 3px; margin-left: auto; margin-right: auto;">
			<tr>
				<td style="font-size: 13px; font-weight: bold;">&nbsp;*검색 :</td>
				<td style="padding-left: 5px;">
				
				
				<select id="_s_category" name="s_category">
						<option value=""
							<c:if test="${(s_category eq '') or empty s_category}"> selected="selected" </c:if> >선택</option>
						<option value="sbname"
							<c:if test="${s_category eq 'sbname'}"> selected="selected" </c:if>>제목</option>
						<option value="sbcity"
							<c:if test="${s_category eq 'sbcity'}"> selected="selected" </c:if>>도시</option>
				</select></td>
				
				
				<td style="padding-left: 5px;"><input type="text" style="width: 200px; border: solid 1px GRAY;"
					id="_s_keyword" name="skeyword" value="${skeyword}" /></td>
				<td style="padding-left: 5px;"><button type="button" id="_btnSearch" >검색</button></td>
			</tr>
		</table>
		
<!-- 		<input type="hidden" name="pageNumber" id="_pageNumber" -->
<%-- 		value="${(empty pageNumber)?0:pageNumber}" />  --%>
<!-- 		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" -->
<%-- 		value="${(empty recordCountPerPage)?10:recordCountPerPage}" /> --%>
		
	</form>





<table class="list_table" style="margin-left: auto; margin-right: auto;">
<colgroup>
<col width="60"/><col width="120"/><col width="500"/><col width="170"/><col width="70"/>
</colgroup>

<thead>
<tr>
<th>번호</th><th>아이디</th><th>제목</th><th>방문 도시</th><th>좋아요</th>
</tr>
</thead> 
<c:forEach var="sharelist" items="${sharelist}" varStatus="sharelists">
<tr class="overlay" align="center">
	<td>${sharelists.count}</td>
	<c:if test="${sharelist.id eq login.id}">
		<td><input type="button" value=" 공유 취소 " style="border-radius: 3px;  background-color: #FF8224; color: white; font-weight: bolder; font-size: 11px;" onclick="javascript:sharecan('${sharelist.sbseq}')"></td>
	</c:if>
	<c:if test="${sharelist.id ne login.id}">				
		<td>${sharelist.id}</td>
	</c:if>
		<td  onclick="javascript:seqclick('${sharelist.tseq}')">&nbsp;${sharelist.sbname}</td>
	<td>${sharelist.sbcity}</td>
	<td>${sharelist.totallike}</td>
</tr>

</c:forEach>
</table>



<script>
	function sharecan(sbseq){
		var url = "sharecan.do?sbseq="+sbseq+"";
		location.href=url;
	}

	function seqclick(tseq){
		
		var url = "sharedetail.do?tseq="+tseq+"";
		location.href=url;
		
	}
	
	
	$("#_btnSearch").click(function() {
		//alert('search');						
		$("#_frmFormSearch").attr({
			"target" : "_self",
			"action" : "sbsearch.do"
		}).submit();
	});
</script>