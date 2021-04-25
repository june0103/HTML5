<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글삭제</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<script type="text/javascript">
	window.onload=function(){
		var myForm = document.getElementById('delete_form');
		//이벤트 연결
		myForm.onsubmit = function() {
			var passwd = document.getElementById('passwd');
			if(passwd.value.trim()==''){
				alert('비밀번호를 입력하세요');
				passwd.value='';
				passwd.focus();
				return false;
			}			
		}
	}
</script>
</head>
<body>
<div class="page-main-style">
	<h2>글삭제</h2>
	<form id="delete_form" action="delete.do" method="post">
		<input type="hidden" name="num" value="${num}">
		<ul>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" size="12" maxlength="12">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="삭제">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</div>
	</form>
</div>
</body>
</html>