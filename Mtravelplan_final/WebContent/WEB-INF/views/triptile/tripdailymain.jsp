<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<fmt:requestEncoding value="utf-8" />

<div style="margin-left: 7%; margin-top: 5%">
	<img onclick='javascript:leftpic()' src='<%=request.getContextPath()%>/webimage/left.png' style='vertical-align: middle;' width='15px' height='15px'></img>
	<font style="font-size: 18px; font-weight: bolder; font-family: monospace; color: #C92800"><span id='infonum'>사용 설명서 (1)</span></font>
	<img onclick='javascript:rightpic()' src='<%=request.getContextPath()%>/webimage/right.png' style='vertical-align: middle;' width='15px' height='15px'></img>
	<div id="infoimage"><img src='webimage/info1.PNG' style='vertical-align: middle;'></img></div>
</div>

<script>
var infonum = 1;
var html = "";

function leftpic(){
	if(infonum == 1){
		alert("첫번째 장입니다");
	}
	else{
		infonum--;
		$("#infonum").text("사용 설명서 ("+infonum+")");
		html = "<img src='webimage/info"+ infonum +".PNG' style='vertical-align: middle;'></img>";
		$("#infoimage").html(html);
	}
}

function rightpic(){
	// 최대 장수를 막아주는 if else 좀따 걸어. 위에 span에도 몇장인지 써놔
	if(infonum == 6){
		alert("마지막 장입니다");
	}
	else{
		infonum++;
		$("#infonum").text("사용 설명서 ("+infonum+")");
		html = "<img src='webimage/info"+ infonum +".PNG' style='vertical-align: middle;'></img>";
		$("#infoimage").html(html);		
	}
}
</script>