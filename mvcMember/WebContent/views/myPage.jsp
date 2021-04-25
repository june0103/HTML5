<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body>
<div class="page-main-style">
	<h2>MyPage - 회원정보</h2>
	<jsp:include page="menu.jsp"/>
	<ul>
		<li>ID : ${member.id}</li>
		<li>이름 : ${member.name}</li>
		<li>전화번호 : ${member.phone}</li>
		<li>이메일 : ${member.email}</li>
		<li>주소 : ${member.address}</li>
		<li>가입일 : ${member.reg_date}</li>
	</ul>
	<div class="align-center">
		<input type="button" value="회원정보수정" onclick="location.href='modifyForm.do'">
	</div>
</div>
</body>
</html>