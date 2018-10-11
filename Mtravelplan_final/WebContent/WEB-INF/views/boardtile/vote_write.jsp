<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="UTF-8"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<%
Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH )+1; //month는 0부터라서 1더하고
int tday = cal.get(Calendar.DATE);
%>

<br/><br/><br/>
<font style="font-size: 14px; font-weight: bolder; margin-left: 9%;">&nbsp;
<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">투표 만들기</font><br/><br/>






<form action="voteWriteAf.do" method="post">
<table class="result_table" style="width:85%;">
<colgroup>
<col width="120px"/><col width="500px"/>
</colgroup>
   <tr>
      <th>아이디</th>
      <td style="text-align: left">&nbsp;${login.id}<input type="hidden" name='id' value='${login.id}'/></td>
   </tr>
   <tr>
      <th>투표기한</th>
      <td style="text-align: left">&nbsp;
         <select name='syear'>
            <%
            for(int i = tyear; i < tyear + 6; i++){ //올해부터 6년후까지
               %>
               <option    <%= (tyear+"").equals(i+"") ? "selected='selected'" : "" %> value = "<%=i%>"><%=i%></option>
               <% 
            }
            %>
         </select>년
         <select name='smonth'>
            <%
            for(int i=1; i<=12; i++){
               %>
               <option    <%= (tmonth+"").equals(i+"") ? "selected='selected'" : "" %> value="<%=i%>"><%=i%></option>
               <% 
            }
            %>
         </select>월
         <select name='sday'>
            <%
            for(int i=1; 
            i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
               %>
               <option    <%= (tday+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i%></option>
               <% 
            }
            %>
         </select>일
            ~
         <select name='eyear'>
            <%
            for(int i = tyear; i < tyear + 6; i++){
               %>
               <option    <%= (tyear+"").equals(i+"")?"selected='selected'":"" %> value="<%=i%>"><%=i%></option>
               <% 
            }
            %>
         </select>년
         <select name='emonth'>
            <%
            for(int i=1; i<=12; i++){
               %>
               <option    <%= (tmonth+"").equals(i+"")?"selected='selected'":"" %>
                   value="<%=i%>"><%=i%></option>
               <% 
            }
            %>
         </select>월
         <select name='eday'>
            <%
            for(int i=1; 
            i<=cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
               %>
               <option    <%= (tday+"").equals(i+"")?"selected='selected'":"" %>
                   value="<%=i%>"><%=i%></option>
               <% 
            }
            %>
         </select>일
      </td>
   </tr>
   <tr>
      <th>투표 내용</th>
      <td style="text-align: left">&nbsp;<textarea name='question' rows="10" cols="60" style="border:solid 1.5px #FF5E00;"></textarea></td>
   </tr>
   
   <tr>
      <th>투표 문항수</th>
      <td style="text-align: left">&nbsp;
         <select name='itemcount' onchange="pollchage(this)"> <!-- 드랍다운으로 선택하면~ pollchage(this)-->
            <%
            for(int i=2; i<=10; i++){      
               %>
               <option <%= (4+"").equals(i+"") ? "selected='selected'":"" %> value="<%=i%>"><%=i%></option>
               <% 
            }
            %>
         </select>개
      </td>
   </tr>
   
   <tr>
      <th>투표 상세 문항</th>
      <td style="text-align: left; line-height: 2.2em;">
         <%
         for(int i=1; i<=10; i++){
            %>
            <div id='poll<%=i%>'>
               &nbsp;<%= (i+"") %>번 : <input type="text" name='poll<%=i%>' size='55' style="border: solid 1.5px #FF5E00; border-radius: 3px; "/><br/>
            </div>
            <% 
         }
         %>
      </td>
   </tr>
   
   <tr align="center">
      <td colspan="2"><input type="submit" value='글쓰기' style="background:#FF5E00; color:white;"/></td>
   </tr>
   <input type="hidden" value="${tseq}" name="tseq">
</table>
</form>







<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    //$("#polldiv").hide();
   for(i=5; i<=10; i++){
      $('#poll'+i).hide(); //숨김  //poll1, poll2, poll3, poll4,->4개만 보여줄꺼임
   }
    //$("#msgid").html("since 1971. &#xA9; honnynoop. Programming is Future."); //innerHTML
});
function pollchage(me){
   //me.options[me.selectedIndex].text
   
   var num = me.options[me.selectedIndex].value; //드랍다운 리스트 1~10번에서 2번선택하면 인덱스값으로 2가 넘어옴
   alert(num);
   //$("#polldiv").show();
   for(i=1; i<=10; i++){
      $('#poll'+i).val("");
      $('#poll'+i).hide(); //숨김
   }
   for(i=1; i<=num; i++){
      $('#poll'+i).show(); //보임
   }
}
</script>