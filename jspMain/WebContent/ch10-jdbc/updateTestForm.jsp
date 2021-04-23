<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="dbInfo.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 폼</title>
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
<%
	// 전송된 글번호(primary key)반환
	int num = Integer.parseInt(request.getParameter("num"));

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		//JDBC수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


		sql = "SELECT * FROM tboard WHERE num=?";
		
		//JDBC수행 3단계 : PrepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
	
		pstmt.setInt(1, num);
		
		//JDBC수행 4단계 : SQL문 실행
		rs = pstmt.executeQuery();
		if(rs.next()){ //하나의 레코드가 있을경우
			int tnum = rs.getInt("num");
			String title = rs.getString("title");
			String name = rs.getString("name");
			String content = rs.getString("content");
			%>
			<div class="page-main-style">
				<h2>글 수정</h2>
				<form action="updateTest.jsp" method="post" id="myForm">
					<input type="hidden" name="num" value="<%= tnum %>">
					<ul>
						<li>
							<label for="name">이름</label>
							<input type="text" name="name" id="name" value="<%= name %>">
						</li>
						<li>
							<label for="title">제목</label>
							<input type="text" name="title" id="title" value="<%= title %>" size="30" maxlength="50">
						</li>
						<li>
							<label for="passwd">비밀번호</label>
							<input type="password" name="passwd" id="passwd">
						</li>
						<li>
							<label for="content">내용</label>
							<textarea rows="5" cols="40" name="content" id="content" ><%= content %></textarea>
						</li>
					</ul>
					<div class="align-center">
						<input type="submit" value="수정">
						<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
					</div>
				</form>
			</div>
			<%
		}else{ //읽어들일 레코드가 없는 경우
			%>
			<div class="result-display">
			수정할 글 정보 호출 실패.<br>
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
			</div>
			<%
		}
		
	}catch(Exception e){
		%>
		<div class="result-display">
		오류발생! 수정할 글 정보 호출 실패.<br>
		<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
		</div>
		
		<%
		e.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException e){}
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
%>
</body>
</html>