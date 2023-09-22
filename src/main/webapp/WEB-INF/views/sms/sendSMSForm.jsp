<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>SMS 발송</title>
</head>
<body>
    <h1>SMS 발송</h1>
    <form action="/sms/sendSMS" method="post">
        <label for="to">받는 사람:</label>
        <input type="text" id="to" name="to" required><br>
        <label for="subject">제목:</label>
        <input type="text" id="subject" name="subject" required><br>
        <label for="content">내용:</label>
        <textarea id="content" name="content" required></textarea><br>
        <input type="submit" value="SMS 발송">
    </form>
</body>
</html>
