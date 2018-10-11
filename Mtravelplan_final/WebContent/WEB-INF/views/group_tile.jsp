<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />





<!DOCTYPE html>
<html lang="ko">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script type="text/javascript">

// 	var list = new Array();

	function plus() {
		var id = document.getElementById("idd").value;
		var tseq = ${trip.tseq};
		checkid(id, tseq);
	}
	
	function checkid(id,tseq){
		$.ajax({
	        type: "POST",
	        url: "./checkid.do",
	        async: true,         
	        data: {"id":id, "tseq":tseq},
	        success: function(msg){
	       	 show(msg);
	       	}
		}); 
	}

	function show(msg){  
		   if(msg==0){
			   $("#_invite").val(document.getElementById("idd").value);
			   $("#idd").val('');
		   }else{
		      alert("초대할 수 없는 id 입니다");
		       $("#idd").val('');
		   }
		     
		} ;
		
		
		
	function invite() {
		var inviteid = document.getElementById("_invite").value;
		var tseq = ${trip.tseq};
		var url = "inviteMember.do?id="+inviteid+"&tseq="+tseq;
		location.href=url;
		alert('초대 완료');
		
// 		inviteCon(inviteid,tseq);
	}
	
	
// 	function inviteCon(inviteid,tseq){
		
// 	}
	
	
// 	function inviteCon(id){
// 		$.ajax({
// 	        type: "POST",
// 	        url: "./inviteMember.do",
// 	        async: true,         
// 	        data: {"id":id,"tseq":tseq},
// 	        success: "";
// 	       	}
// 		}); 
// 	}
		
		
// 	function finalid() {
// 		var aaaa = JSON.stringify({'id' : list});
// 		console.log(aaaa);
// 		alert(typeof aaaa);
// 		$.ajax({
// 	         type: "POST",
// 	         url: "./updateGroup.do",
// 	         async: true,         
// 	         data : JSON.stringify({'id' : list}),
// 	         dataType : 'json',
// 	         success: function(msg){
// 	        	 alert(msg);
// 	        	 list[list.length]=id;
	        	 
// 	         }
// 	    }); 
// 	}
	
		
</script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css"/>
<style type="text/css">
</style>
</head>

<title>Travel group</title>

<body style="margin: 0;">

	<div id="group_wrap" >
		
		<div id="group_top" align="center">
			<font style="font-size: 23px; font-weight: bolder; font-family: monospace; color: #C92800">TravelGroup</font><br/>
			<font style="font-size: 13px; font-weight: bold; color: #474747;">그룹원 추가</font><br/><br/>
		</div>
		
		<div id="group_main" >
			
				
				<font style="font-size: 13px; font-weight: bold; color: #474747; text-align: left;" >여행 이름</font><br /> <input type="text" name="tname" readonly="readonly"
				value="${trip.tname }"><br />
				<br /><br /> <font
					style="font-size: 13px; font-weight: bold; color: #474747; text-align: left;">시작 날짜</font> <br /> <input type="text" name="sdate" 
					value="${fn:substring(trip.sdate,0,10)}"
					 readonly="readonly"><br />
				<br /><br /> <font
					style="font-size: 13px; font-weight: bold; color: #474747">마지막 날짜</font> <br /> <input type="text" name="edate"
					value="${fn:substring(trip.edate,0,10)}"
					 readonly="readonly">
			
			
				<br/><br/><br/>
				<font style="font-size: 13px; font-weight: bold; color: #474747; " >그룹원 추가</font><br /> 
				<input type="text" id="idd" name="id" placeholder="&nbsp;id를 입력하세요" style="margin-top: 3px; border: solid 2px #DB3A00; border-radius: 4px; width: 77%; height: 22px;" >
				<input type="button" value="검색" style="border-radius: 3px; width: 46px; height: 26px; background-color: #FF7012; color: white; font-weight: bolder; font-size: 13px; vertical-align: middle; margin-top: 3px;"
				onclick="plus();">

				
				<input type="text" id="_invite" readonly="readonly" style="margin-top: 3px; border: solid 2px #DB3A00; border-radius: 4px; width: 77%; height: 22px;" >
				<input type="button" value="초대" style="border-radius: 3px; width: 46px; height: 26px; background-color: #FF7012; color: white; font-weight: bolder; font-size: 13px; vertical-align: middle; margin-top: 3px;"
				onclick="invite();">
			
			
			<div align="center" style="margin-bottom: 3%;">
			<br/><br/><br/>
			<input type="button" value="초대 완료" onclick="self.close();"
				style="border-radius: 3px; width: 85px; height: 30px; background-color: #FF7012; color: white; font-weight: bolder; font-size: 14px;"
				>
			</div>
		</div>
		
	</div>
	
</body>
</html>
