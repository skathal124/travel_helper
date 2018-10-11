<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>



<form name="frmForm" id="_frmForm" action="" method="post">


	<div align="center" id="myinfo_top">
		<br><br/><br/>
		<a><img src="image/자물.png" style="width: 9%; height: 9%;"></a>
		<br>
		<font style="font-size: 16px; font-weight: bolder;">회원 탈퇴</font><br><br>
		<font style="font-size: 15px; font-weight: bolder;">회원 탈퇴를 하게 되면 <font style="color: red;">생성한 모든 그룹</font>이 해체되며 더이상 서비스를 이용할 수 없습니다</font>
		
		<br><br><br><br><br><br>
	</div>
	
	<div align="left" id="myinfo_out">
	

	<font id="stitle">아이디&nbsp;&nbsp;&nbsp;&nbsp;</font> <input type="text" readonly="readonly" value="${member.id}"><br><br><br>
	<font id="stitle">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font> <input type="text" readonly="readonly" value="${member.name}"><br><br><br>
	<font id="stitle">비밀번호&nbsp;&nbsp;</font> <input type="password" name="pwd1" id="_pwd1" data-msg="현재 Password 확인"   data-msg="비밀번호" name="pwd3">
<!-- 	<input type="button" value="확인" id="btn_checkpass"> -->
	<br><br><br><br>

	</div>
	
	<div align="center" id="_btnDelete"><input type="button" value="탈퇴하기" id="_btnDelete" ></div>

</form>




<script type="text/javascript">
var count2 = 0;

$("#_btnDelete").click(function() {   
   
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
  
   if(msg=='SUCS'){
		if(window.confirm("정말로 탈퇴하시겠습니까?")) {
      
      alert("성공적으로 탈퇴되었습니다.");
      $("#_frmForm").attr({ "target":"_self", "action":"deleteMember.do" }).submit();
		}
   }else{
	   alert("현재 비밀번호를 확인해주세요");
      $("#_pwd1").val("");

   }
} ;

</script>
