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
					<div class = "myPage-name"> ${user.getId()}님 마이페이지 입니다.(관리자)</div>
<!-- 					<a class = "myPage-update" href="/page/memberUpdate">회원정보 수정</a> -->

				</div>
			</article>
		</section>
		<section class = "myPage-body">
			<article class = "myPage-content-wrap">
				<div class = "myPage-menu">					
					<div class = "myPage-menu-wrapper">
						<div class = "mypage-contents">
							<button class = "notice-contents">공지사항관리</button>
						</div>
						<div class = "mypage-contents">
							<button class = "admin-qna-contents">문의내용</button>
						</div>
						<div class = "mypage-contents">
							<button class = "admin-content-list">컨텐츠관리</button>
						</div>
						<div class = "mypage-contents">
							<button class = "admin-user-manager">사용자 관리</button>
						</div>
					</div>
				</div>
			</article>
		</section>
	</div>


<!-- 공지사항 관리 화면 -->
<div class="admin-notice">
    <div class="admin-content-wrap">
        <c:choose>
            <c:when test="${empty notice_list}">
                <div class="no-like-message">
                    <p class="no-like-message">공지사항 내용이 없습니다.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="notice" items="${notice_list}">
                    <div class="myPage-qna-wrap">
                        <div class="myPage-qna-space">
                            <div class="myPage-qna-button-wrap">
                                <button type="button" class="myPage-qna-button">
                                    <a href="/page/notice_list" class="question">공지사항</a>
                                </button>
                            </div>
                            <div class="myPage-qna-list">
                                <div class="myQna">
                                    <h1>공지사항 내용을 띄워줍니다.</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- 공지사항 -->

<!-- 문의내역 눌렀을 때 나타날 내용 -->
<div class="admin-qna">
    <div class="admin-content-wrap">
        <c:choose>
            <c:when test="${empty notice_list}">
                <div class="no-like-message">
                    <p class="no-like-message">문의내용이 없습니다.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="notice" items="${notice_list}">
                    <div class="myPage-qna-wrap">
                        <div class="myPage-qna-space">
                            <div class="myPage-qna-button-wrap">
                                <button type="button" class="myPage-qna-button">
                                    <a href="/page/user_qna" class="question">문의사항</a>
                                </button>
                            </div>
                            <div class="myPage-qna-list">
                                <div class="myQna">
                                    <h1>문의사항 내용을 띄워줍니다.</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- 문의내역 끝 -->

<!-- 컨텐츠관리 눌렀을 때 나타날 내용 -->
<div class="admin-content-manage">
    <div class="admin-content-wrap">
        <c:choose>
            <c:when test="${empty notice_list}">
                <div class="no-like-message">
                    <p class="no-like-message">컨텐츠내용이 없습니다.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="notice" items="${notice_list}">
                    <div class="myPage-qna-wrap">
                        <div class="myPage-qna-space">
                            <div class="myPage-qna-button-wrap">
                                <button type="button" class="myPage-qna-button">
                                    <a href="/page/user_qna" class="question">문의사항</a>
                                </button>
                            </div>
                            <div class="myPage-qna-list">
                                <div class="myQna">
                                    <h1>컨텐츠 관리 내용을 띄워줍니다.</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- 컨텐츠관리 끝 -->

<!-- 사용자 관리 -->
<div class="admin-user-manage">
    <div class="admin-content-wrap">
        <c:choose>
            <c:when test="${empty notice_list}">
                <div class="no-like-message">
                    <p class="no-like-message">회원이 없습니다.</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="notice" items="${notice_list}">
                    <div class="myPage-qna-wrap">
                        <div class="myPage-qna-space">
                            <div class="admin-user-list">
                                <div class="userList">
                                    <h1>회원정보를 띄워줍니다.</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<!-- 사용자 관리 끝 -->

	
	



<%@include file="../includes/footer.jsp"%>

</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    // 기본 화면 설정
    $(".admin-notice").show();
    $(".admin-qna").hide();
    $(".admin-content-manage").hide();
    $(".admin-user-manage").hide();
    
    $(".notice-contents").click(function(){
        // 공지사항 관리 버튼 클릭 시
        $(".admin-notice").show();
        $(".admin-qna").hide();
        $(".admin-content-manage").hide();
        $(".admin-user-manage").hide();
    });
    
    $(".admin-qna-contents").click(function(){
        // 문의내용 버튼 클릭 시
        $(".admin-notice").hide();
        $(".admin-qna").show();
        $(".admin-content-manage").hide();
        $(".admin-user-manage").hide();
    });
    
    $(".admin-content-list").click(function(){
        // 컨텐츠 관리 버튼 클릭 시
        $(".admin-notice").hide();
        $(".admin-qna").hide();
        $(".admin-content-manage").show();
        $(".admin-user-manage").hide();
    });
    
    $(".admin-user-manager").click(function(){
        // 사용자 관리 버튼 클릭 시
        $(".admin-notice").hide();
        $(".admin-qna").hide();
        $(".admin-content-manage").hide();
        $(".admin-user-manage").show();
    });
});
</script>










<!-- </html> -->