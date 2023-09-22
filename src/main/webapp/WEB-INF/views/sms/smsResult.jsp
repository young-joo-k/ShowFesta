<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>SMS 발송 결과</title>
</head>
<body>
	<h1>SMS 발송 결과</h1>
	<c:if test="${not empty error}">
		<p style="color: red;">${error}</p>
	</c:if>
	<c:if test="${not empty result}">
		<p>${result}</p>
	</c:if>
	<a href="/sms/sendSMSForm">다시 SMS 발송하기</a>
</body>
</html>
