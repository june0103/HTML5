<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
<h1>로그인 확인</h1>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	//테스트로 id와 비밀번호 입력값이 동일하면 로그인처리
	if(id.equals(password)){
		session.setAttribute("userId", id);
		%>
		<%= id %>님이 로그인.<br>
		<input type="button" value="로그인 검증" onclick="location.href='s04_loginCheck.jsp'">
		<input type="button" value="로그아웃" onclick="location.href='s05_logout.jsp'">
		<%
	}else{
	%>
		<script type="text/javascript">
			alert('로그인 실패');
			history.go(-1);
		</script>
	<%	
	}
%>
</body>
</html>