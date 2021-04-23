<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload= function() {
	var register_form = document.getElementById('register_form');
	register_form.onsubmit = function() {
		var name = document.getElementById('name');
		var id = document.getElementById('id');
		var pw = document.getElementById('password');
		var phone = document.getElementById('phone');
		var content = document.getElementById('content');
		if(name.value.trim()==''){
			alert('이름을 입력하세요');
			name.value ='';
			name.focus();
			return false;
		}
		if(id.value.trim()==''){
			alert('ID를 입력하세요');
			id.value ='';
			id.focus();
			return false;
		}
		if(pw.value.trim()==''){
			alert('비밀번호를 입력하세요');
			pw.value ='';
			pw.focus();
			return false;
		}
		if(phone.value.trim()==''){
			alert('전화번호를 입력하세요');
			phone.value ='';
			phone.focus();
			return false;
		}
		if(content.value.trim()==''){
			alert('자기소개를 입력하세요');
			content.value ='';
			content.focus();
			return false;
		}
	
	}
}
</script>
</head>
<body>
<!-- 이름, id, pw, 전화번호 자기소개 를 s10_register.jsp로 전송 -->
<form action="s10_register.jsp" method="post" id="register_form">
이름 <input type="text" name="name" id="name"> <br>
ID <input type="text" name="id" id="id"> <br>
PW <input type="password" name="password" id="password"> <br>
전화번호 <input type="text" name="phone" id="phone"> <br>
자기소개 <textarea rows="5" cols="30" name="content" id="content"></textarea>
<br>
<input type="submit" value="가입">
</form>
</body>
</html>