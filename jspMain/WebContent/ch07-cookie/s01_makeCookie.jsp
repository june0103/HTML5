
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%
	Cookie cookie = new Cookie("name",URLEncoder.encode("홍길동","UTF-8"));
	//쿠키 유효시간 지정(단위 : 초)
	//쿠키 유효시간을 미지정시 메모리에 쿠키 정보 보관(브라우저를 끄면 쿠키정보 삭제)
	//cookie.setMaxAge(30*60);
	//cookie.setMaxAge(-1); //메모리에 쿠키정보보관
	
	//생성된 쿠키 정보를 클라이언트에 전송
	response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 생성</title>
</head>
<body>
<%= cookie.getName() %> 쿠키의 값 = <%= cookie.getValue() %>
</body>
</html>