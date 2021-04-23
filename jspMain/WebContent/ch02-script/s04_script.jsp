<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	public int multiply(int a, int b){
	
	return a*b;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선언부에 메서드 정의하기</title>
</head>
<body>
10 * 25 = <%= multiply(10,25) %>
</body>
</html>