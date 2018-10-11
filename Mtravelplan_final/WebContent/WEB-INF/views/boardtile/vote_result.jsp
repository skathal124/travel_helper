<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 9%;">&nbsp;
<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;투표 결과</font><br/><br/>


<table class="result_table">
<colgroup>
<col width="170px"/><col width="500px"/>
</colgroup>
<tr>
<th>투표번호</th>
<td style="text-align: left"><input type="text" name='tpseq' value='${poll.tpseq}' size="50"
readonly="readonly"/></td>
</tr>
<tr>
<th>아이디</th>
<td style="text-align: left"><input type="text" name='id' value='${poll.id}' size="50"
readonly="readonly"/></td>
</tr>
<tr>
<th>투표기한</th>
<td style="text-align: left">
${poll.sdate}~${poll.edate}
</td>
</tr>

<tr>
<th>투표 결과<br>(전체 투표자: ${poll.polltotal}명)</th>
<td>
<jsp:useBean id="vbean" class="com.travel.plan.tripboard.help.VoteBean"/>
<c:forEach items="${pollsublist}" var="psub" varStatus="vs">
<jsp:setProperty property="acount" name="vbean" value="${psub.acount}"/>
<jsp:setProperty property="total" name="vbean" value="${poll.polltotal}"/>
<table class="list_table" style="width:95%;">
<col width="30"/><col width="500"/>
<tr><th style="width:50px">${vs.count}번</th><td style="text-align: left">
${psub.answer}<br>
<jsp:getProperty property="makeBar" name="vbean" />
</td>
</tr>
</table>
</c:forEach>
</td>
</tr>
</table>
<a href='vote.do?tseq=${poll.tseq}' style="color:#FF5E00;">투표목록</a><br/>