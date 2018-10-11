<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>


<div id="login_layout" align="center"></div>

<form name="frmForm" id="_frmForm" action="loginAf.do" method="post">

<div id="welcome">
   <font size="45">Welcome to</font>
   <font size="6" color="#FFE400"><br>Travel Plan!</font>
   <br/><br/>
</div>


<div id="welcome2">
   <font size="4" style="font-weight: normal;">
   아이디, 비밀번호를 입력하세요
   </font>
   <br/>
</div>



<div id="enter">

   <input type="text" name="id" id="_id" placeholder="&nbsp;&nbsp;Enter the ID" data-msg="ID를"><br/><br/>
   <input type="password" name="pwd" id="_pwd" data-msg="Password를" style="border-radius: 5px; width: 75%; height: 30px;" placeholder="&nbsp;&nbsp;Enter the PASSWORD"><br/><br/>
   <input type="checkbox" id="_chk_save_id"><font style="font-weight: normal;">로그인 정보 저장</font>
   <div id='message'></div>
</div>



<div id="button">
   <input type="button" value="로그인"  id="_btnLogin">&nbsp;&nbsp;&nbsp;
<!--    <button type="button" class="btn btn-default" onclick="login();">로그인</button> -->
   <input type="button"  value="회원가입" onclick="regi();">
</div>
</form>
<script type="text/javascript">
function regi() { self.location.href = "regi.do";  return false; }

$("#_btnLogin").click(function() {
   var id = $("#_id").val();
   var pwd = $("#_pwd").val();
   if ($("#_id").val() == "") {
        $("#message").html("ID 를 입력해주세요");
        $("#message").css("color","red"); 
      $("#_id").focus();
      
   } else if ($("#_pwd").val() == "") {
        $("#message").html("PassWord를 입력해주세요");
        $("#message").css("color","red"); 
      $("#_pwd").focus();
      
   }else {
      showallcust3(id, pwd);
   }
});

$("#_id").keypress(function(event) {
   if (event.which == '13') {
      event.preventDefault();
      $("#_pwd").focus();
   }
});         

$("#_pwd").keypress(function(event) {
   if (event.which == '13') {
      event.preventDefault();
      $("#_btnLogin").click();
   }
});

// id저장
$(function() {

   var user_id = $.cookie("user_id");
   //alert(user_id);
   if (user_id != null) {
      $("#_id").val(user_id);
       $("#_chk_save_id").prop("checked",true);
   }         

   $("#_chk_save_id").click(function () {
       if ($(this).prop("checked")) {
          //alert('cookie');
           if ($("#_id").val() == "") {
               $(this).prop("checked", false);
               alert("아이디를 입력해 주십시요.");
           } else {
               $.cookie("user_id", $("#_id").val(), { path:"/", expires:365 });
               
           }
       } else {
          $.cookie("user_id", null, { path:"/", expires:-1 });
       }
})
});   
function submit(){
   $("#_frmForm").attr("target","_self").submit();
}

function showallcust3(id,pwd){
   $.ajax({
         type: "POST",
         url: "./idorpass.do",
         async: true,         
         data: {"id":id,"pwd":pwd},
         success: function(msg){
            outputList2(msg);
         }
    }); 
   
   
}
function outputList2(msg){  
   if(msg.message=='SUCS'){
      $("#_frmForm").attr("target","_self").submit();
   
   }else{
     /* alert("ID 또는 PassWord를 확인해주세요");  */
     $("#message").html("ID 또는 PassWord를 확인해주세요");
     $("#message").css("color","red"); 
       $("#_id").val('');
       $("#_pwd").val('');
   }
     
} ;
</script>