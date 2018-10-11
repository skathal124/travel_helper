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
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcVuueCutKFm21AQa0vbRr7H1uTQT2Z_4&libraries=places">
</script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
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

 #map {
        height: 60%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      .controls:focus {
        border-color: #4d90fe;
      }
      .title {
        font-weight: bold;
      }
      #infowindow-content {
        display: none;
      }
      #map #infowindow-content {
        display: inline;
      }

</style>


<script>
	var globalMap;
	var globalMarker;
	var globalGeocoder;

	var beforelat = ${tripcity.citylat};
	var beforelng = ${tripcity.citylng};
	
	var marklist = new Array();
	var labelIndex = 0;
	
	
	$(window).load(function(){
		initialize(beforelat, beforelng, 7);
		setMark();
		getSelectMarkPos(labelIndex);
	});
	

	function initialize(x, y, zoom) {
		globalGeocoder = new google.maps.Geocoder();

		var latlng = new google.maps.LatLng(x, y);

		var myOptions = {
			zoom : zoom,
			center : latlng,
			navigationControl : false, // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
			navigationControlOptions : {
				position : google.maps.ControlPosition.TOP_RIGHT,
				style : google.maps.NavigationControlStyle.DEFAULT
			},
			streetViewControl : false,
			scaleControl : false, // 지도 축적 보여줄 것인지.
			mapTypeControl : false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
			mapTypeId : google.maps.MapTypeId.ROADMAP
		};

		globalMap = new google.maps.Map(document.getElementById("map"),
				myOptions);
	}
	
	function codeAddress() {
		var address = document.getElementById("cityname").value;
		if (address == '검색할 주소를 입력하십시오.' || address == '') {
			alert('검색할 주소를 입력하십시오.');
			document.getElementById("cityname").value = '';
			document.getElementById("cityname").focus();
			return;
		}
		globalGeocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				globalMap.setCenter(results[0].geometry.location);

				setMark();
				getSelectMarkPos(labelIndex);
			} else {
				alert("올바르지 않은 도시입니다 : " + status);
			}
		});
	}
	function setMark() {
		labelIndex = marklist.length;
		var myOptions = {
			position : globalMap.getCenter(),
			map : globalMap,
			id : labelIndex,
			visible : true
		};
		marklist[labelIndex] = new google.maps.Marker(myOptions);
		
		getSelectMarkPos(labelIndex);
		
		if(labelIndex > 0){
			marklist[labelIndex-1].setMap(null);
		}
		
	}
	function getSelectMarkPos(Index) {
		var pos = marklist[Index].getPosition();

		document.getElementById("citylat").value = pos.lat();
		document.getElementById("citylng").value = pos.lng();
		
	}
	
</script>


<title>City Edit</title>
<br/>
<div id="city_top" align="center">
	&nbsp;&nbsp;&nbsp;<font
		style="font-size: 23px; font-weight: bolder; font-family: monospace; color: #C92800">City Edit</font><br />
	&nbsp;&nbsp;&nbsp;<font style="font-size: 13px; font-weight: bold; color: #474747;">일별 도시 수정하기</font>
</div>

<form name="frmForm" id="_frmForm" action="cityeditaf.do" method="post">
	
	<div id="city_add">
		<input type="hidden" id="tseq" value="${tripcity.tseq}">
		<input type="hidden" id="tcseq" value="${tripcity.tcseq}">
		<div align="right"><font style="font-size: 13px; font-weight: bold; color: gray; ">
			변경 전 날짜 ${fn:substring(tripcity.citysdate,0,10)}&nbsp;~&nbsp;${fn:substring(tripcity.cityedate,0,10)}</font></div>
		<br/>
		<input type="hidden" id="pickersdate" value="${fn:substring(trip.sdate,0,10)}">
		<font style="font-size: 13px; font-weight: bold; color: #474747; ">날짜</font><br/>
		<input type="text" value="${fn:substring(tripcity.citysdate,0,10)}" id="citysdate" name="citysdate" class="cityDatepicker" placeholder="&nbsp;시작 날짜" readonly="readonly"/>
		&nbsp;―&nbsp;
		<input type="text" value="${fn:substring(tripcity.cityedate,0,10)}" id="cityedate" name="cityedate" class="cityDatepicker" placeholder="&nbsp;마지막 날짜" readonly="readonly"/>
		
		<br/>
  		    <input type="text" value="${tripcity.cityname}" id="cityname" placeholder="가고자 하는 도시를 검색하세요" style="width: 350px; margin-top: 8px " onClick="this.value='';"> 
			<input type="button" value="도시 지정" onClick="codeAddress()"><br/>
		    <div id="map"></div>

	   		<input type="hidden" id="citylat">
			<input type="hidden" id="citylng">
			
			<div align="right" style="margin-top: 11px">
				<span id='message'></span>
				<input type="button" id="_btnOk" value="수정완료">
			</div>
	</div>
	
</form>


<script type="text/javascript">

	$("#_btnOk").click(function() {
		
		var tseq = $("#tseq").val();
		var tcseq = $("#tcseq").val();
		
		var citysdate = $("#citysdate").val();
		var cityedate = $("#cityedate").val();

		var cityname = $("#cityname").val();
		
		var citylat = $("#citylat").val();
		var citylng = $("#citylng").val();
			
		editCity(tseq, tcseq, cityname, citysdate, cityedate, citylat, citylng);

	});
	
	function editCity(tseq, tcseq, cityname, citysdate, cityedate, citylat, citylng){
		$.ajax({
	         type: "POST",
	         url: "./cityeditaf.do",
	         async: true,         
	         data: {"tseq":tseq,
	        	 "tcseq":tcseq,
	        	 "cityname":cityname,
	        	 "citysdate":citysdate,
	        	 "cityedate":cityedate,
	        	 "citylat":citylat,
	        	 "citylng":citylng
	        	 },
	         success: function(msg){
	            //alert(msg);
	            if(msg == "OK"){
	             	url="tripdetail.do?tseq=" + ${tseq}
	             	window.opener.location = url;
	             	alert('수정 완료');
	             	opener.location.reload(); // 부모창 새로 고침
	             	location.reload(); // 새로고침
	             	self.close();
	            }
	            else {
	            	alert('수정 실패');
	            }
	         }
	    }); 
	}


$(function() {
	$(".cityDatepicker").datepicker({
		changeMonth : true,
		changeYear : true,
		showButtonPanel : true,
		currentText : '오늘 날짜',
		defaultDate : pickersdate,
		closeText : '닫기',
		dateFormat : "yy-mm-dd"
	});
});
</script>

