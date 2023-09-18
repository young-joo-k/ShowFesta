<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>마이페이지</title>
<link href="/resources/css/mypage.css?after" rel="stylesheet" type="text/css">
</head>
<!-- <body> -->
	<div id = "myPage-wrap">
		<section class = "mypage">
			<article class = "myPage-profile">
				<div class = "myPage-img">
					<picture class = "myPage-img-select">
						<source srcset = "#"></source>
						<img src="#">
					</picture>			
				</div>
				<div class = "myPage-info">
					<div class = "myPage-name"> ${user.getId()}님 마이페이지 입니다.</div>
					<a class = "myPage-update" href="/page/memberUpdate">회원정보 수정</a>

				</div>
			</article>
		</section>
		<section class = "myPage-body">
			<article class = "myPage-content-wrap">
				<div class = "myPage-menu">					
					<div class = "myPage-menu-wrapper">
						<div class = "mypage-contents">
							<button class = "like-contents">즐겨찾기(컨텐츠)</button>
						</div>
						<div class = "mypage-contents">
							<button class = "like-actor">즐겨찾기(배우)</button>
						</div>
						<div class = "mypage-contents">
							<button class = "myPage-qna">문의내역</button>
						</div>
					</div>
				</div>
			</article>
		</section>
	</div>


<<<<<<< HEAD
	<!-- 즐겨찾기 버튼 눌렀을 때 띄워줄 내용 즐겨찾기에서 사용할 예정 -->
	<div class = "my-like-content">
		<div class = "my-contetnt-wrap">
			<c:choose>
				<c:when test = "${empty likeInfo} ">
					<div class = "no-like-message">
						<p class = "no-like-message">즐겨찾기 하신 내용이 없습니다.</p>
=======
<!-- 즐겨찾기 버튼 눌렀을 때 띄워줄 내용 즐겨찾기에서 사용할 예정 -->
<div class = "my-like-content">
	<div class = "my-contetnt-wrap">
		<c:choose>
			<c:when test = "${empty likeInfo} ">
				<div class = "no-like-message">
					<p class = "no-like-message">즐겨찾기 하신 내용이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach var = "myLike" items="${likeInfo }">
					<div class = "like-list-wrap">
<%-- 						<a style="cursor:pointer;" href='/page/musical_info?m_num= <c:out value = "${myLike.like_type}"/>'></a>					 --%>
						<img class = "comImg" src = <c:out value = "${myLike.like_img}"/>>
						<div class = "like-list-title">${myLike.like_type}</div>
>>>>>>> 6d87f2b237dddaba08299e980260eefca27d3c4e
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var = "myLike" items="${likeInfo }">
						<div class = "like-list-wrap">
							<a style="cursor:pointer;" href='/page/musical_info?m_num= <c:out value = "${myLike.type}"/>'></a>					
							<img class = "comImg" src = <c:out value = "${myLike.m_img}"/>>
							<div class = "like-list-title">${myLike.type}</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 즟겨찾기 끝 -->
	
	<!-- 즐겨찾기 버튼 눌렀을 때 띄워줄 내용 배우 즐겨찾기 -->
	<div class = "my-like-actor">
		<div class = "my-actor-wrap">
			<c:choose>
				<c:when test = "${empty likeInfo} ">
					<div class = "no-like-message">
						<p class = "no-like-message">즐겨찾기 하신 내용이 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach var = "myLike" items="${likeInfo }">
						<div class = "like-list-wrap">
							<a style="cursor:pointer;" href='/page/musical_info?m_num= <c:out value = "${myLike.type}"/>'></a>					
							<img class = "comImg" src = <c:out value = "${myLike.m_img}"/>>
							<div class = "like-list-title">${myLike.type}</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- 즟겨찾기 끝 -->

	<!-- 문의내역 눌렀을 때 나타날 내용 -->
	<div class = "myPage-qna-wrap">
		<div class = "myPage-qna-space">
			<div class = "myPage-qna-button-wrap">
				<button type = "button" class = "myPage-qna-button">
					<a href = "/page/user_qna" class = "question">문의하기</a>
				</button>
			</div>
			<!-- 문의내용 있을 경우 들어갈 공간임 -->
			<div class = "myPage-qna-list">
				<div class = "myQna">
					<h1>문의사항이 있으면 내용을 넣어 줄 예정입니다.</h1>
			</div>
		</div>
		</div>
		
		<div class = "myPage-notice">
			<h3>알아두세요!</h3>
			<ul class = "myPage-ul">
				<li class = "myPage-li">
					- 문의 사항은 상황에 따라 답변이 지연될 수 있습니다.
				</li>
			</ul>
		</div>
	</div>
	<!-- 문의내역 끝 -->



<%@include file="../includes/footer.jsp"%>

</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    // 기본 화면 설정
    $(".my-like-actor").hide();
    $(".myPage-qna-wrap").hide();

    $(".like-contents").click(function(){
        // 즐겨찾기(컨텐츠) 버튼 클릭 시
        $(".my-like-content").show(); // my-like-content를 보이게 함
        $(".my-like-actor").hide(); // my-like-actor를 숨김
        $(".myPage-qna-wrap").hide(); // myPage-qna-wrap을 숨김
    });
    
    $(".like-actor").click(function(){
        // 즐겨찾기(배우) 버튼 클릭 시
        $(".my-like-content").hide(); // my-like-content를 숨김
        $(".my-like-actor").show(); // my-like-actor를 보이게 함
        $(".myPage-qna-wrap").hide(); // myPage-qna-wrap을 숨김
    });
    
    $(".myPage-qna").click(function(){
        // 문의내역 버튼 클릭 시
        $(".my-like-content").hide(); // my-like-content를 숨김
        $(".my-like-actor").hide(); // my-like-actor를 숨김
        $(".myPage-qna-wrap").show(); // myPage-qna-wrap을 보이게 함
    });
});
</script>
이렇게 하면 my-like-content가 기본 화면으로 띄워지며, like-actor나 myPage-qna 버튼을 클릭할 때 각각 해당 화면만 표시되고 나머지는 숨겨집니다.









<!-- </html> -->