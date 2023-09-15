<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>마아페이지</title>
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
			</article>
		</section>
	</div>


<!-- 즐겨찾기 버튼 눌렀을 때 띄워줄 내용 -->
<div class = "my-like-content">
	<div class = "my-contetnt-wrap">
		<c:choose>
			<c:when test = "${empty } ">
				
			</c:when>
			<c:otherwise>
			
			</c:otherwise>
		</c:choose>
	</div>
</div>


</body>
</html>