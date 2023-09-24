<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>SMS 발송</title>
</head>
<body>
	<h1>SMS 발송</h1>
	<form action="/sms/sendSMS" method="post">
		<c:forEach items="${sendList}" var="sms">
			<label for="to">받는 사람 (${sms.name}):</label>
			<input type="text" id="to" name="to" value="${sms.phone}" required>
			<br>
			<label for="subject">제목:</label>
			<input type="text" id="subject" name="subject" required>
			<br>
			<label for="content">내용:</label>
			<textarea id="content" name="content" required>${sms.like_name}티켓팅 시간 5분 전입니다.</textarea>
			<br>
			<br>
			<label for="content">날짜:</label>
			<textarea id="content" name="reserveTime" required>2023-09-26 13:55:00</textarea>
			<br>
			<input type="submit" value="SMS 발송">
			<br>
			<br>
		</c:forEach>
	</form>
</body>
</html>
