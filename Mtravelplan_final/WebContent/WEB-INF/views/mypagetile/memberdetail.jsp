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
/*    border-top: solid 2px #BDBDBD; */
   border-bottom: solid 2px #BDBDBD;
   
   margin-bottom: 5%;
}

.title {
   width: 100%;
   height: 15%;
   font-size: 12px;
   font-weight: bold;

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

<title>Group Info</title>
<br/>
<div id="city_top" align="center">
   <font style="font-size: 25px; font-weight: bolder; font-family: monospace; color: #C92800">Member List</font><br />
   <font style="font-size: 13px; font-weight: bold; color: #474747;">${tname}</font>
</div><br/><br/>
<table class="list_table"  align="center">
<tr><th width="55px">&nbsp;</th><th width="120px">아이디</th><th width="100px">이름</th><th width="120px">닉네임</th></tr>
<c:forEach var="memberlist" items="${memberlist}"  varStatus="status">
<tr><td>${status.count}</td><td>${memberlist.id}</td><td>${memberlist.name}</td><td>${memberlist.nickname}</td></tr>
</c:forEach>
</table>
   
