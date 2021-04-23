<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.member.Member" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set태그</title>
</head>
<body>
		<!--속성명		속성값		page영역 -->
<c:set var="msg" value="봄" scope="page"/>
${pageScope.msg },${msg }<br>

<%
	Member member = new Member();
%>
<c:set var="member" value="<%= member %>"/>
<c:set target="${member}" property="name" value="홍길동"/>
이름 : ${member.getName() }<br>
이름 : ${member.name }<br>
</body>
</html>