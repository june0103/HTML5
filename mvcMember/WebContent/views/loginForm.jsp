<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
		//유효성 검사
		$('#login_form').submit(function() {
			if($('#id').val().trim()==''){
				alert('아이디를 입력하세요');
				$('#id').val(''),focus();
				return false;
			}
			
			if($('#passwd').val().trim()==''){
				alert('비밀번호를 입력하세요');
				$('#passwd').val(''),focus();
				return false;
			}
		})
		
})
</script>
</head>
<body>
<div class="page-main-style">
	<h2>로그인</h2>
	<jsp:include page="menu.jsp"/>
	<form action="login.do" id="login_form" method="post">
		<ul>
			<li>
				<label for="id">아이디</label>
				<input type="text" name="id" id="id" maxlength="12">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" maxlength="12">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="로그인">
			<input type="button" value="메인" onclick="location.href='main.do'">
		</div>
	</form>

</div>
</body>
</html>