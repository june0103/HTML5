<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품삭제</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body>
<div class="page-main-style">
	<h2>상품삭제</h2>
	<form id="delete_form" action="delete.do" method="post">
		<input type="hidden" name="num" value="${num}">
		<div class="align-center">
			<input type="submit" value="삭제">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form>
</div>
</body>
</html>