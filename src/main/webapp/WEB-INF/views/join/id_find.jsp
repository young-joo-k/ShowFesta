<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/joinheader.jsp"%>
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
					<form id="joinForm" action="/join/id_find" method="post" name="myFrm">
						<fieldset>
							<div class="join-input-box modify-input-box">
								<ul>
									<li><label for="user-name"> <input type="text"
											placeholder="이름" class="input-style01" name="name"
											id="user-name" required>
									</label></li>
									<li><label for="user-phone"> <input type="text"
											placeholder="휴대폰 번호(번호만 입력)" class="input-style01"
											name="phone" id="user-phone">
									</label></li>
									<li><label for="user-email"> <input type="text"
											placeholder="이메일 주소" class="input-style01" name="email"
											id="user-email">
									</label></li>
								</ul>
							</div>
							<div class="btn-box">
								<div class="btn-purple">
<!-- 									<input type="submit" class="find_submit" value="로그인"> -->
									<a href="#" id = "id_find_btn">확인</a>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {

        $("#joinForm").submit(function(event) {
            var name = $("#user-name").val();
            var phone = $("#user-phone").val();
            var email = $("#user-email").val();

            if (name === '') {
                alert('이름을 입력하세요.');
                event.preventDefault();
                return;
            }

            if (phone === '') {
                alert('전화번호를 입력하세요.');
                event.preventDefault();
                return;
            }

            if (email === '') {
                alert('이메일을 입력하세요.');
                event.preventDefault();
                return;
            }

        });
        
        $("#id_find_btn").on("click", function(event) {
            event.preventDefault(); // 링크의 기본 동작을 막습니다.
            $("#joinForm").submit(); // 폼 제출
        });
    });
</script>
</body>
	<%@include file="../includes/footer_user.jsp"%>