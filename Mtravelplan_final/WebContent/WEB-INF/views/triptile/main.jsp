<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="UTF-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<style>
.maindiv {
	width: 100%;
	height: 100%;
	line-height: 25px;
}

.middiv {
	display: inline-block;
	width: 21%;
	margin-left: 3%;
/* 	border-top: solid 2px #BDBDBD; */
	border-bottom: solid 2px #BDBDBD;
	
	margin-bottom: 5%;
}

.title {
	width: 100%;
	height: 15%;
	font-size: 12px;
	font-weight: bold;

}

.img {
	width: 100%;
	height: 100%;
	vertical-align: middle;
	display: block;
}

.ddd {
	width: 90%;
	
	font-size: 16px;
	font-weight: bolder;

}


.container {
  position: relative;
}
.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: #FF8224;
}
.container:hover .overlay {
  opacity: 1;
}
.text {
  color: white;
  font-size: 14px;
  font-weight : bold;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
}

</style>
<div class="box_border" style="margin-top:5px; margin-bottom: 10px;">
<form name="frmForm1" id="_frmFormSearch" method="post" action="">
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						
	</form>
</div>
<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/화살표.png" style="width: 15px; height: 15px; vertical-align: top;">&nbsp;<font style="font-size: 14px; font-weight: bold;">여행 관리</font></a>
<div class="maindiv" align="left" id="maindiv">


	<c:if test="${empty trip}">
		<div align="center" style="vertical-align: middle;">
		
		<br /><br />
			<a style="font-size: 14px; font-weight: bolder;">등록된 일정이 없습니다</a> <br />
			<br />

		</div>

		<!-- 		window.resizeTo(1280,800); -->
	</c:if>

	<c:forEach var="trip" items="${trip}">

	<c:if test="${trip.id eq login.id}">

		<div class="middiv" align="left">
			<div align="center" style="height: 150px; margin-top: 10%;" class="container">
				<c:choose>
					<c:when test="${fn:contains(trip.filename, '.back')}" >
						<img class="img" src="./webimage/noimage.png" alt="Avatar" />
					</c:when>
					<c:otherwise>
						<img class="img" src="./webimage/${trip.filename}" alt="Wait" />
					</c:otherwise>
				</c:choose>
				<div class="overlay" onclick='javascript:dailydetail(${trip.tseq});'>
    			<div class="text" >일정 한눈에보기</div>
  				</div>
			</div>

			<div class="title" align="left">${fn:substring(trip.sdate,0,10)}&nbsp;~&nbsp;${fn:substring(trip.edate,0,10)}</div>
			
			<div class="ddd" align="left">
				<font color="#DB3A00">${trip.tname}</font>
			</div>
			
			
			
		<div align="center" style="color: #474747;  font-weight: bold; border-top: dotted 1px #BDBDBD;  margin-top: 0;">
<!-- 			border-top: solid 2px #BDBDBD; border-right: solid 2px #BDBDBD;border-left: solid 2px #BDBDBD; -->

			<div style="width: 49%; display:inline-block;" align="left">
			<input type="button" value="그룹원 +" onclick='javascript:group(${trip.tseq});'
			style="border-radius: 3px;  background-color: #FF8224; color: white; font-weight: bolder; font-size: 11px;">
			
			
			</div>
			
			<div style="width: 49%; display:inline-block;" align="right">
			<input type="button" value="수정"  onclick='javascript:edit(${trip.tseq});'
			style="border-radius: 3px;  background-color: #FF8224; color: white; font-weight: bolder; font-size: 11px;">
			<input type="button" value="삭제" data-attache_file_name="${trip.tseq}" class="btn_fileDelete"
			style="border-radius: 3px;  background-color: #FF8224; color: white; font-weight: bolder; font-size: 11px;">
			
			<input type="button" value="공유"  onclick='javascript:share(${trip.tseq});'
			style="border-radius: 3px;  background-color: #FF8224; color: white; font-weight: bolder; font-size: 11px;">
			
			</div>
			
		</div>
			
			<form name="frmForm2" id="_frmForm2" action="deltrip.do" method="post">
			<input type="hidden" id="_tseq" name='tseq' />
			</form>

		</div>
		</c:if>
		
		
		<c:if test="${trip.id ne login.id}">
		
		<div class="middiv" align="left">

			<div align="center" style="height: 150px; margin-top: 10%;" class="container">
				<c:choose>
					<c:when test="${fn:contains(trip.filename, '.back')}" >
						<img class="img" src="./webimage/noimage.png" alt="Avatar" />
					</c:when>
					<c:otherwise>
						<img class="img" src="./webimage/${trip.filename}" alt="Wait" />
					</c:otherwise>
				</c:choose>
				<div class="overlay" onclick='javascript:dailydetail(${trip.tseq});'>
    			<div class="text" >일정 한눈에보기</div>
  				</div>
			</div>

			<div class="title" align="left">${fn:substring(trip.sdate,0,10)}&nbsp;~&nbsp;${fn:substring(trip.edate,0,10)}</div>
			
			<div class="ddd" align="left">
				<font color="#DB3A00">${trip.tname}</font>
			</div>
			
			<div align="center" style="color: #474747;  font-weight: bold; border-top: dotted 1px #BDBDBD;  margin-top: 0;">
				<font style="font-weight: bold; ">수정 권한이 없습니다</font>
			</div>

		</div>

		</c:if>
		
	</c:forEach>
	
	<div id="paging_wrap">
	<jsp:include page="/WEB-INF/views/boardtile/paging.jsp" flush="false">
	<jsp:param value="${pageNumber}" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage}" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount}" name="totalRecordCount"/>							
	</jsp:include>				
	</div>
	<br><br>
	<div align="center" style="margin-bottom: 3%;">
		<input type="button" value="여행 추가"
			style="border-radius: 3px; width: 85px; height: 30px; background-color: #FF7012; color: white; font-weight: bolder; font-size: 14px;"
			onclick="window.open('newpage.do', '_blank', 'width=445 height=440')">
		<!-- <a href="#"  onclick="window.open('newpage.do', '_blank', 'width=445 height=440')" style="color: red; font-weight: bold; text-decoration: underline; display: block; font-size: 12px; width: 100%;">여행 추가</a> -->
	</div>
	
	

</div>



<script type="text/javascript">

	
	
	$(".btn_fileDelete").click(function() { // 버튼마다 클래스 부여해서 해당하는 곳 this로 부름
		if (window.confirm("파일을 삭제 하시겠습니까?"))
		{			
			$("#_tseq").val($(this).attr("data-attache_file_name"));
			$("#_frmForm2").attr( {"action":"deltrip.do"} ).submit(); 
		}
	});
	
	function share(tseq){
		$.ajax({
	         type : "POST",
	         url : "insertshare.do",
	         async : true,
	         data: {
	              "tseq":tseq
	             },
	         success : function(msg) {
	            if(msg == 1){
	               alert("공유 성공!");
	            }
	            else{
	               alert("이미 공유한 글입니다");
	            }
	         }
	      });
	}
	
	function dailydetail(tseq){
		var url = "tripdetail.do?tseq="+tseq+"";
		location.href=url;
	}
	function edit(tseq) {
		var url = "updatepage.do?tseq="+tseq+"";
		window.open(url, '_blank', 'width=445 height=440');
	}
	
	function group(tseq) {
		var url = "grouppage.do?tseq="+tseq+"";
		window.open(url, '_blank', 'width=445 height=525');
	}
	function goPage(pageNumber) {	
		$("#_pageNumber").val(pageNumber) ;
		$("#_frmFormSearch").attr("target","_self").attr("action","trip.do").submit();
	}
</script>