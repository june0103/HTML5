<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단</title>

</head>
<body>
	<% int dan = Integer.parseInt(request.getParameter("dan")); %>
	
	<%= dan %>단<br>
	<%
		for(int i=1; i<=9; i++){
			out.println(dan +" X " + i + " = " + dan*i+"<br>");
		}
	%>
</body>
</html>