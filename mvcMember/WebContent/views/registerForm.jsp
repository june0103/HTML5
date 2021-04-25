<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var idChecked = 0;
		
		//아이디 중복 체크
		$('#id_check').click(function() {
			if($('#id').val().trim()==''){
				alert('아이디를 입력하세요!');
				$('#id').val('').focus();
				return;
			}
			
			$('#massage_id').text(''); //메시지 초기화
			
			$.ajax({
				url:'checkId.do',
				type:'post',
				data:{id:$('#id').val()},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result == 'idNotFound'){
						$('#massage_id').css('color','#000000').text('등록 가능 ID');
						idChecked = 1;
					}else if(param.result == 'idDuplicated'){
						$('#massage_id').css('color','red').text('중복된 ID');
						$('#id').val('').focus();
						idChecked = 0;
					}else{
						alert('아이디 중복체크 오류 발생');
						idChecked = 0;
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
					idChecked = 0;
				}
			})
			
		})
		
		//아이디 중복 안내 메시지 초기화 및 아이디 중복 값 초기화
		$('#id').keydown(function() {
			idChecked = 0;
			$('#massage_id').text('');
			
		})
		
		
		
		//회원 정보 등록 유효성 검사
		$('#register_form').submit(function() {
			if($('#id').val().trim()==''){
				alert('아이디를 입력하세요');
				$('#id').val(''),focus();
				return false;
			}
			//아이디 중복 체크 여부
			if(idChecked==0){
				alert('아이디 중복 체크 필수');
				$('#id_check').focus();
				return false;
			}
			
			if($('#name').val().trim()==''){
				alert('이름을 입력하세요');
				$('#name').val(''),focus();
				return false;
			}
			if($('#passwd').val().trim()==''){
				alert('비밀번호를 입력하세요');
				$('#passwd').val(''),focus();
				return false;
			}
			if($('#phone').val().trim()==''){
				alert('전화번호를 입력하세요');
				$('#phone').val(''),focus();
				return false;
			}
			if($('#email').val().trim()==''){
				alert('이메일을 입력하세요');
				$('#email').val(''),focus();
				return false;
			}
			if($('#address').val().trim()==''){
				alert('주소를 입력하세요');
				$('#address').val(''),focus();
				return false;
			}
			
			
		})
		
	})
</script>
</head>
<body>
	<div class="page-main-style">
		<h2>회원 가입</h2>
		<jsp:include page="menu.jsp"/>
		<form action="register.do" id="register_form" method="post">
			<ul>
				<li>
					<label for="id">아이디</label>
					<input type="text" name="id" id="id" size="6" maxlength="12" autocomplete="off">
					<input type="button" value="ID중복체크" id="id_check">
					<span id="massage_id"></span>
				</li>
				<li>
					<label for="name">이름</label>
					<input type="text" name="name" id="name" maxlength="10">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" name="passwd" id="passwd" maxlength="12">
				</li>
				<li>
					<label for="phone">전화번호</label>
					<input type="text" name="phone" id="phone" maxlength="15">
				</li>
				<li>
					<label for="email">이메일</label>
					<input type="email" name="email" id="email" maxlength="50">
				</li>
				<li>
					<label for="address">주소</label>
					<input type="text" name="address" id="address" maxlength="50">
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="등록">
				<input type="button" value="메인" onclick="location.href='main.do'">
			</div>
		</form>
	</div>
</body>
</html>