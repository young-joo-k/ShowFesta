<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>

<!DOCTYPE html>
<head>
<link href="/resources/css/join.css?after" rel="stylesheet">

  <meta content="" name="description">
  <meta content="" name="keywords">

</head>

<body>

	<div class="body">
		<div class="member">
			<div class="join member-layout" id="g-contents">
				<div class="idpw-find">
					<h1 tabindex="0">비밀번호 찾기</h1>
				</div>
				<div class="common-box">
					<h3 class="certi-txt02">아래 정보를 입력해 주세요</h3>
					<form id="joinForm" action="/find/id_find" method="post" name="myFrm">
						<fieldset>
							<div class="join-input-box modify-input-box">
								<ul>
									<li><label for="user-id"> <input type="text"
											placeholder="아이디" class="input-style01" name="userId"
											id="user-id" required>
									</label></li>
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


<!-- <script>
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
		    var id = $('#id').val();
		    var name = $('#name').val();
		    var phone = $('#phone').val();
		    var email = $('#email').val();
		    var nameError = $('#nameError');
		    var phoneError = $('#phoneError');
		    var emailError = $('#emailError');
		    
		    // 아이디 유효성 검사
		    if (id === '') {
		        idError.text('아이디를 입력하세요.');
		    } else {
		        idError.text('');
		    }

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
<%@include file="../includes/footer_user.jsp"%>
