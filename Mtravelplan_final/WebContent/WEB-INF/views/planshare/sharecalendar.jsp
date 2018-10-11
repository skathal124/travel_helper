<%@page import="com.travel.plan.carlendar.help.CalendarUtil"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.travel.plan.tripcity.model.TripCity"%>
<%@page import="com.travel.plan.trip.model.Trip"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<link rel='stylesheet' href='fullcalendar/fullcalendar.css' />
<script src='jquery/jquery.min.js'></script>
<script src='jquery/moment.min.js'></script>
<script src='<%=request.getContextPath()%>/fullcalendar/fullcalendar.js'></script>
<link href="<%=request.getContextPath()%>/fullcalendar/fullcalendar.print.css" rel="stylesheet" media="print"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/fullcalendar/ko.js"></script>
<%
	request.setCharacterEncoding("utf-8");
%>
<style type="text/css">

    /* 토요일 */
    .fc-day-top.fc-sat {
        color: #0000FF;
    }

    /* 일요일 */
    .fc-day-top.fc-sun {
        color: #FF0000;
    }

    .nube {
        color: #1d1d1d;
        background-color: lavenderblush;
        left: 0;
        top: 0;
    }

    .fc-view-container *, .fc-view-container *:before, .fc-view-container *:after {
        z-index: 10;
    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
    	var year = ${year};
		var month = ${month}; 
		var tseq = ${tseq};
		var day = 1;
		var today = year+"-"+month+"-"+day;
		
    	var calendar = $("#calendar").fullCalendar({
            defaultDate: today
            , header: {
                left: '',
                center: 'title',
                right: 'prev,next'
            }
	    	, displayEventTime : false
            , editable: false
            , lang: "ko"
            , eventLimit: true
            , show: function(event, ui) {
                $('#calendar').fullCalendar('render');
            }
            , events: function(start, end, timezone, callback) {
  		      
            	$.ajax({
		            url: "pushcitycal.do",
		            type: "POST",
		            dataType: "json",
		            async: true,
		            data: {
		            	"tseq" : tseq
		            },
		            success: function(doc) {
		            	detail=doc.citylist;
		                var events = [];
						$.each(doc.citylist, function(i,item){
		                    events.push({
		                        title: item.cityname,
		                        start: item.citysdate, // will be parsed
		                        end: item.cityedate,
		                        color : "#FF8224",
		                        data : item
		                        
		                    });
		                });
		                callback(events);
		            }
		        });
		    }
            , eventClick: function(event) { // console.log(event.data); 에서 변수를 꺼내 쓰면 된다.hidden으로 tripcity
            	 var html = "<br/>";
                 html += "<input type='hidden' id='tseq' value='"+ event.data.tseq +"'>";
                 html += "<input type='hidden' id='tcseq' value='"+ event.data.tcseq +"'>";
                 html += "<input type='hidden' id='citysdate' value='"+ event.data.citysdate +"'>";
                 html += "<input type='hidden' id='cityname' value='"+ event.data.cityname +"'>";
                 html += "<input type='hidden' id='citylat' value='"+ event.data.citylat +"'>";
                 html += "<input type='hidden' id='citylng' value='"+ event.data.citylng +"'>";
                 
                 
                 html += "<input type='text' align='center' value='" +
                 event.data.cityname +"'readonly='readonly' style='margin-top: 3px; font-size: 12px; border: solid 2px #DB3A00; border-radius: 4px; width: 50%; height: 19px;' >&nbsp;";
                 
 		 		 html += "<input type='submit' value='일정 보기' onclick='javascript:shareplan()' "+
 				" style='border-radius: 3px;  background-color: #FF8224; color: white; font-weight: bolder; font-size: 11px;'>&nbsp;";
                 html += "<img onclick='javascript:printallday()' src='<%=request.getContextPath()%>/image/bogi.png' style='vertical-align: middle;' width='15px' height='15px'></img>&nbsp;</div>";
 				
                 $("#citydetail").html(html);
            }
        });
    	
    	islikecheck(tseq);
    	
    });
    
    
    function islikecheck(tseq){
    	$.ajax({
            url: "checklike.do",
            type: "POST",
            dataType: "json",
            async: true,
            data: {
            	"tseq" : tseq
            },
            success: function(doc) {
            	var html = "";
            	if(doc == 1){
            		// 하트를 이미 찍은 사용자
            		// onclick이벤트 -> 좋아요 delete
            		html = "<img src='webimage/fullheart.png' onclick='javascript:deletelike(" + tseq + ")' style=' width:30px; vertical-align: middle;'></img>";
            		$("#heart").html(html);		
            	}else {
            		// 하트를 찍지 않은 사용자
            		// onclick이벤트 -> 좋아요 insert
            		html = "<img src='webimage/disheart.png' onclick='javascript:insertlike(" + tseq + ")' style=' width:30px; vertical-align: middle;'></img>";
            		$("#heart").html(html);		
            	}
            }
        });
    }
    
    function deletelike(tseq){
    	$.ajax({
            url: "deletelike.do",
            type: "POST",
            dataType: "json",
            async: true,
            data: {
            	"tseq" : tseq
            },
            success: function(doc) {
            	alert("좋아요 취소하셨습니다");
            	islikecheck(tseq);
            	
            }
        });
    }
    
    function insertlike(tseq){
    	$.ajax({
            url: "insertlike.do",
            type: "POST",
            dataType: "json",
            async: true,
            data: {
            	"tseq" : tseq
            },
            success: function(doc) {
            	alert("좋아요를 누르셨습니다");
	            islikecheck(tseq);
	            
            }
        });
    }
    
    function printallday(){
    	var tcseq = document.getElementById("tcseq").value;
    	var url = "printallday.do?tcseq="+tcseq+"";
        window.open(url, '_blank', 'width=850 height=550');
    }

    function shareplan(){
    	// 지도 오른쪽에 띄우기
    	var tseq = document.getElementById("tseq").value;
    	var tcseq = document.getElementById("tcseq").value;
    
    	url="dailyplan.do?tseq="+tseq+"&tcseq="+tcseq;
       	location.href=url;
    }
    
    
</script>

<div style="margin-top: 5%" class="box_border" id="mainContent"><br/>
	<div align="left"> 
	<input type="text" id="tname" value="${trip.tname}(${fn:substring(trip.sdate,0,10)} ~ ${fn:substring(trip.edate,0,10)})" readonly="readonly" style="margin-top: 3px; font-size: 12px; border: solid 2px #DB3A00; border-radius: 4px; width: 80%; height: auto;" >
	<span style="margin-left: 4%" id="heart"></span>
	</div>
	<br/>
	
	<div id="calendar"></div>
	<div class="box_border" id="citydetail"></div>
	<div id="sharecan"></div>
</div>
