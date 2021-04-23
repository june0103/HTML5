<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1부터 100까지 합</title>
</head>
<body>
<h3>1부터 100까지 합</h3>
<%
	int total = 0;
	for(int i=1; i<=100; i++){
		total += i;
	}
	out.println("1부터 100까지 합 : "+total);
%>
</body>
</html>