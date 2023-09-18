<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link href="/resources/css/mypage.css?after" rel="stylesheet" type="text/css">
</head>
<!-- <body> -->
<!-- 회원정보 수정 눌렀을 때 화면 -->
<div id = "myPage-memberUpdate">
	<div class = "memberUpdate">
		<div class ="memberCorrect-name">
			<h1 class ="memTitle">회원정보 수정</h1>
		</div>
		<table class = "myPage-member">
			<tbody class = "myPage-edit-form">
				<tr class = "myPage-member-info-wrap">
					<th class = "myPage-member-info">아이디</th>
					<td class = "myPage-myInfo"> ${user.getId()}
<!-- 						<span class = "myPage-member-info"></span> -->
<!-- 						<a href="#" onclick="userId" class = "email-edit">이메일 변경하기</a> -->
					</td>
				</tr>
				<tr class = "myPage-member-info-wrap">
					<th class = "myPage-member-info">비밀번호</th>
					<td class = "myPage-myInfo">
						<a href="#" onclick="userPw" class = "phone-edit">비밀번호 변경하기</a>
					</td>
				</tr>
				<tr class = "myPage-member-info-wrap">
					<th class = "myPage-member-info">이름</th>
					<td class = "myPage-myInfo"> ${user.getName()}</td>
				</tr>
				<tr class = "myPage-member-info-wrap">
					<th class = "myPage-member-info">전화번호</th>
					<td class = "myPage-myInfo">
						<label for = "user-phone">
							<input type="text" placeholder="전화번호를 입력해 주세요.(선택)" class = "mypage-input-phone" id = "myPage-user-phone" name = "phone" maxlength="13" value = "${user.getPhone()}">
						</label>
					</td>
				</tr>
				<tr class = "myPage-member-info-wrap">
					<th class = "myPage-member-info">이메일 주소</th>
					<td class = "myPage-myInfo">
						<label for = "user-phone">
							<input type="text" placeholder="이메일을 입력해 주세요.(선택)" class = "mypage-input-email" id = "myPage-user-email" name = "phone" maxlength="200" value = "${user.getEmail() }">
						</label>
					</td>
				</tr>
			</tbody>
		</table>
		<ul class = "myPage-correct-btn">
			<li class ="correct-btn">
				<div class = "correct-btn-cancel">
					<a href ="/page/myPage" class="myPageBack">취소</a>
				</div>
			</li>
			<li class ="correct-btn">
				<div class = "correct-btn-update">
					<a href ="/page/myPage"  class = "correctBtn">수정</a>
				</div>
			</li>
		</ul>
	</div>
</div>
<!-- 회원정보 수정 끝 -->
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
// $(document).ready(function(){
// 	//수정 버튼 눌렀을 때 alert창
// 	$(".correct-btn-update").click(function(e){
// 		e.preventDefault();
// 		alert("수정이 완료되었습니다.");
// 		window.location.href="/page/myPage"
// 	});
// });




// </html>