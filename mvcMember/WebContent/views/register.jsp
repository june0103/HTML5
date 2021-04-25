<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body>
<div class="page-main-style">
	<h2>회원가입 완료</h2>
	<jsp:include page="menu.jsp"/>
	<div class="result-display">
		회원가입 성공
		<input type="button" value="메인" onclick="location.href='main.do'">
	</div>
</div>
</body>
</html>