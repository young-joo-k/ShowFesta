<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/joinheader.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<head>
<link href="/resources/css/join.css?after" rel="stylesheet">
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>
</head>
<body>
	<div class="body">
		<div class="member">
			<div class="join member-layout" id="g-contents">
				<div class="idpw-find">
					<h1 tabindex="0">결과</h1>
				</div>
				<div class="common-box">
					<h3 class="certi-txt02">회원님의 아이디는 <span style="color : blue">${message}</span>입니다.</h3>
					<form id="joinForm" action="/find/id_find" method="post" name="myFrm">
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
<%@include file="../includes/footer.jsp"%>
</html>