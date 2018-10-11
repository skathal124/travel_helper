<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#topMenu {
	height: 30px; /* 메인 메뉴의 높이 */
	margin-left: 40px;
	background-color: white;
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
	margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
	padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: black; /* 글씨 색을 흰색으로 설정 */
	background-color: white; /* 배경 색을 RGB(2D2D2D)로 설정 */
	float: left; /* 왼쪽으로 나열되도록 설정 */
	line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */
	vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
	text-align: center; /* 텍스트를 가운데로 정렬 */
	position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
}

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	text-decoration: none; /* a 태그의 꾸밈 효과 제거 */
	display: block; /* a 태그의 클릭 범위를 넓힘 */
	width: 140px; /* 기본 넓이를 150px로 설정 */
	font-size: 13px; /* 폰트 사이즈를 12px로 설정 */
	font-weight: bold; /* 폰트를 굵게 설정 */
	font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
}

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: #ED4C00;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: white; /* 글씨 색 빨간색 */
	background-color: #ED4C00; /* 배경색을 밝은 회색으로 설정 */
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: #2d2d2d; /* 글씨 색을 RGB(2D2D2D)로 설정 */
	background-color: white; /* 배경색을 흰색으로 설정 */
	border: solid 1px gray; /* 테두리를 설정 */
	margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 138px; /* 넓이는 190px로 설정 */
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute; /* html의 flow에 영향을 미치지 않게 absolute 설정 */
	height: 0px; /* 초기 높이는 0px로 설정 */
	overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
	-webkit-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */
	-moz-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
	-o-transition: height .2s;
	/* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
	z-index: 100;
}

.topMenuLi:hover .submenu { /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	height: auto; /* 높이를 93px로 설정 */
}

.submenuLink:hover { /* 하위 메뉴의 a 태그의 마우스 오버 스타일 설정 */
	color: red; /* 글씨색을 빨간색으로 설정 */
	background-color: #FFFFC6; /* 배경을 RGB(DDDDDD)로 설정 */
}
</style>

<div id="_title_image"
   style="height: 80px; float: left; display: inline-block; color: #FF5E00; margin-left: 5px;">
   <img src="image/logo.png" style="width: auto; height: 70%; margin-top: 7%;"
      alt="logo" />&nbsp;
</div>


<div id="topMenu"
	style="height: 30px; display: inline-block; vertical-align: bottom; margin-top: 39px; float: left;">
	<!-- <nav id="topMenu" style="display: inline-block; vertical-align: bottom;"> -->


	<ul>

		<li class="topMenuLi"><a class="menuLink" href="trip.do">여행
				시작</a>
			<ul class="submenu">
				<li><a href="trip.do" class="submenuLink longLink">장소 및 기간
						설정</a></li>

			</ul></li>

		<li class="topMenuLi"><a class="menuLink" href="sharetripboard.do">일정
				공유</a>
			<ul class="submenu">
				<li><a
					href="sharetripboard.do"
					class="submenuLink longLink">여행 나누기</a></li>
				<li><a
					href="shareQnAboard.do"
					class="submenuLink longLink">의견 나누기</a></li>
			</ul></li>


		<li class="topMenuLi"><a class="menuLink" href="mpinvite.do">마이페이지</a>
			<ul class="submenu">
				<li><a href="mpinvite.do" class="submenuLink longLink">내 그룹</a></li>
				<li><a href="mpbasket.do" class="submenuLink longLink">경로
						바구니</a></li>
				<li><a href="changeinfo.do" class="submenuLink longLink">내정보
						변경하기</a></li>
			</ul>
		</li>
		
		
		
		
		<li class="topMenuLi"><a class="menuLink" href="tripBoardMain.do">그룹게시판</a>

		</li>




	</ul>

</div>


<div id="_title_today"
	style="float: right; text-align: right; line-height: 32px; margin-right: 5px;">
	<div style="position: relative; top: 38px;" id="top_sub">
		<a style="color: black; font-size: 13px;">${login.name}님 안녕하세요</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a style="color: #DB3A00; font-size: 13px;" href="main.do">[Home]</a>&nbsp;&nbsp;&nbsp;
		<a style="color: #DB3A00; font-size: 13px;" href="logout.do">[Logout]</a>
	</div>

</div>


