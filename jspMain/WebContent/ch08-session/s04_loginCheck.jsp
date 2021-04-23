<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 여부 검사</title>
</head>
<body>
<%
	String userId = (String)session.getAttribute("userId");
	if(userId!=null){
		%>
		아이디 [<%= userId %>] 로그인 상태<br>
		<input type="button" value="로그아웃" onclick="location.href='s05_logout.jsp'">
		<%
	}else{
		%>
		로그인하지 않은 상태
		<br>
		<input type="button" value="로그인" onclick="location.href='s02_loginForm.jsp'">
		<%
	}
%>
</body>
</html>