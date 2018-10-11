<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<div id="citysdate"  val='${tripcity.citysdate}'></div>
<div id="cityedate"  val='${tripcity.cityedate}'></div>
<div id="tempdate"  val=''></div>
<style type="text/css">
	#map_canvas {
		width: 600px;
		height: 400px
	}
	#hrcontrol{
		width: 600px;
		height: auto
	}
	#control {
		width: 650px;
		height: auto
	}
	.daily_add input[type="text"] { border: solid 2px #DB3A00; border-radius: 4px; width: 25%; height: 22px;}
	.daily_add input[type="button"] { border-radius: 3px; height:26px; 
	background-color: #FF7012; color: white; font-weight: bolder;}
	.daily_add input[type="submit"] { border-radius: 3px; width: 72px; height:26px; 
	background-color: #FF7012; color: white; font-weight: bolder;}
</style>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDRGWxNf_xpelvyX6KKXfrzb1PI_Deq8T4">
</script>
<script type="text/javascript">
	
	var globalMap;
	var globalMarker;
	var globalGeocoder;
	
	
	// 마커 저장용
	var marklist = new Array();

	// 선 저장용
	var linelist = new Array(); // 선 리스트 저장
	var lineIndex = 0; // 몇번째 선인지.
	
	var tripArray = new Array();
	var labelIndex = tripArray.length;
	
	var zoom = 0;
	
	
	/////////////////////////
	var citysdate = $('#citysdate').attr("val");
	var cityedate = $('#cityedate').attr("val");
	
	var citylat = ${tripcity.citylat};
	var citylng = ${tripcity.citylng};
	
	var datehtml = "";
	
	function selectdayoption(){
		datehtml += "<div id='hrcontrol' align='left'><select id='tddate' name='tddate' onchange='javascript:gettripdaily()'>";
		var diffday = difftwoday(citysdate, cityedate);
		var tempdate = new Date(citysdate);
		datehtml += "<option>날짜 선택</option>";
		for (var i = 1; i <= diffday; i++) {
			datehtml += "<option  value=" + tempdate.toISOString().substring(0, 10) + "> " 
			+ tempdate.toISOString().substring(0, 10) + "</option>";
			tempdate.setDate(tempdate.getDate()+1);
		}
		datehtml += "</select> ";
		datehtml += "<input style='border-radius: 3px; height:26px; background-color: #FF7012; color: white; font-weight: bolder;'type='button' onclick='javascript:pass();'  value=' 하루 일정 담기 '>";
		datehtml += "<input style='border-radius: 3px; height:26px; background-color: #FF7012; color: white; font-weight: bolder;'type='button' onclick='javascript:getplan();'  value=' 일정 바구니 '></div>";
		
		$("#datedetail").html(datehtml);
	}
	
	function getplan(){
		$('#tempdate').attr('val', document.getElementById('tddate').value); 
		var tempdatee = $('#tempdate').attr("val");
		var tseq = document.getElementById("tseq").value;
		var tcseq = document.getElementById("tcseq").value;
		
		if(tempdatee == "날짜 선택"){
			alert("날짜를 선택해주세요");
		}
		else{
	    	var url = "mybasketlist.do?tempdate="+tempdatee+"&tseq="+tseq+"&tcseq="+tcseq;
	        window.open(url, '_blank', 'width=485 height=550');
		}
	}

	function difftwoday(oneDate, twoDate){
	    var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
		var firstDate = new Date(oneDate);
		var secondDate = new Date(twoDate);
		var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime())/(oneDay)))+1;
		return diffDays;
	}
	//////////////////////////
	
	function gettripdaily(){
		
		$('#tempdate').attr('val', document.getElementById('tddate').value); 
		var tempdatee = $('#tempdate').attr("val");
		var tseq = document.getElementById("tseq").value;
		var tcseq = document.getElementById("tcseq").value;
		
		
		// 날짜, tseq, tcseq
		$.ajax({
			type : "POST",
			url : "gettripdailylist.do",
			async : true,
			data: {
				"tddate":tempdatee,
	        	"tseq":tseq,
	        	"tcseq":tcseq
	       	},
			success : function(msg) {
				tripArray = msg;
				
				removeMark(tripArray.length);
				markLine();
			}
		});
	}
	
	$(document).ready(function () {
		$('#address').keypress(function(e){
		      if(e.keyCode==13)
		      $('#search').click();
	    });
		selectdayoption();
		initialize(citylat, citylng, 13);
	});
	
	function initialize(x, y, zoom) {
		// 좌표 받아서 넣어줘야할듯. (지금은 역삼역)
		if (x == 0) {
			x = 37.50075507977441;
		}
		if (y == 0) {
			y = 127.03690767288208;
		}

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

		globalMap = new google.maps.Map(document.getElementById("map_canvas"),
				myOptions);

		google.maps.event.addListener(globalMap, 'click', function(event) { // 지도클릭시 마커이동
			moveMarker(event.latLng);
			markLine();
		});
	}
	
	// 맵 중앙에 마크찍기
	function setMark() {
		$('#tempdate').attr('val', document.getElementById('tddate').value); 
		var tempdatee = $('#tempdate').attr("val");
		if(tempdatee == "날짜 선택"){
			alert("날짜를 선택해주세요!");
			
		}
		else{
			labelIndex = tripArray.length;
			// console.log(tripArray.length);
			var myOptions = {
				position : globalMap.getCenter(),
				draggable : true,
				map : globalMap,
				id : labelIndex,
				visible : true
			};
			marklist[labelIndex] = new google.maps.Marker(myOptions);
			// alert(labelIndex);

			document.getElementById("tdnum").value = labelIndex;
			
			// 마크마다 드래그 리스너를 달아주고, 선을 모두 지웠다가 다시 그려준다.
			getSelectMarkPos(labelIndex);
			saveMarker();
			
			markEvent(labelIndex);
			// 선긋기
			if (labelIndex > 0) {
				markLine();
			}
		}
	}

	// 찍힌 마크에 이벤트 달기 함수
	function markEvent(index) {
		
		var html = "";

		// 여기서 div 내용을 추가해 
		html += "<div align='left'>";
		// 새 펑션.. 라벨 인덱스 주면 될듯..?
		html += index+1 + " 번째 일정<br/><br/>";
		
		html += "장소 ";
		html += "<input type='text' id='tdplace" + index  + "' placeholder='&nbsp;장소 입력' value='" + tripArray[index].tdplace + "'><br/>";
		html += "할일 ";
		html += "<input type='text' id='tdwork" + index  + "' placeholder='&nbsp;해야할 일 입력' value='" + tripArray[index].tdwork + "'><br/>";
		html += "비용 ";
		html += "<input type='number' step='1000'  id='tdmoney" + index  + "' value='" + tripArray[index].tdmoney + "'><br/>";
		
		html += "시간 "; 
		
		html += "<select id='tdstime"+ index +"' name='tdstime"+ index +"'>";
		for (var i = 0; i < 24; i++) {
			html += "<option  value=" + i + " ";
			if(tripArray[index].tdstime == i+"" ){
				html += "selected='selected'";
			}
			html += "> " + i + "</option>";
		}
		html += "</select>시 &nbsp;~&nbsp; ";
		
		html += "<select id='tdetime"+ index +"' name='tdetime"+ index +"'>";
		for (var i = 0; i < 24; i++) {
			html += "<option  value=" + i + " ";
			if(tripArray[index].tdetime == i+"" ){
				html += "selected='selected'";
			}
			html += "> " + i + "</option>";
		}
		html += "</select>시<br/><br/>";
		
		html += "<input type='button' value='일정 저장' onClick='javascript:detailsave(" + index + ");'>&nbsp;&nbsp;";
		html += "<input type='button' value='삭제' onClick='javascript:removeMark(" + index + ");'>";
		html += "</div>";
		
		
		
		
		// 마커 클릭 버튼
		var markerInfo = new google.maps.InfoWindow({
			content : html,
			maxWidth : 1000
		});
		
		google.maps.event.addListener(marklist[index], 'dragend', function(event) {
				getSelectMarkPos(index);
				// 여기서 JSON의 Object에 접근해 위도 경도를 바꿔줘야한다.
				tripArray[index].tdlat = document.getElementById("tdlat").value;
				tripArray[index].tdlng = document.getElementById("tdlng").value;
				
				markLine();
		});
		
		google.maps.event.addListener(marklist[index], 'click',
				function() {
					markerInfo.open(globalMap, this);
				});
		
	}
	
	// 디테일 일정 저장을 위한 함수 
	function detailsave(index){
		tripArray[index].tdplace = document.getElementById("tdplace"+ index).value;
		tripArray[index].tdwork = document.getElementById("tdwork"+ index).value;
		tripArray[index].tdmoney = document.getElementById("tdmoney"+ index).value;

		tripArray[index].tdstime = document.getElementById("tdstime"+ index).value;
		tripArray[index].tdetime = document.getElementById("tdetime"+ index).value;
		
		alert(index+1 + "번 일정 저장!");
	}

	//---------------------------------------------------------------------- 마크 삭제
	function removeMark(index) {
// 		alert(index + 1 + "일정 삭제");

		// push로 넣는다.
		var tmp = new Array();
		for(i=0; i<tripArray.length; i++)
		{
			if(i != index)
			{
				if(tripArray[i].tdnum > index){
					tripArray[i].tdnum = tripArray[i].tdnum - 1;
				}
				tmp.push(tripArray[i]); 
			}
		}
		tripArray = new Array();
		for(i=0; i<tmp.length; i++){
			tripArray.push(tmp[i]);
		}

		var loc = globalMap.getCenter(); // 현재의 지도의 위치를 가져온다.
		zoom = globalMap.getZoom();

		globalMap = null;
		globalMarker = null;
		globalGeocoder = null;

		labelIndex = 0;
		markid = 0;
		linelist = new Array();
		lineIndex = 0; // 몇번째 선인지.

		initialize(loc.lat(), loc.lng(), zoom);
		
		// 선 정보 초기화
		for (j = 0; j < linelist.length; j++) {
			linelist[j].setVisible(false);
		}
		// 배열 초기화
		var marklist = new Array();

		// 선 저장용
		linelist = new Array();
		
		// 이제 JSON들로 마크 찍는거 필요!
		labelIndex = tripArray.length;
		
		renew(labelIndex);
		
	}

	
	function renew(index){
		// JSON 위도 경도에 따라 마크 찍는거 해야된다!
		for(i=0; i<index; i++){
			var latlng = new google.maps.LatLng(tripArray[i].tdlat, tripArray[i].tdlng);
			var myOptions = {
					position : latlng,
					draggable : true,
					map : globalMap,
					id : i,
					visible : true
				};
			marklist[i] = new google.maps.Marker(myOptions);
			document.getElementById("tdnum").value = i;
			
			getSelectMarkPos(i);
			markEvent(i);
		}
		
		
		// 마크 배열들을 다시 재조정한 뒤 선을 찍어야한다.
		markLine();
		
	}
	
	// 마크좌표 가져오기 
	function getSelectMarkPos(Index) {
		var pos = marklist[Index].getPosition();

		document.getElementById("tdlat").value = pos.lat();
		document.getElementById("tdlng").value = pos.lng();

	}

	// 주소값으로 찾기
	function codeAddress() {
		var address = document.getElementById("address").value;
		if (address == '검색할 주소를 입력하십시오.' || address == '') {
			alert('검색할 주소를 입력하십시오.');
			document.getElementById("address").value = '';
			document.getElementById("address").focus();
			return;
		}
		globalGeocoder.geocode({
			'address' : address
		}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				globalMap.setCenter(results[0].geometry.location);

				document.getElementById("tdnum").innerHTML = labelIndex;
				setMark();
				getSelectMarkPos(labelIndex);
				markLine();
			} else {
				alert("Geocode was not successful for the following reason: "
						+ status);
			}
		});
	}
	
	// 선 초기화 & 초기화 후 긋기
	function markLine() {
		
		for (j = 0; j < linelist.length; j++) {
			linelist[j].setVisible(false);
		}

		// JSON의 길이만큼 함수가 돈다
		for (i = 1; i <= tripArray.length-1; i++) {
			// 이제 JSON 객체에서 가져 올 것이니 나중에 이 변수들 다 삭제 (완료?)
			var line = new google.maps.Polyline({
				path : [ new google.maps.LatLng(tripArray[i-1].tdlat, tripArray[i-1].tdlng), /* 시작점 */
						new google.maps.LatLng(tripArray[i].tdlat, tripArray[i].tdlng) ], /* 끝점 */
				strokeColor : "#FF0000",
				strokeOpacity : 0.7, // 진하기
				strokeWeight : 2.5, // 굵기
				geodesic : true,
				icons : [ {
					icon : {
						path : google.maps.SymbolPath.FORWARD_OPEN_ARROW
					},
					offset : '50%'
				} ],
				map : globalMap
			});

			linelist.push(line);
		}

		lineIndex++;
	}

	// 지도 클릭시 마커 이동
	function moveMarker(loc) {
		//alert(loc);
		marklist[labelIndex].setPosition(loc);
		getSelectMarkPos(labelIndex);
		if (labelIndex > 1) {
			markLine();
		}
		
		tripArray[labelIndex].tdlat = document.getElementById("tdlat").value;
		tripArray[labelIndex].tdlng = document.getElementById("tdlng").value;
	}

	//----------------------------------------------------------------------delete 단
	// 지도 위의 마크 모두 삭제 - 모든 JSON, 배열 초기화
	function clearMark() {
		var loc = globalMap.getCenter(); // 현재의 지도의 위치를 가져온다.
		zoom = globalMap.getZoom();
		
		globalMap = null;
		globalMarker = null;
		globalGeocoder = null;

		labelIndex = 0;
		markid = 0;
		linelist = new Array();
		lineIndex = 0; // 몇번째 선인지.

		initialize(loc.lat(), loc.lng(), zoom);
		
		// 추가
		// 선 정보 초기화
		for (j = 0; j < linelist.length; j++) {
			linelist[j].setVisible(false);
		}
		// 배열 초기화
		var marklist = new Array();

		// 선 저장용
		linelist = new Array();
	
		// DB 배열 초기화
		tripArray = new Array();
	
		// 진짜 DB 초기화
		$('#tempdate').attr('val', document.getElementById('tddate').value); 
		var tempdatee = $('#tempdate').attr("val");
		var tseq = document.getElementById("tseq").value;
		var tcseq = document.getElementById("tcseq").value;
		$.ajax({
			type : "POST",
			url : "deletedaily.do",
			async : true,
			data: {
				"tddate":tempdatee,
	        	"tseq":tseq,
	        	"tcseq":tcseq
	       	},
			success : function(msg) {
				if(msg == "OK"){
					alert("삭제 완료");
				}
				else{
					alert("실패");
				}
			}
		});
	}
	
	
	//----------------------------------------------------------------------Controller로 이동위한 부분
	// 배열에 저장
	function saveMarker() {

		var tripInfo = new Object();
		
		tripInfo.tdnum = document.getElementById("tdnum").value;

		tripInfo.tdlat = document.getElementById("tdlat").value;
		tripInfo.tdlng = document.getElementById("tdlng").value;
		
		tripInfo.tdplace = "";
		tripInfo.tdwork = "";
		
		tripInfo.tddate = document.getElementById("tddate").value; 
		
		tripInfo.tdmoney = document.getElementById("tdmoney").value;
		tripInfo.tdseq = document.getElementById("tdseq").value;
		tripInfo.tseq = document.getElementById("tseq").value;
		tripInfo.tcseq = document.getElementById("tcseq").value;
		tripInfo.tdstime = document.getElementById("tdstime").value;
		tripInfo.tdetime = document.getElementById("tdetime").value;
		
		tripInfo.tddate = document.getElementById("tddate").value;
		
		tripArray.push(tripInfo);
	}

	function pass() {
		$('#tempdate').attr('val', document.getElementById('tddate').value); 
		var tempdatee = $('#tempdate').attr("val");
		if(tempdatee == "날짜 선택"){
			alert("날짜를 선택해주세요!");
		}
		else{
			$.ajax({
				type : "POST",
				url : "tripdata.do",
				async : true,
				contentType : "application/json; charset=utf-8",
				data : JSON.stringify(tripArray),
				dataType : 'json',
				success : function(msg) {
					alert("저장 완료!");
				}
			});
		}
	}
