<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 폼</title>
<script type="text/javascript">
	window.onload= function() {
		var myForm = document.getElementById('myForm');
		myForm.onsubmit = function() {
			var dan = document.getElementById('dan');
			if(dan.value.trim()==''){
				alert('단을 입력하세요');
				dan.value ='';
				dan.focus();
				return false;
			}
			
			if(isNaN(dan.value)){
				alert('숫자만 입력하세요');
				dan.value = '';
				dan.focus();
				return false;
			}
		}
	}
</script>
</head>
<body>
<form action="s06_gugudan.jsp" method="post" id="myForm">
	단 입력 <input type="text" name="dan" id="dan"><br>
	<input type="submit" value="전송">
	
</form>
</body>
</html>