<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>

<head>
<link href="/resources/css/join.css?after" rel="stylesheet">
<%@include file="../includes/header.jsp"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<html>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
</head>
<body>

<body>
	<div class="body">
		<div class="member">
			<div class="join member-layout" id="g-contents">
				<div class="idpw-find">
					<h1 tabindex="0">결과</h1>
				</div>
				<div class="common-box">
					<h3 class="certi-txt02">회원님의 비밀번호는 <span style="color : blue">${message}</span>입니다.</h3>
					<form id="joinForm" action="/find/pw_find" method="post" name="myFrm">
<!-- 						<h3 class="certi-txt02">입니다</h3> -->
						<fieldset>
							<div class="btn-box">
								<div class="btn-purple">
									<a href="login" onclick="onSubmit();">확인</a>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<%--     <h1>비밀번호 찾기 결과</h1>
    
    <p>
        <c:out value="${message}" />
    </p>
    
    <c:if test="${foundPw != null}">
    </c:if>
    
    <p><a href="/join/pw_find">다시 찾기</a></p>
    <p><a href="/join/login">로그인</a></p> --%>
</body>
</html>