<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<h1>로그 아웃</h1>
<%
	session.invalidate();
%>
로그아웃 완료
<br>
<input type="button" value="로그인 검증" onclick="location.href='s04_loginCheck.jsp'">
<input type="button" value="로그인" onclick="location.href='s02_loginForm.jsp'">
</body>
</html>