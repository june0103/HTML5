<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body>
<div class="page-main-style">
	<h2>상품 상세</h2>
	<ul>
		<li>상품번호 : ${productVO.num}</li>
		<li>상품명 : ${productVO.name}</li>
		<li>가격 : ${productVO.price}</li>
		<li>재고 : ${productVO.stock}</li>
		<li>원산지 : ${productVO.origin}</li>
	</ul>
	<hr size="1" noshade="noshade" width="100%">
	<p>
		${productVO.content}
	</p>
	<div class="align-right">
		작성일 : ${productVO.reg_date}
		<input type="button" value="수정" onclick="location.href='modifyForm.do?num=${productVO.num}'">
		<input type="button" value="삭제" onclick="location.href='deleteForm.do?num=${productVO.num}'">
		<input type="button" value="목록" onclick="location.href='list.do'">
	</div>
</div>
</body>
</html>