<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기본 객체와 영역</title>
</head>
<body>
<%							//속성명,  속성값
	pageContext.setAttribute("msg1", "봄");
	request.setAttribute("msg2", "여름");
	session.setAttribute("msg3", "가을");
%>

page영역 msg1 = <%= pageContext.getAttribute("msg1") %><br>
request 영역 msg2 = <%= request.getAttribute("msg2") %><br>
session 영역 msg3 = <%= session.getAttribute("msg3") %>
</body>
</html>