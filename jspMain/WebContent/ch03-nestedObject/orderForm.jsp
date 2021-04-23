<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품주문 폼</title>
<script type="text/javascript">
	window.onload = function() {
		var orderForm = document.getElementById('orderForm');
		orderForm.onsubmit = function() {
			var name = document.getElementById('name');
			if(name.value.trim()==''){
				alert('이름을 입력해주세요');
				name.value = '';
				name.focus();
				return false;
			}
			var date = document.getElementById('date');
			if(date.value.trim()==''){
				alert('날짜를 입력해주세요');
				date.value = '';
				date.focus();
				return false;
			}
			var address = document.getElementById('address');
			if(address.value.trim()==''){
				alert('주소를 입력해주세요');
				address.value = '';
				address.focus();
				return false;
			}
		}
	}
</script>
</head>
<body>
<form action="order.jsp" method="post" id="orderForm">
	이름 <input type="text" name="name" id="name"><br>
	날짜 <input type="date" name="date" id="date"><br>
	주소 <input type="text" name="address" id="address"><br>
	상품(300,000원 미만 배송비 5천원 추가)<br>
	<input type="checkbox" name="product" value="가방">가방(150,000원)
	<input type="checkbox" name="product" value="신발">신발(200,000원)
	<input type="checkbox" name="product" value="옷">옷(300,000원)
	<input type="checkbox" name="product" value="식사권">식사권(100,000원)
	<br>
	<input type="submit" value="주문">
</form>
</body>
</html>