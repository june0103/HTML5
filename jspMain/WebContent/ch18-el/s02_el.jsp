<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 EL 예제</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<h3>EL - 파라미터값 처리</h3>
<form action="s02_el.jsp" method="post">
	이름 <input type="text" name="name">
	<input type="submit" value="확인">
</form>
<br>
이름은 <%= request.getParameter("name") %><br>
이름은 ${param.name}
</body>
</html>