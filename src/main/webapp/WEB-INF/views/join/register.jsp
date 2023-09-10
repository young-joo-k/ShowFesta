<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@include file="../includes/header_user.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title" style="text-align: center;">회원가입</h3>
				</div>
				<div class="panel-body">
					<form id="joinForm" action="/join/register" method="post" enctype="multipart/form-data">
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
							<div id ="attachArea" style="display: none;">
								<input type="file" name="file">
							</div>
							<button type="submit" class="btn btn-lg btn-success btn-block">가입하기</button>
							<button type="button" class="btn btn-lg btn-primary btn-block" onclick="location.href='/join/main'">메인</button>
                           
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

        // 회원 유형에 따른 첨부파일 영역 표시/숨김
        $('input[name="checked"]').on('change', function () {
            if ($(this).val() === '1') {
                $('#attachArea').show();
                $('#joinForm').attr('action', '/join/upload');
            } else {
                $('#attachArea').hide();
            }
        });

		// 회원 가입 폼 체크하는 함수
		$('#joinForm').submit(function(){
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
		        phoneError.text('전화번호를 올바른 형식(ex: 01000000000)으로 입력하세요.');
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
