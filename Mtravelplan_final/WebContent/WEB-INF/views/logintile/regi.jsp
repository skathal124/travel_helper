<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div id="regi_layout" align="center"></div>

<div id="regi_main" class="col-sm-14">
	<font size="45">Sign in</font>
	<br/><br/><br/>
	
	<form action="" method="post" id="_frmForm" name="frmForm">
	<font style="font-size: 15px; font-weight: normal;">아이디</font><br/>
	<input data-msg="아이디" type="text" id="_id" name="id" >&nbsp;&nbsp;
	<input type="button" value="중복확인" id="_btnGetid">
	<br/><br/>
	
	<font style="font-size: 15px; font-weight: normal;">비밀번호</font><br/>
	<input type="password" id="_pwd" data-msg="비밀번호" name="pwd" style="border-radius: 5px; width: 55%; height: 28px;"><br/><br/>
	
	<font style="font-size: 15px; font-weight: normal;">비밀번호 확인</font><br/>
	<input type="password" name="pwd2" id="_pwd2" style="border-radius: 5px; width: 55%; height: 28px;"><br/><br/>
	
	<font style="font-size: 15px; font-weight: normal;">이름</font><br/>
	<input type="text" data-msg="이름" id="_name" name="name"><br/><br/>
	
	<font style="font-size: 15px; font-weight: normal;">닉네임</font><br/>
	<input type="text" name="nickname" id="_nickname" data-msg="닉네임">&nbsp;&nbsp;
	<input type="button" value="중복확인" id="_btnGetnickname">
	<br/><br/>
	
	<font style="font-size: 15px; font-weight: normal;">이메일</font><br/>
	<input type="text" data-msg="이메일" id="_email" name="email" placeholder="&nbsp;travelplan@google.com" style="font-size: 16px;"><br/><br/><br/>
	
	<input type="button" value="회원가입" id="_btnRegi" style="width: 24%; height: 37px; border-radius: 5px; font-size: 17px; font-weight: bold;"> 
	<a href="login.do"><font color="white" style="font-weight: normal;"><br/><br/>로그인 화면으로 돌아가기</font></a>
	</form>
	
</div>

<script type="text/javascript">

$("#_btnRegi").click(function() {
	if ($("#_id").val() == "") {
		alert($("#_id").attr("data-msg") + "를 입력해 주십시요.");
		$("#_id").focus();
		
	} else if ($("#_pwd").val() == "") {
		alert($("#_pwd").attr("data-msg") + "를 입력해 주십시요.");
		$("#_pwd").focus();
		
	} else if ($("#_pwd").val() != $("#_pwd2").val()) {
		alert($("#_pwd").attr("data-msg") + "가 일치하지 않습니다.");
		$("#_pwd").focus();
		
	} else if ($("#_name").val() == "") {
		alert($("#_name").attr("data-msg") + "을 입력해 주십시요.");
		$("#_name").focus();
		
	} else if ($("#_nickname").val() == "") {
		alert($("#_nickname").attr("data-msg") + "을 입력해 주십시요.");
		$("#_nickname").focus();
		
	} else if ($("#_email").val() == "") {
		alert($("#_email").attr("data-msg") + "을 입력해 주십시요.");
		$("#_email").focus();
	}

	else {
		alert("회원가입에 성공하였습니다");
		$("#_frmForm").attr({ "target":"_self", "action":"regiAf.do" }).submit();
	}
});


$("#_btnGetid").click(function() {	
	
	var _id=$("#_id").val();
	if(_id == ''){
		alert('아이디를 넣으세요');
	}else{
		showallcust3(_id);
	}
});

$("#_btnGetnickname").click(function() {	
	
	var _nickname=$("#_nickname").val();
	if(_nickname == ''){
		alert('닉네임을 넣으세요');
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
		   success: function(msg){
				outputList1(msg);
		   }
	 });
};

function showallcust3(id){
	$.ajax({
		   type: "POST",
			url: "./getID.do",
		   async: true,		   
		   data: "id="+id,	
		   success: function(msg){
				outputList2(msg);
		   }
	 });
};

function outputList2(msg){  
	if(msg.message=='SUCS'){
		//alert(msg.message);
		alert("사용할 수 없는 아이디 입니다.");
	}else{
		//alert(msg.message);
		alert("사용할 수 있는 아이디 입니다.");
	}
	  
} ;

function outputList1(msg){  
	if(msg.message=='SUCS'){
		//alert(msg.message);
		alert("사용할 수 없는 닉네임 입니다.");
	}else{
		//alert(msg.message);
		alert("사용할 수 있는 닉네임 입니다.");
	}
	  
} ;

</script>