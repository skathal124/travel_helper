<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="utf-8" />

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css" />
	
<style type="text/css"></style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<title>Basket Add</title>
<br/>
<div id="basket_top" align="center">
	&nbsp;&nbsp;&nbsp;<font
		style="font-size: 23px; font-weight: bolder; font-family: monospace; color: #C92800">Basket Add</font><br />
	&nbsp;&nbsp;&nbsp;<font style="font-size: 13px; font-weight: bold; color: #474747;">경로바구니 추가하기</font>
</div>

	<div id="city_add">
		<input type="hidden" id="tseq" value="${tseq}">
		<input type="hidden" id="tcseq" value="${tcseq}">
		<form name="frmForm" id="_frmForm" action="addplanbasketaf.do" method="post">
			<font style="font-size: 13px; font-weight: bold; color: #474747; ">날짜</font>&nbsp;
			<input type="text" value="${tempdate}" id="tempdate" name="tempdate" readonly="readonly"/><br/>
			<font style="font-size: 13px; font-weight: bold; color: #474747; ">경로 바구니 이름</font>&nbsp;
			<input type="text" value="${trip.tname} (${tripcity.cityname }, ${tempdate}일 일정)" style="width: 300px;" id="basketname" name="basketname"/>
		
		<input type="hidden" id="tempdate" value="${tempdate}">
		
		</form>
		<div align="right" style="margin-top: 11px">
			<span id='message'>
				<font style="font-size: 13px; font-weight: bold; color: #474747; ">'마이페이지 > 경로 바구니'에서 확인가능</font>
			</span>
			<input type="button" id="_btnOk" value="완료">
		</div>
		
	</div>



<script type="text/javascript">

	$("#_btnOk").click(function() {
		var tseq = $("#tseq").val();
		var tcseq = $("#tcseq").val();
		var tempdate = $("#tempdate").val();
		
		var basketname = $("#basketname").val();
		
		senddate(tseq, tcseq, tempdate, basketname);
	});
	
	function senddate(tseq, tcseq, tempdate, basketname){
		$.ajax({
	         type: "POST",
	         url: "./addplanbasketaf.do",
	         async: true,         
	         data: {"tseq":tseq,
	        	 "tcseq":tcseq,
	        	 "tempdate":tempdate,
	        	 "basketname":basketname,
	        	 },
	         success: function(msg){
					
	        	alert(msg);
	            if(msg == "OK"){
 	             	self.close();
	            }
	            else {
	            	alert('등록 실패');
	            }

	         }
	    }); 
		
	}
	
</script>