<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 연습</title>
</head>
<body>
<h2>배열 생성 및 요소의 할용 - 선언부, 스크립트릿, 표현식</h2>
<%!
	//선언부 : 변수 선언, 메서드 선언
	int[] score ={97,98,88};
%>
	<table border="1">
	<tr>
		<th>인덱스</th>
		<th>내용</th>
	</tr>
	<%
		for(int i=0; i<score.length; i++){
	%>
		<tr>
			<td><%= i%></td>
			<td><%= score[i]%></td>
		</tr>
	<%
		}
	%>
	</table>
	<br>
	<table border="1">
	<tr>
		<th>내용</th>
	</tr>
	<%
		for(Integer msg : score){
	%>
		<tr>
			<td><%= msg%></td>
		</tr>
	<%
		}
	%>
	</table>
	
	
	
</body>
</html>