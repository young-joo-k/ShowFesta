<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<main id="main">
	<html>
<head>
<link href="/resources/css/mainpage.css?after" rel="stylesheet">
<link href="/resources/css/search.css?after" rel="stylesheet">
<link href="/resources/css/swiper.css?after" rel="stylesheet">
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<title>Home</title>
</head>
<body>
	<div class="header">
		<div class="header_content">
			<div class="contents">
				<h1 onclick>
					<a href="/"> ShowFesta </a>
				</h1>
				<ul class="memberInfo_wrap">
					<li><a href="../join/login"> <img
							src="https://img.cgv.co.kr/R2014/images/common/ico/loginPassword.png"
							alt="로그인"> <span>로그인</span>
					</a></li>
					<li><a href="../join/register"> <img
							src="https://img.cgv.co.kr/R2014/images/common/ico/loginJoin.png"
							alt="회원가입"> <span>회원가입</span>
					</a></li>
					<li><a href="../join/mypage"> <img
							src="https://img.cgv.co.kr/R2014/images/common/ico/loginMember.png"
							alt="MY PAGE"> <span>마이페이지</span>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="nav">
			<div class="contents">
				<ul class="nav_menu">
					<li>
						<h2>
							<a href="/">홈</a>
						</h2>
					</li>
					<li class="dropdown">
						<h2>
							<a href="#">카테고리</a>
						</h2>
						<ul class="category">
							<li><a href="#">뮤지컬</a></li>
							<li><a href="#">콘서트</a></li>
							<li><a href="#">페스티벌</a></li>
							<li><a href="#">지역축제</a></li>
						</ul>
					</li>
					<li>
						<h2>
							<a href="/page/calendar">캘린더</a>
						</h2>
					</li>
					<li>
						<h2>
							<a href="/page/notice_list">고객센터</a>
						</h2>
					</li>
				</ul>
			<div class="search-box active result">
				<div class="totalSearch_wrap">
					<button type="button" class="btn_totalSearch" id="btn_header_search" onclick="location.href='/page/search'"><span class="a11y-hidden">검색</span></button>
					<input type="text" id="search" name="search" placeholder="입력한번 해보시오" class="search-inpt">
					<button type="button" class="btn-del">
						<span class="a11y-hidden">검색어 삭제</span>
					</button>
				</div>
			</div>	
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    // 카테고리 메뉴에 호버 이벤트 핸들러 추가
    $('.dropdown').hover(
        function() {
            // 호버 시 드롭다운 메뉴를 보이게 하기
            $(this).find('ul').slideDown('fast');
        },
        function() {
            // 호버가 해제될 때 드롭다운 메뉴를 숨기기
            $(this).find('ul').slideUp('fast');
        }
    );
    $('.dropdown ul').hide();
});
</script>
    <script>
        $(document).ready(function() {
            // 페이지가 로드된 후 실행될 코드
            var searchBox = $(".search-box");
            var searchInput = $(".search-inpt");
            var searchButton = $("#btn_header_search");

            // 검색 상자를 확장하기 위한 함수
            function expandSearchBox() {
                searchBox.addClass("active");
                searchInput.css("width", "360px"); // 확장할 너비 설정
                searchInput.css("padding", "0 40px"); // 확장할 패딩 설정
                searchInput.css("opacity", "1"); // 확장할 때 투명도 설정
            }

            // 로드된 후 일정 시간(여기서는 1000ms 또는 1초) 뒤에 검색 상자를 확장합니다.
            setTimeout(expandSearchBox, 500);
        });
    </script>
	</html>
</main>