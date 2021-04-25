<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body>
<div class="page-main-style">
	<h2>상품 목록</h2>
	<div class="align-right">
		<input type="button" value="상품등록" onclick="location.href='registerForm.do'">
	</div>
	<table>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>등록일</th>
		</tr>
		<c:forEach var="product" items="${list}">
		<tr>
			<td>${product.num}</td>
			<td><a href="detail.do?num=${product.num}">${product.name}</a></td>
			<td>${product.price}</td>
			<td>${product.reg_date}</td>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>