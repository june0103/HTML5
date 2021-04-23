<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL Test</title>
</head>
<body>
<% 
	pageContext.setAttribute("msg1", "여행");
	request.setAttribute("msg2", "소나기");
	session.setAttribute("msg3", "산책");
	application.setAttribute("msg4", "겨울");
%>
page 영역 : ${pageScope.msg1}<br>
page 영역 : ${msg1}<br>
request 영역 : ${requestScope.msg2}<br>
request 영역 : ${msg2}<br>
session 영역 : ${sessionScope.msg3 }<br>
session 영역 : ${msg3 }<br>
application 영역 : ${applicationScope.msg4 }<br>
application 영역 : ${msg4 }<br>
</body>
</html>