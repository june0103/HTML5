<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		
		//회원정보수정 유효성 검사
		$('#modify_form').submit(function() {

			if($('#name').val().trim()==''){
				alert('이름을 입력하세요');
				$('#name').val('').focus();
				return false;
			}
			if($('#passwd').val().trim()==''){
				alert('비밀번호를 입력하세요');
				$('#passwd').val('').focus();
				return false;
			}
			if($('#phone').val().trim()==''){
				alert('전화번호를 입력하세요');
				$('#phone').val('').focus();
				return false;
			}
			if($('#email').val().trim()==''){
				alert('이메일을 입력하세요');
				$('#email').val('').focus();
				return false;
			}
			if($('#address').val().trim()==''){
				alert('주소를 입력하세요');
				$('#address').val('').focus();
				return false;
			}
			
			
		})
		
	})
</script>
</head>
<body>
<div class="page-main-style">
	<h2>회원정보수정</h2>
	<jsp:include page="menu.jsp"/>
	<form action="modify.do" id="modify_form" method="post">
		<ul>
			<li>
				<label for="name">이름</label>
				<input type="text" name="name" id="name" value="${member.name}" maxlength="10">
			</li>
			<li>
				<label for="passwd">비밀번호</label>
				<input type="password" name="passwd" id="passwd" maxlength="12">
			</li>
			<li>
				<label for="phone">전화번호</label>
				<input type="text" name="phone" id="phone" value="${member.phone}" maxlength="15">
			</li>
			<li>
				<label for="email">이메일</label>
				<input type="email" name="email" id="email" value="${member.email}">
			</li>
			<li>
				<label for="address">주소</label>
				<input type="text" name="address" id="address" value="${member.address}">
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="수정">
			<input type="button" value="myPage" onclick="location.href='myPage.do'">
		</div>
	</form>

</div>
</body>
</html>