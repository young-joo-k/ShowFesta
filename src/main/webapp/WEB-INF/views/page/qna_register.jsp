<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				<div class="cs-body" style="border-radius: 18px;">
					<div class="register-top">
						<h4>1:1 문의</h4>
					</div>
					<form role="form" action="qna_register" method="post">
						<div class="register-table-wrap">
							<p class="es-text">
								<span class="es-dot"></span>
							</p>
							<table class="register-table">
								<tbody class=qna_register>
									<tr>
										<th scope="row"><span class="es-dot"></span> 이름</th>
										<td><input type="hidden" id="id" name="id"
											value="<%= session.getAttribute("id") %>"> <input
											type="text"
											class="isSecurity" maxlength="50" name="b_writer"
											id="b_writer" value="구구팔하나" required> <input type="hidden"
											id="initialName"></td>
									</tr>
									<tr>
										<th scope="row"><span class="es-dot"></span> 제목</th>
										<td><input type="text" 
											class="wil100-per" maxlength="100" name="b_title"
											id="b_title" value="쇼페스타 이용문의 입니다." required></td>
									</tr>
									<tr>
										<th scope="row"><span class="es-dot"></span> 내용</th>
										<td><textarea 
												class="register-table-textarea03" id="b_content"
												name="b_content" required>운영시간 궁금합니다.</textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="register-btn-wrap">
							<ul>
								<li><input type="submit" class="register-submit"
									onclick="onSubmit(); return false;" value="등록"></li>
								<li><a href="/page/user_qna" onclick="onCancel();"
									class="register-cancel">취소</a></li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<footer>
<%@include file="../includes/footer.jsp"%>
</footer>
</html>
