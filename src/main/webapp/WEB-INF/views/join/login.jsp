<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<!DOCTYPE html>
<head>
<link href="/resources/css/join.css?after" rel="stylesheet">
<link href="/resources/css/notice_register.css?after" rel="stylesheet">
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>ShowFesta</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

</head>

<body>

  <!-- ======= Header ======= -->

	<main class="member">
		<div class="login member-layout">
			<h1 tabindex="0">로그인</h1>
			<div class="join-sns-box">
				<form id='loginpageForm' action="/join/login" method="post">
					<fieldset>
						<legend>로그인 양식</legend>
						<ul class="input-wrap01">
							<li><label> <input type="text" placeholder="아이디"
									title="아이디" class="input-style01" id="id" name = "id">
							</label></li>
							<li><label> <input type="password"
									placeholder="비밀번호" title="비밀번호" class="input-style01" id="pw" name = "pw">
							</label></li>
						</ul>
						<div class="btn-purple btn-purple-dark">
							<!-- <a href="#" title="로그인">로그인</a>  -->
							<input type="submit" class="login-submit" value="로그인">
								<!-- <button type="submit" id="loginBtn">로그인</button> -->
						</div>
					</fieldset>
				</form>
				<ul class="join-find">
					<li><a href="/join/id_find">아이디 찾기</a></li>
					<li><a href="/join/pw_find">비밀번호 찾기</a></li>
					<li><a href="/join/register">회원가입</a></li>
				</ul>
			</div>
		</div>
	</main>
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
        
        $("#loginpageForm").submit(function(event) {
            var id = $("#id").val();
            var pw = $("#pw").val();

            if (id === '') {
                alert('아이디를 입력하세요.');
                event.preventDefault();
                return;
            }

            if (pw === '') {
                alert('비밀번호를 입력하세요.');
                event.preventDefault();
                return;
            }
            
        });
    });
</script>
<%@include file="../includes/footer_user.jsp"%>