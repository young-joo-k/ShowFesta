<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>
<html>
<head>
<%@include file="../includes/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="/resources/css/notice_register.css?after" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>plus</title>
</head>
<body>
	<div class="body">
		<div class="top-padding">
			<div class="wrap" id="g-contents">
				<div class="cs-body">
					<div class="register-top">
						<h4> 컨텐츠 추가 </h4>
					</div>
					<form role="form" action="notice_register" method="post">
						<div class = "register-table-wrap">
							<p class="es-text">
								<span class="es-dot"></span>
							</p>
							<table class="register-table">
								<tbody>
									<tr>
										<th scope="row">
											<span class="es-dot"></span>
											타이틀
										</th>
										<td>
											<input type="text" placeholder="제목을 입력해 주세요." class="isSecurity" maxlength="50" name="b_writer"
												id="b_writer" required>
											<input type ="hidden" id="initialName">
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="es-dot"></span>
											이미지URL
										</th>
										<td>
											<input type="text" placeholder="포스터 이미지 URL을 입력해주세요." class="wil100-per" maxlength="100" name="b_title"
												id="b_title" required>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="es-dot"></span>
											시작날짜
										</th>
										<td>
											<textarea placeholder="시작날짜를 입력해 주세요.(형식: yyyy-MM-dd)" class="will100-per" id="b_content" name="b_content" required></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="es-dot"></span>
											종료날짜
										</th>
										<td>
											<textarea placeholder="종료날짜를 입력해 주세요.(형식: yyyy-MM-dd)" class="will100-per" id="b_content" name="b_content" required></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="es-dot"></span>
											장소
										</th>
										<td>
											<textarea placeholder="장소를 입력해주세요." class="will100-per" id="b_content" name="b_content" required></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="es-dot"></span>
											링크
										</th>
										<td>
											<textarea placeholder="링크를 입력해 주세요." class="will100-per" id="b_content" name="b_content" required></textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="register-btn-wrap">
							<ul>
								<li>
									<input type="submit" class="register-submit" onclick="onSubmit(); return false;" value="등록">
								</li>
								<li>
									<a href="/page/notice_list" onclick="onCancel();" class="register-cancel">취소</a>
								</li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	

});
</script>



</html>