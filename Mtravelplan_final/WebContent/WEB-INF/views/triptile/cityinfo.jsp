<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.travel.plan.tripdaily.model.TripDaily"%>
<fmt:requestEncoding value="utf-8" />

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css" />
	
<style type="text/css"></style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">

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

#infoall {
	margin-left: 3%;
	margin-right: 3%;
}

.infotable {
	border-collapse: collapse;
	border-top: 1px solid black;
	border-left: 1px solid black;
}  
.infotable tr, .infotable td {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
}

.list_table td,.list_table th { text-align:center; border:0px solid #EFEFEF;  padding:0.3em; }
.list_table th { background-color:#FF5E00; color:#FFFFFF; line-height:1.2em; font-weight:bolder; font-size: 13px; }
.list_table tr td { padding-top:0.5em; padding-bottom:0.5em; border-bottom: solid 1px #BDBDBD; font-size: 12px;}	
.list_table td.title { padding-left:0.5em; text-align:left; }
.list_table td.title a:hover { text-decoration:underline; }
.list_table th, .list_table td { vertical-align:middle; }	

</style>

<title>City Info</title>
<br/>
<div id="infoall" >
<div id="city_top" align="center">
	<font style="font-size: 25px; font-weight: bolder; font-family: monospace; color: #C92800">City Info</font><br />
	<font style="font-size: 13px; font-weight: bold; color: #474747;">${tripcity.cityname} ${fn:substring(tripcity.citysdate,0,10)} ~ ${fn:substring(tripcity.cityedate,0,10)}</font>
</div>
<div align="right" ><font style="font-size: 15px; font-weight: bold; color: #474747;">총 비용 ${totalmoney}</font></div><br/>
	
<div id = "cityinfo"></div>
</div>
<input type="hidden" id="tcseq" value="${tripcity.tcseq }">

<script>
$(document).ready(function () {
	var tcseq = document.getElementById("tcseq").value;
	var cityArray = new Array();
	$.ajax({
		type : "POST",
		url : "getcityinfo.do",
		async : true,
		data: {
        	"tcseq":tcseq
       	},
		success : function(msg) {
			cityArray = msg;
			if (cityArray.length==0){
				drawnullpicture();			
			}
			else{
				drawpicture(cityArray);
			}
		}
	});
});

function drawnullpicture(){
	var html = "<br/><font style='font-size: 15px; font-weight: bold; color: #474747;'>일정이 없습니다.</font>";
	
	$("#cityinfo").html(html);
}

function drawpicture(cityArray) { // console.log(event.data); 에서 변수를 꺼내 쓰면 된다.hidden으로 tripcity
	var tempdate = cityArray[0].tddate;
	var daymoney = 0;
	
	var html = "<br/>" + "<font style='font-size: 13px; font-weight: bold; color: #474747;'>" + tempdate + " 일정 &nbsp;/&nbsp; 비용 ";
	
	for (var i = 0; i < cityArray.length; i++) {
		if(tempdate != cityArray[i].tddate){
			html += daymoney + "</font><br/>";
			html += drawtable(cityArray, tempdate);
			
			tempdate = cityArray[i].tddate;

			
			daymoney = 0;
	   		html += "<font style='font-size: 13px; font-weight: bold; color: #474747;'>"+ cityArray[i].tddate +" 일정 &nbsp;/&nbsp; 비용 ";
	   		
		}
		
		daymoney += cityArray[i].tdmoney;
	}
	
	html += daymoney + "</font><br/>";
	html += drawtable(cityArray ,tempdate);
	
    $("#cityinfo").html(html);
}

function drawtable(cityArray, tempdate){ 
	var html = "<table class='list_table'>";
		html += "<tr><th width='55px'></th><th width='160px'>시간</th><th width='205px'>장소</th><th width='205px'>할일</th><th width='120px'>비용</th></tr>";
	var tempnum = 1;
	for (var i = 0; i < cityArray.length; i++) {
		if(cityArray[i].tddate == tempdate){
			if(cityArray[i].tdplace==null){
				cityArray[i].tdplace="-";
			}
			if(cityArray[i].tdwork==null){
				cityArray[i].tdwork="-";
			}
			html += "<tr><td>"+ tempnum +"</td>";
			html += "<td>" + cityArray[i].tdstime +"시 ~ "+ cityArray[i].tdetime + "시</td>";
			html += "<td>" + cityArray[i].tdplace + "</td>";
			html += "<td>" + cityArray[i].tdwork + "</td>";
			html += "<td>" + cityArray[i].tdmoney + "</td></tr>";
			tempnum++;
		}
	}
		html += "</table><br/>";
	
	return html;
}


</script>