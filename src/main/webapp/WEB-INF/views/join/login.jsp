<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h3 class="panel-title" style="text-align: center;">로그인</h3>
				</div>
				<div class="panel-body">
					<form id='loginpageForm' action="/join/login" method="post">
						<fieldset>
							<div class="form-group">
								<label class="radio-inline"> <input type="radio"
									name="checked" value="0" checked>
									개인
								</label> <label class="radio-inline"> <input type="radio"
									name="checked" value="1"> 사업자
								</label>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="아이디" name="id"
									type="text" autofocus required>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="비밀번호" name="pw"
									type="password" required>
							</div>
							<!-- Change this to a button or input when using this as a form -->
							<button type="submit" class="btn btn-lg btn-success btn-block">로그인</button>
                            <button type="button" id="registerButton" class="btn btn-lg btn-primary btn-block" onclick="location.href='/join/register'">회원가입</button>
                            <button type="button" id="id_findButton" class="btn btn-lg btn-primary btn-block" onclick="location.href='/join/id_find'">아이디찾기</button>
                            <button type="button" id="pw_findButton" class="btn btn-lg btn-primary btn-block" onclick="location.href='/join/pw_find'">비밀번호찾기</button>
                       </fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
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
        
//         var loginpageForm = $("#loginpageForm");
        
// 		$("#registerButton").on("click", function(e) {
// 			e.preventDefault();
// 			loginpageForm.attr("action","/join/register");
// 			loginpageForm.attr("method","get");
// 			loginpageForm.submit();
// 		});
    });
</script>
<%@include file="../includes/footer_user.jsp"%>