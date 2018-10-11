<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="utf-8" />

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<style>
.ui-datepicker {
	font-size: 12px;
	width: 220px;
}

.ui-datepicker select.ui-datepicker-month {
	width: 30%;
	font-size: 13px;
}

.ui-datepicker select.ui-datepicker-year {
	width: 40%;
	font-size: 13px;
}
</style>

<div id="np_top" align="center">
	&nbsp;&nbsp;&nbsp;<font
		style="font-size: 23px; font-weight: bolder; font-family: monospace; color: #C92800">TravelPlan</font><br />
	&nbsp;&nbsp;<font
		style="font-size: 13px; font-weight: bold; color: #474747;">여행
		시작하기</font>
</div>

<form name="frmForm" id="_frmForm" action="tripupdateaf.do" method="post"
	enctype="multipart/form-data">

	<div id="np_main">

		<font style="font-size: 13px; font-weight: bold; color: #474747">여행
			이름</font><br /> <input type="text" name="tname" value="${trip.tname}"><br />
		<br /> <font
			style="font-size: 13px; font-weight: bold; color: #474747">시작
			날짜</font> <br /> <input type="text" name="sdate"  class="testDatepicker"
			placeholder="&nbsp;시작 날짜를 선택해주세요" readonly="readonly" value="${fn:substring(trip.sdate,0,10)}" ><br />
		<br /> <font
			style="font-size: 13px; font-weight: bold; color: #474747">마지막
			날짜</font> <br /> <input type="text" name="edate"  class="testDatepicker"
			placeholder="&nbsp;마지막 날짜를 선택해주세요" readonly="readonly" value="${fn:substring(trip.edate,0,10)}"><br />
		<br /> <font
			style="font-size: 13px; font-weight: bold; color: #474747">그룹
			이미지</font><br /> <input type="file"  name="fileload"><br />
		<br /> <input type="hidden" name='tseq' value="${trip.tseq}"/>
		<br /> <input type="hidden" name="id" value="${login.id}">

		<div align="center">
			<input id="_btnOk" type="submit" value="수정 완료">
		</div>
		
		

	</div>

</form>


<script type="text/javascript">
	$("#_btnOk").click(function() {
		$("#_frmForm").submit();
		
		setTimeout("ozit_timer_test()", 10);
	});

	function ozit_timer_test() {
		window.opener.location = "trip.do";
		alert('수정 완료');
		opener.location.reload(); // 부모창 새로 고침
		location.reload(); // 새로고침
		self.close();
	}

	$(function() {
		$(".testDatepicker").datepicker({
			changeMonth : true,
			changeYear : true,
			showButtonPanel : true,
			currentText : '오늘 날짜',
			closeText : '닫기',
			dateFormat : "yy-mm-dd"
		});
	});
</script>