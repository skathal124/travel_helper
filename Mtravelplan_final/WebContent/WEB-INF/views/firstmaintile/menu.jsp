<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

<style>
#topMenu {
   height: 30px; /* 메인 메뉴의 높이 */
   width:auto;
   background-color: white;
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
   list-style-type: none; /* 메인 메뉴 안의 ul 내부의 목록 표시를 없애줌 */
   margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
   padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
   color: white; /* 글씨 색을 흰색으로 설정 */
   background-color: #5D0000; /* 배경 색을 RGB(2D2D2D)로 설정 */
   float: left; /* 왼쪽으로 나열되도록 설정 */
   line-height: 30px; /* 텍스트 한 줄의 높이를 30px로 설정 */
   vertical-align: middle; /* 세로 정렬을 가운데로 설정 */
   text-align: center; /* 텍스트를 가운데로 정렬 */
   position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
}

.menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
   text-decoration: none; /* a 태그의 꾸밈 효과 제거 */
   display: block; /* a 태그의 클릭 범위를 넓힘 */
   width: 180px; /* 기본 넓이를 150px로 설정 */
   font-size: 13px; /* 폰트 사이즈를 12px로 설정 */
   font-weight: bold; /* 폰트를 굵게 설정 */
   font-family: "Trebuchet MS", Dotum; /* 기본 폰트를 영어/한글 순서대로 설정 */
}

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
   color: white;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
   color: white; /* 글씨 색 빨간색 */
   background-color: #4B4B4B; /* 배경색을 밝은 회색으로 설정 */
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
   color: #2d2d2d; /* 글씨 색을 RGB(2D2D2D)로 설정 */
   background-color: #DBDBDB; /* 배경색을 흰색으로 설정 */
   border: solid 1px black; /* 테두리를 설정 */
   margin-top: -1px; /* 위 칸의 하단 테두리와 아래칸의 상단 테두리가 겹쳐지도록 설덩 */
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
   width: 178px; /* 넓이는 190px로 설정 */
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
   background-color: white; /* 배경을 RGB(DDDDDD)로 설정 */
}
</style>

<nav id="topMenu">


   <ul>
   
      <li class="topMenuLi"><a class="menuLink"
         href="trip.do">여행 시작</a>
         <ul class="submenu">
            <li><a
               href="trip.do"
               class="submenuLink longLink">장소 및 기간 설정</a></li>
               
         </ul>
         <li>|</li>
      </li>
      


      


      <li class="topMenuLi"><a class="menuLink"
         href="shareboard.do">일정 공유</a>
         <ul class="submenu">
            <li><a
               href="http://unikys.tistory.com/category/Programming%20Lecture/%EC%86%8D%EA%B9%8A%EC%9D%80%20%EC%9E%90%EB%B0%94%EC%8A%A4%ED%81%AC%EB%A6%BD%ED%8A%B8%20%EA%B0%95%EC%A2%8C"
               class="submenuLink longLink">1</a></li>
            <li><a
               href="http://unikys.tistory.com/category/Programming%20Lecture/%EB%B0%91%EB%B0%94%EB%8B%A5%EB%B6%80%ED%84%B0%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"
               class="submenuLink longLink">2</a></li>
            <li><a
               href="http://unikys.tistory.com/category/Programming%20Lecture/Android%28%EC%95%88%EB%93%9C%EB%A1%9C%EC%9D%B4%EB%93%9C%29%20%EC%95%B1%20%EA%B0%9C%EB%B0%9C"
               class="submenuLink longLink">3</a></li>
         </ul>
         <li>|</li>
      </li>
      
      
            <li class="topMenuLi"><a class="menuLink"
         href="mpinvite.do">My Page</a>
         <ul class="submenu">
            <li><a
               href="mpinvite.do"
               class="submenuLink longLink">MyGroup</a></li>
            <li><a
               href="mpbasket.do"
               class="submenuLink longLink">경로 바구니</a></li>
            <li><a
               href="changeinfo.do"
               class="submenuLink longLink">내정보 변경하기</a></li>
         </ul>
      </li>
      
      
      

   </ul>
   </nav>

   
   
   