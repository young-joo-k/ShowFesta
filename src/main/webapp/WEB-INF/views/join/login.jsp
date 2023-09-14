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
							<input type="submit" class="login-submit" onclick="onSubmit(); return false;" value="로그인">
								<!-- <button type="submit" id="loginBtn">로그인</button> -->
						</div>
					</fieldset>
				</form>
				<ul class="join-find">
					<li><a href="id_find">아이디 찾기</a></li>
					<li><a href="pw_find">비밀번호 찾기</a></li>
					<li><a href="register">회원가입</a></li>
				</ul>
			</div>
		</div>
	</main>
<!--  <div class="container"> -->
<!-- 	<div class="row"> -->
<!-- 		<div class="col-md-4 col-md-offset-4"> -->
<!-- 			<div class="login-panel panel panel-default"> -->
<!-- 				<div class="panel-heading"> -->
<!-- 					<h3 class="panel-title" style="text-align: center;">로그인</h3> -->
<!-- 				</div> -->
<!-- 				<div class="panel-body"> -->
<!-- 					<form id='loginpageForm' action="/join/login" method="post"> -->
<!-- 						<fieldset> -->
<!-- 							<div class="form-group"> -->
<!-- 								<label class="radio-inline"> <input type="radio" -->
<!-- 									name="checked" value="0" checked> -->
<!-- 									개인 -->
<!-- 								</label> <label class="radio-inline"> <input type="radio" -->
<!-- 									name="checked" value="1"> 사업자 -->
<!-- 								</label> -->
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<input class="form-control" placeholder="아이디" name="id" -->
<!-- 									type="text" autofocus required> -->
<!-- 							</div> -->
<!-- 							<div class="form-group"> -->
<!-- 								<input class="form-control" placeholder="비밀번호" name="pw" -->
<!-- 									type="password" required> -->
<!-- 							</div> -->
<!-- 							Change this to a button or input when using this as a form -->
<!-- 							<button type="submit" class="btn btn-lg btn-success btn-block">로그인</button> -->
<!--                             <button type="button" id="registerButton" class="btn btn-lg btn-primary btn-block" onclick="location.href='/join/register'">회원가입</button> -->
<!--                             <button type="button" id="id_findButton" class="btn btn-lg btn-primary btn-block" onclick="location.href='/join/id_find'">아이디찾기</button> -->
<!--                             <button type="button" id="pw_findButton" class="btn btn-lg btn-primary btn-block" onclick="location.href='/join/pw_find'">비밀번호찾기</button> -->
<!--                        </fieldset> -->
<!-- 					</form> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->
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
        
        $("#loginBtn").click(function (event) {
//             event.preventDefault();

            var id = $("#id").val();
            var pw = $("#pw").val();

            $.post("/join/login", { id: id, pw: pw }, function (data) {
            });
        });
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