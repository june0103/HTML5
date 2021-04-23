<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글등록</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
	window.onload = function() {
		var myForm = document.getElementById('myForm');
		myForm.onsubmit = function() {
			var name = document.getElementById('name');
			if(name.value.trim()==''){
				alert('이름을 입력하세요!');
				name.value = '';
				name.focus();
				return false;
			}
			var title = document.getElementById('title');
			if(title.value.trim()==''){
				alert('제목을 입력하세요!');
				title.value = '';
				title.focus();
				return false;
			}
			var passwd = document.getElementById('passwd');
			if(passwd.value.trim()==''){
				alert('비밀번호를 입력하세요!');
				passwd.value = '';
				passwd.focus();
				return false;
			}
			var content = document.getElementById('content');
			if(content.value.trim()==''){
				alert('내용을 입력하세요!');
				content.value = '';
				content.focus();
				return false;
			}
		}
	}
</script>
</head>
<body>
<div class="page-main-style">
	<h2>글쓰기</h2>
	<form action="insertTest.jsp" id="myForm" method="post">
		<ul>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" size="20" maxlength="10">
			</li>
			<li>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" size="30" maxlength="50">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" size="20" maxlength="10">
			</li>
			<li>
				<label for="content">내용</label>
				<textarea rows="5" cols="40" name="content" id="content"></textarea>
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