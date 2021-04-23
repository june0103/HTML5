<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ include file="dbInfo.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 등록 처리</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String passwd = request.getParameter("passwd");
	String content = request.getParameter("content");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	try{
		//JDBC수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


		sql = "INSERT INTO tboard (num,name,title,passwd,content,reg_date) VALUES(board_seq.nextval, ?,?,?,?,SYSDATE)";
		
		//JDBC수행 3단계 : PrepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//?에 바인딩
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, passwd);
		pstmt.setString(4, content);
		
		//JDBC수행 4단계 : SQL문 실행
		pstmt.executeUpdate();
		
		%>
		<div class="result-display">
			글 등록 완료<br>
			<input type="button" value="목록 보기" onclick="location.href='selectTest.jsp'">
		</div>
		<%
	}catch(Exception e){
		%>
		<div class="result-display">
		오류발생 <br>
		<input type="button" value="글쓰기" onclick="location.href='insertTestForm.jsp'">
		</div>
		<%
		e.printStackTrace();
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}

%>
</body>
</html>