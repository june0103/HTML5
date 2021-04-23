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
<title>상품 삭제 처리</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	try{
		
		//JDBC수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
	
		sql = "DELETE FROM product WHERE num=?";
		
		//JDBC수행 3단계 : PrepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//?에 바인딩
	
		pstmt.setInt(1, num);
		
		//JDBC수행 4단계 : SQL문 실행
		pstmt.executeUpdate();
		
		%>
		<div class="result-display">
			상품 삭제 완료<br>
			<input type="button" value="목록 보기" onclick="location.href='selectTest.jsp'">
		</div>
		<%
	}catch(Exception e){
		%>
		<div class="result-display">
		오류발생 <br>
		<input type="button" value="목록 보기" onclick="location.href='selectTest.jsp'">
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