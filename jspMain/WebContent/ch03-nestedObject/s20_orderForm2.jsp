<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습]식사주문</title>
</head>
<body>
<form action="s21_order2.jsp" method="post">
	이름 <input type="text" name="name"><br>
	전화번호 <input type="text" name="phone"><br>
	주소 <input type="text" name="address"><br>
	음식(15,000원 미만 배송비 2천원 추가)<br>
	<input type="checkbox" name="food" value="짜장면">짜장면(5,000원)
	<input type="checkbox" name="food" value="짬뽕">짬뽕(6,000원)
	<input type="checkbox" name="food" value="볶음밥">볶음밥(7,000원)
	<br>
	<input type="submit" value="전송">
</form>
</body>
</html>