</script>


<div id="datedetail" style="margin-left: 10%; margin-top: 5%"></div>
<div id="map_canvas" style="margin-left: 10%;"></div>
	<div id="control" style="margin-left: 4%;" class="daily_add" align="left">
		<dl>
			
			<dd>
				<hr />
			</dd>
			
			<dd>
				&nbsp;<input type="text" id="address" value="주소 입력" style="width: 300px;" onClick="this.value='';"> 
				<input type="button" id="search" value=" 장소 검색 " onClick="codeAddress()">
			</dd>

			<dd>
				<hr />
			</dd>

			<dd>
				<input type="button" value=" 마크 생성 " onClick="setMark();">
				
				<input type="hidden" id="tdlat">
				<input type="hidden" id="tdlng">
				
				<input type="hidden" id="tdnum" value="0"> 
				<input type="hidden" id="tdplace" value="">
				<input type="hidden" id="tdwork" value="">
				<input type="hidden" id="tdmoney" value="">
				<input type="hidden" id="tdstime" value="0">
				<input type="hidden" id="tdetime" value="0">

				<input type="hidden" id="tdseq" value="0">
				<input type="hidden" id="tseq" value="${tripcity.tseq }">
				<input type="hidden" id="tcseq" value="${tripcity.tcseq }">
				
				<input type="button" value=" 계획 초기화 " onClick="clearMark();">&nbsp;&nbsp;
<!-- 				<div align="right"> -->
<!-- 					<input type="button" onclick='javascript:pass();'  value=" 일정 저장 "> -->
<!-- 				</div> -->
			</dd>
		</dl>
	</div>
