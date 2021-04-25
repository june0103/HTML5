<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
</head>
<body>
<h1>회원가입 양식</h1>
<form action="write.do" method="post">
	이름 <input type="text" name="name"><br>
	아이디 <input type="text" name="id"><br>
	비밀번호 <input type="password" name="password"><br>
	직업 <input type="text" name="job"><br>
	전화번호 <input type="text" name="phone"><br>
	주소 <input type="text" name="address"><br>
	<input type="submit" value="전송">
</form>
</body>
</html>