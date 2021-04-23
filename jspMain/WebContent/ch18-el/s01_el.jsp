<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<caption>간단 표현언어</caption>
	<tr>		
		<th>표현식</th>
		<th>값</th>
	</tr>
	<tr>
		<td>\${2 + 5}</td>
		<td>${2 + 5}</td>
	</tr>
	<tr>
		<td>\${"10" + 5}</td>
		<td>${"10" + 5}</td>
	</tr>
	<tr>
		<td>\${"10" + "5"}</td>
		<td>${"10" + "5"}</td>
	</tr>
	<tr>
		<td>\${"십" + 5}</td>
		<td>에러발생(EL에서의 +는 연산만)</td>
	</tr>
	<tr>
		<td>\${4 / 5}</td>
		<td>${4/5}</td>
	</tr>
	<tr>
		<td>\${5 / 0}</td>
		<td>${5/0}</td>
	</tr>
	<tr>
		<td>\${5 mod 7}</td>
		<td>${5 mod 7}</td>
	</tr>
	<tr>
		<td>\${2 < 3}</td>
		<td>${2 < 3}</td>
	</tr>
</table>
</body>
</html>