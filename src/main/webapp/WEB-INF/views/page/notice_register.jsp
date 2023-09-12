<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/css/join.css?after" rel="stylesheet">
<link href="/resources/css/notice_list.css?after" rel="stylesheet">
<link href="/resources/css/notice_register.css?after" rel="stylesheet">
</head>
<body>
	<div class="body">
		<div class="top-padding">
			<div class="wrap" id="g-contents">
				<div class="cs-body">
					<div class="register-top">
						<h4> 공지사항 작성 </h4>
					</div>
					<form role="form" action="notice_register" method="post">
						<div class = "register-table-wrap">
							<p class="es-text">
								<span class="es-dot"></span>
							</p>
							<table class="register-table">
								<caption class="blind">공지사항 작성 </caption>
								<colgroup>
									<col width="280">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
											<span class="es-dot"></span>
											이름
										</th>
										<td>
											<input type="text" placeholder="이름을 입력해 주세요.(특수문자 입력 불가)" class="isSecurity" maxlength="50" name="b_writer"
												id="b_writer" required>
											<input type ="hidden" id="initialName">
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="es-dot"></span>
											제목
										</th>
										<td>
											<input type="text" placeholder="공지사항 제목을 입력해 주세요." class="wil100-per" maxlength="100" name="b_title"
												id="b_title" required>
										</td>
									</tr>
									<tr>
										<th scope="row">
											<span class="es-dot"></span>
											내용
										</th>
										<td>
											<textarea placeholder="공지사항 내용을 입력해 주세요." class="register-table-textarea03" id="b_content" name="b_content" required></textarea>
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
									<a href="/notice_list" onclick="onCancel();" class="register-cancel">취소</a>
								</li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>