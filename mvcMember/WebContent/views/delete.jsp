<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == true}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 완료</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body>
<div class="align-center">
	<h2>회원탈퇴 완료</h2>
	<jsp:include page="menu.jsp"/>
	<div class="result-display">
		회원탈퇴 완료
		<input type="button" value="메인" onclick="location.href='main.do'">
	</div>
</div>
</body>
</html>
</c:if>
<c:if test="${check == false}">
	<script>
		alert('비밀번호가 틀렸습니다');
		history.go(-1);
	</script>
</c:if>