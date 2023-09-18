<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<link href="/resources/css/join.css?after" rel="stylesheet">
<link href="/resources/css/notice_register.css?after" rel="stylesheet">
<body>
	<!-- ======= Header ======= -->

	<main class="member">
		<div class="login member-layout">
			<h1 tabindex="0">회원가입</h1>
			<div class="join-sns-box">
				<form id='joinForm' action="/join/register" method="post">
					<fieldset>
						<legend>회원가입 양식</legend>
						<ul class="input-wrap01">
							<li><label> <input type="text" placeholder="아이디"
									title="아이디" class="input-style01" id="id" name="id">
							</label></li>
							<li><label> <input type="password"
									placeholder="비밀번호" title="비밀번호" class="input-style01" id="pw"
									name="pw">
							</label></li>
							<li><label> <input type="text" placeholder="이름"
									title="이름" class="input-style01" id="name" name="name">
							</label></li>
							<li><label> <input type="tel" placeholder="전화번호 ( - 제외)"
									title="전화번호" class="input-style01" id="phone" name="phone">
							</label></li>
							<li><label> <input type="email" placeholder="이메일"
									title="이메일" class="input-style01" id="email" name="email">
							</label></li>
						</ul>
						<div class="btn-purple">
							<button type="submit" class="btn btn-lg btn-success btn-block">가입하기</button>
							<button type="button" class="btn btn-lg btn-primary btn-block"
								onclick="location.href='/page/main'">메인</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</main>
	<!-- <div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title" style="text-align: center;">회원가입</h3>
				</div>
				<div class="panel-body">
					<form id="joinForm" action="/join/register" method="post">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="아이디" name="id" id="id"
									type="text" autofocus>
								<div id="idError" style="color: red;"></div>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="비밀번호" name="pw" id="pw"
									type="password" value="" >
								<div id="pwError" style="color: red;"></div>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="이름" name="name"
									id="name" type="text">
								<div id="nameError" style="color: red;"></div>
							</div>
							<div class="form-group">
								<input class="form-control"
									placeholder="전화번호 ( - 제외)" name="phone" id="phone"
									type="tel">
								<div id="phoneError" style="color: red;"></div>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="이메일" name="email"
									id="email" type="email">
								<div id="emailError" style="color: red;"></div>
							</div>
							<button type="submit" class="btn btn-lg btn-success btn-block">가입하기</button>
							<button type="button" class="btn btn-lg btn-primary btn-block" onclick="location.href='/join/main'">메인</button>
                           
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div> -->
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(document)
			.ready(
					function() {

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
						$('#joinForm')
								.submit(
										function() {
											var id = $('#id').val();
											var pw = $('#pw').val();
											var name = $('#name').val();
											var phone = $('#phone').val();
											var email = $('#email').val();
											var idError = $('#idError');
											var pwError = $('#pwError');
											var nameError = $('#nameError');
											var phoneError = $('#phoneError');
											var emailError = $('#emailError');

											// 아이디 유효성 검사
											if (id === '') {
												idError.text('아이디를 입력하세요.');
											} else {
												idError.text('');
											}

											// 비밀번호 유효성 검사
											if (pw === '') {
												pwError.text('비밀번호를 입력하세요.');
											} else {
												pwError.text('');
											}

											// 이름 유효성 검사
											if (name === '') {
												nameError.text('이름을 입력하세요.');
											} else {
												nameError.text('');
											}

											// 전화번호 유효성 검사 (정규 표현식 사용)
											var phoneCheck = /^[0-9]{3}[0-9]{4}[0-9]{4}$/;
											if (!phoneCheck.test(phone)) {
												phoneError
														.text('전화번호를 올바른 형식(ex: 01000000000)으로 입력하세요.');
											} else {
												phoneError.text('');
											}

											// 이메일 유효성 검사
											var emailCheck = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
											if (!emailCheck.test(email)) {
												emailError
														.text('이메일을 올바른 형식(ex: example@example.com)으로 입력하세요.');
											} else {
												emailError.text('');
											}

											// 공백 체크 및 메시지 출력
											if (id === '' || pw === ''
													|| name === ''
													|| !phoneCheck.test(phone)
													|| !emailCheck.test(email)) {
												return false;
											}
											return true;
										});
					});
</script>
<%-- <%@include file="../includes/footer_user.jsp"%> --%>
