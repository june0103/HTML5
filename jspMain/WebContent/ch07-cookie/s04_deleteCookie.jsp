<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				Cookie cookie = new Cookie("name","");
				
				cookie.setMaxAge(0); //만료시간을줘서 쿠키정보를 제거
				//클라이언트로 쿠키정보 전송
				response.addCookie(cookie);
				%>
				name 쿠키의 값을 삭제.
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