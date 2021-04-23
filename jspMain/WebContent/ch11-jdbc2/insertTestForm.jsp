<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
	window.onload = function() {
		var myForm = document.getElementById('myForm');
		myForm.onsubmit = function() {
			var name = document.getElementById('name');
			if(name.value.trim()==''){
				alert('상품명을 입력하세요!');
				name.value = '';
				name.focus();
				return false;
			}
			var price = document.getElementById('price');
			if(price.value.trim()==''){
				alert('가격을 입력하세요!');
				price.value = '';
				price.focus();
				return false;
			}
			var stock = document.getElementById('stock');
			if(stock.value.trim()==''){
				alert('재고를 입력하세요!');
				stock.value = '';
				stock.focus();
				return false;
			}
			var origin = document.getElementById('origin');
			if(origin.value.trim()==''){
				alert('원산지를 입력하세요!');
				origin.value = '';
				origin.focus();
				return false;
			}
		}
	}
</script>
</head>
<body>
<%--
서버로 전송할 데이터 상품명(name), 가격(price), 재고(stock), 원산지(origin)을 입력할 입력폼을 작성

create table product(
	num number primary key, name varchar2(30) not null, price number(9) not null, stock number(9) not null,
	origin varchar2(30) not null, reg_date date not null
);

create sequence product_seq;
--%>
<div class="page-main-style">
	<h2>상품 등록</h2>
	<form action="insertTest.jsp" id="myForm" method="post">
		<ul>
			<li>
				<label for="name">상품명</label>
				<input type="text" name="name" id="name" size="20" maxlength="10">
			</li>
			<li>
				<label for="price">가격</label>
				<input type="text" name="price" id="price" size="20" maxlength="10">
			</li>
			<li>
				<label for="stock">재고</label>
				<input type="text" name="stock" id="stock" size="20" maxlength="10">
			</li>
			<li>
				<label for="origin">원산지</label>
				<input type="text" name="origin" id="origin" size="20" maxlength="10">
			</li>
			
		</ul>
		<div class="align-center">
			<input type="submit" value="전송">
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
	</form>
</div>
</body>
</html>