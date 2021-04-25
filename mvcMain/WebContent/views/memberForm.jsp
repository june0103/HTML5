<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<body>
<form action="/mvcMain/member" method="post">
	이름 <input type="text" name="name"><br>
	직업 <input type="text" name="job"><br>
	<input type="submit" value="전송">
</form>
</body>
</html>