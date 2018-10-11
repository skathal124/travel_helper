<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<form name="frmForm" id="_frmForm" action="" method="post">
<br/><br/>


<div align="center" id="myinfo_main">

	<div align="center" id="myinfo_top">
		<br>
		<a><img src="image/자물.png" style="width: 9%; height: 9%;"></a>
		<br>
		<font style="font-size: 16px; font-weight: bolder;">회원 정보 수정</font><br><br>
		<font style="font-size: 15px; font-weight: bolder;">보다 안전한 서비스 제공을 위해 <font style="color: red;">주기적인 비밀번호 변경</font>을 부탁드립니다</font>
		
		<br><br><br><br><br><br>
	</div>
	
	<div id="myinfo_left" align="left">
	   <font id="stitle">아이디&nbsp;&nbsp;&nbsp;&nbsp;</font>
	   <input type="text" readonly="readonly" value="${member.id}"><br><br><br>
	   
	   <font id="stitle">이&nbsp;&nbsp;름&nbsp;&nbsp;&nbsp;&nbsp;</font>
	   <input type="text" readonly="readonly" value="${member.name}"><br><br><br>
	   
	   <font id="stitle">닉네임&nbsp;&nbsp;&nbsp;&nbsp;</font>
	   <input type="text"  placeholder="${member.nickname}" name="nickname" id="_nickname" onkeydown="javascript:inputNickNameChk();">
	   
	   <input type="hidden" value="NickNameUncheck" id="NickNamecheck">&nbsp;<input type="button" value="중복확인" id="_btnGetnickname" ><br><br><br>
	   
	   <font id="stitle">이메일&nbsp;&nbsp;&nbsp;&nbsp;</font>
	   <input type="text"  placeholder="${member.email}" name="email" id="_email">
	    
	</div>
	
	
	<div id="myinfo_right" align="left">
	   <font id="stitle">현재 비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
	   <input type="password" name="pwd1" id="_pwd1" data-msg="현재 비밀번호" placeholder="현재 비밀번호"  data-msg="비밀번호" name="pwd3">&nbsp;&nbsp;<input type="button" value="확인" id="btn_checkpass"><br><br><br>
	   
	   <font id="stitle">새 비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
	   <input type="password" name="pwd" id="_pwd"  placeholder="새 비밀번호"   name="pwd" onkeydown="javascript:inputPassChk();"><input type="hidden" value="PassUncheck" id="Passcheck"><br/><br/><br>
	   
	   <font id="stitle">새 비밀번호 확인&nbsp;&nbsp;</font>
	   <input type="password" name="pwd2" id="_pwd2"  placeholder="새 비밀번호 확인" name="pwd2">&nbsp;&nbsp;<input type="button" value="확인" id="btn_checknewpass"><br><br><br>
	   
	</div>
	
	<div align="center">
		<br><br><br><br><br><br>
		<input type="button" value="수정 완료" id="btn_MyPageUpDate" style="width: 8%; height: 27px; border-radius: 5px; font-size: 13px; font-weight: bold;">
	</div>

</div>
   
</form>



<script type="text/javascript">
var count2=0;

$("#btn_MyPageUpDate").click(function() {
   var pass = $("#_pwd").val();
   var nickname = $("#_nickname").val();
   
   var passcheck = $("#Passcheck").val();
   var nicknamecheck = $("#NickNamecheck").val();
   if(count2==1&&nickname!=""&&pass!=""){
      if(nicknamecheck!="NickNamecheck"){
         alert("닉네임 중복확인을 해주세요");
      }else if(passcheck!="Passcheck"){
         alert("새 비밀번호를  확인해주세요");
      }else{
         alert("성공적으로 수정되었습니다.");
         $("#_frmForm").attr({ "target":"_self", "action":"ChangeInfoAf.do" }).submit();
      }
   }else if (count2==1&&nickname!=""){
      if(nicknamecheck!="NickNamecheck"){
         alert("닉네임 중복확인을 해주세요");
      }else{
         alert("성공적으로 수정되었습니다.");
         $("#_frmForm").attr({ "target":"_self", "action":"ChangeInfoAf.do" }).submit();
      }
   }else if (count2==1&&pass!=""){
      if(passcheck!="Passcheck"){
         alert("새 비밀번호를 확인해주세요");
      }else{
         alert("성공적으로 수정되었습니다.");
         $("#_frmForm").attr({ "target":"_self", "action":"ChangeInfoAf.do" }).submit();
      }
   }else{
      if(count2==0){
         alert("현재 비밀번호를 확인해주세요")
      }else{
         alert("성공적으로 수정되었습니다.");
         $("#_frmForm").attr({ "target":"_self", "action":"ChangeInfoAf.do" }).submit();
      }
   }


});

function inputNickNameChk(){
   $("#NickNamecheck").val("NickNameUncheck");
}

function inputPassChk(){
   $("#Passcheck").val("PassUncheck");
}

$("#_btnGetnickname").click(function() {   
   var _nickname=$("#_nickname").val();
   if(_nickname == ''){
      alert('닉네임을 입력하세요');
   }else{
      showallcust2(_nickname);
   }
});

function showallcust2(nickname){
   $.ajax({
         type: "POST",
         url: "./getNickname.do",
         async: true,         
         data: "nickname="+nickname,   
         success: function(msg,nickname){
            outputList2(msg,nickname);
         }
    });
};

function outputList2(msg){  
//    
   if(msg.message=='SUCS'){
      //alert(msg.message);
      alert("사용할 수 없는 닉네임 입니다.");
      $("#_nickname").val("");
      
      count=0;
   }else{
      //alert(msg.message);
      alert("사용할 수 있는 닉네임 입니다.");
      $("#NickNamecheck").val("NickNamecheck");
   }
     
} ;

$("#btn_checkpass").click(function() {   
   
   var _pwd1=$("#_pwd1").val();
   if(_pwd1 == ''){
      alert('비밀번호를 입력해주세요');
   }else{
      showallcust1(_pwd1);
   }
});

function showallcust1(pwd){
   $.ajax({
         type: "POST",
         url: "./checkMypagePwd.do",
         async: true,         
         data: "pwd="+pwd,   
         success: function(msg){
            outputList1(msg);
         }
    });
};

function outputList1(msg){  
//    
   if(msg=='SUCS'){
      //alert(msg.message);
      alert("성공하였습니다.");
      count2=1;
   }else{
      //alert(msg.message);
      alert("비밀번호가 틀렸습니다.");
      $("#_pwd1").val("");

   }
} ;

$("#btn_checknewpass").click(function() {   
   
   var _pwd1=$("#_pwd").val();
   var _pwd2=$("#_pwd2").val();
   if(_pwd1==""||_pwd2==""){
      alert('비밀번호를 입력해주세요');
   }
   else if(_pwd1 == _pwd2){
      alert('비밀번호가 일치합니다.');
      $("#Passcheck").val("Passcheck");
   }else{
      alert('비밀번호를 확인해주세요.');
      $("#_pwd").val("");
      $("#_pwd2").val("");
   }
});

</script>
