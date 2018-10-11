
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.travel.plan.member.model.TravelMember"%>
<%@page import="com.travel.plan.tripboard.model.TripPoll"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="com.travel.plan.tripboard.help.DateUtil"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<style>
.overlay:hover {background-color: #FFDC7E;}
</style>
<%! 
public String makeDate(Date d){
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	return sdf.format(d);
}
%>
<%
String id = ((TravelMember) request.getSession().getAttribute("login")).getId();
List<TripPoll> plists=new ArrayList<TripPoll>();
Object Oflist=request.getAttribute("pollist");
if(Oflist!=null){
	plists=(List<TripPoll>)Oflist;
}
%>	
<c:if test="${empty pollist}">
<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 1%;">&nbsp;
<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;투표</font><br/><br/>

<table class="vote_table" border="1">

<colgroup>
<col width="20"/><col width="40"/><col width="110"/><col width="40"/><col width="40"/><col width="25"/><col width="25"/><col width="25"/><col width="40"/>
</colgroup>
	

   <tr>
     <td><font size="12px" color="#FF5E00">등록된 투표가 없습니다.</font></td>
   </tr>
	



</table>

</c:if>
<c:if test="${!empty pollist}">
<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 1%;">&nbsp;
<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;투표(진행중)</font><br/><br/>

<table class="vote_table" border="1">

<colgroup>
<col width="20"/><col width="30"/><col width="100"/><col width="40"/><col width="40"/><col width="40"/><col width="30"/>
</colgroup>
	

	
   <tr>
      <th>No</th><th>아이디</th><th>질문(클릭시투표)</th><th>시작일</th><th>투표수</th><th>등록일</th><th>삭제</th>
   </tr>
           <%
   for(int i=0; i<plists.size();i++)
   {
	   TripPoll poll = plists.get(i);
      %>
	

	 <tr bgcolor='#ffffa2' class="overlay">
        <td class="vote_left" style="border-left:solid 1px #BDBDBD;"><%=(i+1) %></td>
        <td><%=poll.getId()%></td>

      <%
      boolean isS = poll.isVote();
      if(isS || DateUtil.isEnd(poll.getEdate())){//이미 투표 기한이 지남
         %>
         <td>[마감]<%=poll.getQuestion() %></td>
         <% 
      }else{//투표할 수 있다.
         %>
         <td><a href='voteDetail.do?tpseq=<%=poll.getTpseq()%>&tseq=<%=poll.getTseq()%>'><font color="blue" size="1"><%=poll.getQuestion() %></font></a></td>
         <% 
      }
      %>
        
         <td><font size="1px"><%=makeDate(poll.getSdate()) %></font></td>
         
         <td><%=poll.getPolltotal() %></td>
         <td><font size="1px"><%=makeDate(poll.getRegdate()) %></font></td>
		<td class="vote_right" style="border-right:solid 1px #BDBDBD;" ><% 
         	if(id==poll.getId()||id.equals(poll.getId())){
         		%>
         		<input type="button" value="삭제" style="width: 40px; color: black;background: #FF8224;" class="btn_VoteDelete"
         		onclick="" data-attache_Tpseq=<%=poll.getTpseq()%> data-attache_Tseq=<%=poll.getTseq()%>></td>
         		<%
         	}else{
         		%>
         		<font color="red">권한없음</font></td>
         		<%
         	}
         %>
	</tr>
      <%
   }
%>
</table>
<br><br><br>
</c:if>
<form id="_Votedelete" method="post" action="">
<input type="hidden" id="_tpseq" name="tpseq">
<input type="hidden" id="_tseq" name="tseq">
</form>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(".btn_VoteDelete").click(function() { // 버튼마다 클래스 부여해서 해당하는 곳 this로 부름
	if (window.confirm("투표를 삭제 하시겠습니까?"))
	{			
		$("#_tpseq").val($(this).attr("data-attache_Tpseq"));
		$("#_tseq").val($(this).attr("data-attache_Tseq"));
		alert($("#_tseq").val()+"   "+$("#_tpseq").val());
		$("#_Votedelete").attr( {"action":"voteDeleteAf.do"} ).submit(); 
	}
});
 
</script>