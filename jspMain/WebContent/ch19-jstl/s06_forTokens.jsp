<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forTokens 태그</title>
</head>
<body>
<h4>구분자를 이용해서 문자열 잘라내기</h4>
<c:forTokens var="token" items="빨강생,주황색,노란색,초록색,파랑색,남색,보라색" delims=",">
	${token}<br>
</c:forTokens>

<h4>여러개의 구분자 사용</h4>
<c:forTokens var="now" items="2021-03-24 12:43:30" delims="- :">
	${now}<br>
</c:forTokens>
</body>
</html>