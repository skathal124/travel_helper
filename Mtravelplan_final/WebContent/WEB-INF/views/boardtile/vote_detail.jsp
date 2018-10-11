<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>

<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 9%;">&nbsp;
<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">투표하기</font><br/><br/>

<form action="polling.do" method="post">
<input type="hidden" value="${poll.tseq}" name="tseq">
<table class="result_table">
<colgroup>
<col width="150px"/><col width="500px"/>
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
<th>투표 내용</th>
<td style="text-align: left"><textarea name='question' rows="10" readonly="readonly"
cols="60">${poll.question}</textarea></td>
</tr>

<tr>
<th>투표 문항수</th>
<td style="text-align: left">
${poll.itemcount}개
</td>
</tr>

<tr>
<th>투표 상세 문항</th>
<td style="text-align: left">
<c:forEach items="${pollsublist}" var="psub" varStatus="vs">
${vs.count}번 :
<input type="radio" name='pollsubseq' 
 ${vs.count==1 ?"checked='checked'":""} 
value='${psub.pollsubseq}'/>
<input type="text"   size='60' readonly="readonly" 
name='answer'  value='${psub.answer}'/>
<br/>
</c:forEach>
</td>
</tr>

<tr align="center">
<td colspan="2"><br><br><input type="submit" value='투표하기' style="background:#FF5E00; color:white"/></td>
</tr>
</table>
</form>
<a href='vote.do?tseq=${poll.tseq}' style="color:#FF5E00;">투표목록</a><br/>
</body>
</html>