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
					<div class = "myPage-name">님 마이페이지 입니다.</div>
					<div class = "myPage-update">회원정보 수정</div>
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


<!-- 즐겨찾기 버튼 눌렀을 때 띄워줄 내용 즐겨찾기에서 사용할 예정 -->
<div class = "my-like-content">
	<div class = "my-contetnt-wrap">
<%-- 		<c:choose> --%>
<%-- 			<c:when test = "${empty likeInfo} "> --%>
<!-- 				<div class = "no-like-message"> -->
<!-- 					<p class = "no-like-message">즐겨찾기 하신 내용이 없습니다.</p> -->
<!-- 				</div> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<c:forEach var = "myLike" items="${likeInfo }"> --%>
<!-- 					<div class = "like-list-wrap"> -->
<%-- 						<a style="cursor:pointer;" href='/page/musical_info?m_num= <c:out value = "${myLike.type}"/>'></a>					 --%>
<%-- 						<img class = "comImg" src = <c:out value = "${myLike.m_img}"/>> --%>
<%-- 						<div class = "like-list-title">${myLike.type}</div> --%>
<!-- 					</div> -->
<%-- 				</c:forEach> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
	</div>
</div>

<!-- 문의내역 눌렀을 때 나타날 내용 -->
<div class = "myPqge-qna-wrap">
	<div class = "myPage-qna-space">
		<div class = "myPage-qna-button-wrap">
			<button type = "button" class = "myPage-qna-button">
				<a href = "#">문의하기</a>
			</button>
		</div>
		<!-- 문의내용 있을 경우 들어갈 공간임 -->
		<div class = "myPage-qna-list">
			<div class = "myQna">
				<h1>여기에 문의사항이 있으면 넣어 줄거야</h1>
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


<!-- 회원정보 수정 눌렀을 때 화면 -->
<div class = "memberCorrect">
	<div class = "member-correct">
	</div>


</div>

</body>
</html>