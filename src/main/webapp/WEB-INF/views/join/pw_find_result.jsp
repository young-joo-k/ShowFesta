<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix ="fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
</head>
<body>
    <h1>비밀번호 찾기 결과</h1>
    
    <p>
        <%-- 결과 메시지를 표시합니다. --%>
        <c:out value="${message}" />
    </p>
    
    <%-- 아이디를 표시합니다. --%>
    <c:if test="${foundPw != null}">
    </c:if>
    
    <p><a href="/join/pw_find">다시 찾기</a></p>
    <p><a href="/join/login">로그인</a></p>
</body>
</html>