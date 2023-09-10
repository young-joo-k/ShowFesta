<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../includes/header_user.jsp"%>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ShowFesta</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS Files -->
  <link href="/resources/assets/css/variables.css" rel="stylesheet">
  <link href="/resources/assets/css/main.css" rel="stylesheet">
</head>

<body>

  <!-- ======= Header ======= -->
<header id="header" class="header d-flex align-items-center fixed-top">
  <div class="container-fluid text-center"> <!-- 중앙 정렬 -->
    <a href="/join/main" class="logo d-flex align-items-center" style="margin-top: 100px;">
      <!-- Uncomment the line below if you also wish to use an image logo -->
      <!-- <img src="/resources/assets/img/logo.png" alt=""> -->
      <h1>ShowFesta</h1>
    </a>
  </div>
</header><!-- End Header -->
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title" style="text-align: center;">비밀번호 찾기</h3>
				</div>
				<div class="panel-body">
					<form id="joinForm" action="/join/pw_find" method="post">
						<fieldset>
							<div class="form-group">
								<label class="radio-inline"> <input type="radio"
									name="checked" value=0 checked> 개인
								</label> <label class="radio-inline"> <input type="radio"
									name="checked" value=1> 사업자
								</label>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="아이디" name="id" id="id"
									type="text" autofocus>
								<div id="idError" style="color: red;"></div>
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
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
</script>
<%@include file="../includes/footer_user.jsp"%>
