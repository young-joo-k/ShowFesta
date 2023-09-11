<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<!DOCTYPE html>
<head>
<link href="/resources/css/join.css?after" rel="stylesheet">
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ShowFesta</title>

</head>

<body>
	<div class="body">
		<div class="member">
			<div class="join member-layout" id="g-contents">
				<div class="idpw-find">
					<h1 tabindex="0">아이디 찾기</h1>
				</div>
				<div class="common-box">
					<h3 class="certi-txt02">아래 정보를 입력해 주세요</h3>
					<form id="joinForm" action="/find/id_find" method="post" name="myFrm">
						<fieldset>
							<div class="join-input-box modify-input-box">
								<ul>
									<li><label for="user-name"> <input type="text"
											placeholder="이름" class="input-style01" name="userName"
											id="user-name" required>
									</label></li>
									<li><label for="user-phone"> <input type="text"
											placeholder="휴대폰 번호(번호만 입력)" class="input-style01"
											name="findInfo" id="user-phone">
									</label></li>
									<li><label for="user-email"> <input type="text"
											placeholder="이메일 주소" class="input-style01" name="findinfo"
											id="user-email">
									</label></li>
								</ul>
							</div>
							<div class="btn-box">
								<div class="btn-purple">
									<a href="id_find_result" onclick="onSubmit();">확인</a>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- <div class="container">
	<div class="row" style="margin-top: 0px;">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title" style="text-align: center;">아이디 찾기</h3>
				</div>
				<div class="panel-body">
					<form id="joinForm" action="/join/id_find" method="post">
						<fieldset>
							<div class="form-group">
								<label class="radio-inline"> <input type="radio"
									name="checked" value=0 checked> 개인
								</label> <label class="radio-inline"> <input type="radio"
									name="checked" value=1> 사업자
								</label>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="이름" name="name"
									id="name" type="text">
								<div id="nameError" style="color: red;"></div>
							</div>
							<div class="form-group">
								<input class="form-control"
									placeholder="전화번호 (ex: 010-0000-0000)" name="phone" id="phone"
									type="tel">
								<div id="phoneError" style="color: red;"></div>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="이메일" name="email"
									id="email" type="email">
								<div id="emailError" style="color: red;"></div>
							</div>
							<button type="submit" class="btn btn-lg btn-success btn-block">찾기</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div> -->

<!-- 	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
	$(document).ready(function() {
		
        var result = '<c:out value="${result}"/>';

        checkAlert(result);

        history.replaceState({}, null, null);

        function checkAlert(result) {
            if (result === '' || history.state) {
                return;
            }
            alert(result);
        }

		// 회원 가입 폼 체크하는 함수
		$('#joinForm').submit(function(){
		    var name = $('#name').val();
		    var phone = $('#phone').val();
		    var email = $('#email').val();
		    var nameError = $('#nameError');
		    var phoneError = $('#phoneError');
		    var emailError = $('#emailError');

		    // 이름 유효성 검사
		    if (name === '') {
		        nameError.text('이름을 입력하세요.');
		    } else {
		        nameError.text('');
		    }

		    // 전화번호 유효성 검사 (정규 표현식 사용)
		    var phoneCheck = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
		    if (!phoneCheck.test(phone)) {
		        phoneError.text('전화번호를 올바른 형식(ex: 010-0000-0000)으로 입력하세요.');
		    } else {
		        phoneError.text('');
		    }

		    // 이메일 유효성 검사
		    var emailCheck = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		    if (!emailCheck.test(email)) {
		        emailError.text('이메일을 올바른 형식(ex: example@example.com)으로 입력하세요.');
		    } else {
		        emailError.text('');
		    }

		    // 공백 체크 및 메시지 출력
		    if (id === '' || pw === '' || name === '' || !phoneCheck.test(phone) || !emailCheck.test(email)) {
		        return false;
		    }
		    return true;
		});
	});
</script> -->
</body>
	<%@include file="../includes/footer_user.jsp"%>