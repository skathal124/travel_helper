<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<style>

.img {
	width: 100%;
	height: 100%;
	vertical-align: middle;
	display: block;
}

.middiv {
	display: inline-block;
	width: 29%;
	margin-left: 3%;
	border-bottom: solid 2px #BDBDBD;

	margin-bottom: 3%;
}
.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: #FF7012;
}
.container:hover .overlay {
  opacity: 0.85;
  font
}

.container {
  position: relative;
}

</style>

<html>

<br><br>
<!-- <font style="font-size: 14px; font-weight: bolder; margin-left: 3%;">&nbsp;<img src="image/화살표.png" style="width: 16px; height: 16px; vertical-align: top;">&nbsp;사진첩</font><br/><br/> -->

<c:if test="${empty albumlist}">
<div  align="center">
	<form name="frmForm" id="_frmForm" action="photoWrite.do" method="post">
	<div align="center" style="vertical-align: middle;">
		<br><br><br>
			<a style="font-size: 14px; font-weight: bolder;">등록된 사진이 없습니다</a> <br />
		<br>

	</div>
	</form>
</div>
</c:if>


<c:forEach var="alist" items="${albumlist}">
<c:if test="${alist.id eq login.id}">
<div class="middiv" align="left">

    		<div class="ddd" align="center" style="margin-bottom: 7px; ">
				<font color="black" style="font-size: 14px; font-weight: bold;">${alist.title}</font><br/>
			</div>
			
			<div align="center" style="height: 200px; " class="container">
				<c:choose>
					<c:when test="${fn:contains(alist.filename, '.back')}" >
						<img class="img" src="./webimage/noimage.png" alt="Avatar" />
					</c:when>
					<c:otherwise>
						<img class="img" src="./webimage/${alist.filename}" alt="Wait" />
					</c:otherwise>
				</c:choose>		
				
				
				<div class="overlay" onclick="asdf('${alist.filename}');">
    			<div class="text">
    			<div style="opacity: 1; font-weight: bold; color: white; font-size: 16px;"><br><br><br><br><br>확대하기</div>
    			</div>
  				</div>
  			</div>
    			
    		<div class="ddd" align="left" style="display: inline-block;">
				<font color="#FF7012" style="line-height: 1.5em;">작성자: ${alist.id}&nbsp;</font>
				
			</div>

			<div class="ddd" align="right" style="display: inline-block; float: right; vertical-align: middle;">
				<font color="gray">${fn:substring(alist.regdate,0,10)}</font>			
			</div>

		<div align="center" style="color: #FF7012;  font-weight: bold; border-top: dotted 1px #BDBDBD;  margin-top: 0;">
		
			<div style="display:inline-block; float: left;" align="left">
			<input type="button" value="수정"  data-attache_file_name="${alist.seq}" data-attache_file_name2="${alist.tseq}" class="btn_updatePhoto"
			style="width: 30px; height:22px;">
			<input type="button" value="삭제"  data-attache_file_name="${alist.seq}" data-attache_file_name2="${alist.tseq}" class="btn_deletePhoto"
			style="width: 30px; height:22px;">
			</div>
			
			<div style="width: 49%; display:inline-block; float: right;" align="right">
			<font color="#FF7012" >${alist.downcount}회다운</font>
			<input type="button" name="btnDown2" value="다운로드" id="btn_down"
			style="width: 60px; height:22px;"
				onclick="filedowns('${alist.filename}','${alist.seq}')"/>
			</div>
		</div>
		
		
		
			<form name="frmForm1" class="_frmForm1" action="" method="post">
				<input type="hidden" class="_photo_seq" name='seq' />
				<input type="hidden" class="_photo_tseq" name='tseq' />
			</form>
			
	</div>
</c:if>









<c:if test="${alist.id ne login.id}">
<div class="middiv" align="left">

			<div class="ddd" align="center" style="margin-bottom: 7px; ">
				<font color="black" style="font-size: 14px; font-weight: bold;">${alist.title}</font>
			</div>
			
			<div align="center" style="height: 200px; " class="container">
				<c:choose>
					<c:when test="${fn:contains(alist.filename, '.back')}" >
						<img class="img" src="./webimage/noimage.png" alt="Avatar" />
					</c:when>
					<c:otherwise>
						<img class="img" src="./webimage/${alist.filename}" alt="Wait" />
					</c:otherwise>
				</c:choose>		
				
				
				<div class="overlay" onclick="asdf('${alist.filename}');">
    			<div class="text">
    			<div style="opacity: 1; font-weight: bold; color: white; font-size: 16px;"><br><br><br><br><br>확대하기</div>
    			</div>
  				</div>
  			</div>
			
			<div class="ddd" align="right" style="display: block;; float: left; vertical-align: middle;">
				<font color="gray">${fn:substring(alist.regdate,0,10)}</font>			
			</div>
			<br>
		<div align="center" style="color: #FF7012;  font-weight: bold; border-top: dotted 1px #BDBDBD;  margin-top: 0;">
			<div class="ddd" align="left" style="display: inline-block; float: left; vertical-align: middle;">
				<font color="#FF7012" style="line-height: 1.5em;">작성자: ${alist.id}&nbsp;</font>
			</div>
			
			<div style=" display:inline-block; float: right;" align="right">
			<font color="#FF7012">${alist.downcount}회다운</font>
			<input type="button" name="btnDown2" value="다운로드" id="btn_down"
			style="width: 60px; height:22px;"
				onclick="filedowns('${alist.filename}','${alist.seq}')"/>
			</div>
		</div>
	</div>
</c:if>
	</c:forEach>
			<br>
<form name="frmForm2" id="_frmForm2" action="photoWrite.do" method="post">
<div align="center">
<input type="button" value="글쓰기" id="btn_writePhoto" data-attache_file_name="${tseq}">
<input type="hidden" name="tseq" id="_photo_tseq"/>
</div>
<br><br>
</form>
<form name="delfileup" action="" method="post" id="_delfileup">
<input type="hidden" name="filename" id="_filename"/>
<input type="hidden" name="seq" id="_seq"/>
</form>

</html>
<script type="text/javascript"> 
function filedowns(filename,seq){

	$("#_filename").val(filename);
	$("#_seq").val(seq);
 	$("#_delfileup").attr({ "target":"_self", "action":"fileDownload.do"}).submit();

}

$("#btn_writePhoto").click(function() { // 버튼마다 클래스 부여해서 해당하는 곳 this로 부름			
	$("#_photo_tseq").val($(this).attr("data-attache_file_name"));

	$("#_frmForm2").attr( {"action":"photoWrite.do"} ).submit();
});

$(".btn_updatePhoto").click(function() { // 버튼마다 클래스 부여해서 해당하는 곳 this로 부름			
		$("._photo_seq").val($(this).attr("data-attache_file_name"));
		$("._photo_tseq").val($(this).attr("data-attache_file_name2"));

		$("._frmForm1").attr( {"action":"updateGroupPhoto.do"} ).submit();
});

$(".btn_deletePhoto").click(function() { // 버튼마다 클래스 부여해서 해당하는 곳 this로 부름		
	if (window.confirm("파일을 삭제 하시겠습니까?")){
		$("._photo_seq").val($(this).attr("data-attache_file_name"));
		$("._photo_tseq").val($(this).attr("data-attache_file_name2"));

		$("._frmForm1").attr( {"action":"deleteGroupPhoto.do"} ).submit();
	}
});


function asdf(filename) {
	var url = "picture.do?filename="+filename;
	window.open(url, '_blank', 'width=1100 height=650');
}
</script>