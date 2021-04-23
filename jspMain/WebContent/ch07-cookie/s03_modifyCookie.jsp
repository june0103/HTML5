<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키값 변경</title>
</head>
<body>
<% 
	//클라이언트로부터 전송된 쿠키 정보를 Cookie[]로 반환
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0){
		for(int i = 0; i < cookies.length; i++){
			//쿠키명이 name인 쿠키가 존재하는지 조건 체크
			if(cookies[i].getName().equals("name")){
				//쿠키명이 name인 쿠키가 존재할 경우
				Cookie cookie = new Cookie("name",URLEncoder.encode("JSP프로그래밍","UTF-8"));
				//클라이언트로 쿠키정보 전송
				response.addCookie(cookie);
				%>
				name 쿠키의 값을 변경.
				<%	
			}
			
		}
	}else{
		%>
		쿠키가 존재하지 않습니다.
		<%
	}
%>
</body>
</html>