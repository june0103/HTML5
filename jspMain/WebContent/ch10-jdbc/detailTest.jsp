<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Date" %>
<%@ include file="dbInfo.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세 정보보기</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<%
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
			Date reg_date = rs.getDate("reg_date");
			%>
			<div class="page-main-style">
				<h2>글 상세 정보</h2>
					<ul>
						<li>글번호 : <%= tnum %></li>
						<li>제목 : <%= title %></li>
						<li>작성자 : <%= name %></li>
						<li>작성일 : <%= reg_date %></li>
					</ul>
					<hr width="100%" size="1" noshade="noshade">
					<p>
						<%= content %>
					</p>
					<hr width="100%" size="1" noshade="noshade">
					<div class="align-right">
						<input type="button" value="수정" onclick="location.href='updateTestForm.jsp?num=<%= num %>'">
						<input type="button" value="삭제" onclick="location.href='deleteTestForm.jsp?num=<%= num %>'">
						<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
					</div>
			</div>
			<%
		}else{ //읽어들일 레코드가 없는 경우
			%>
			<div class="result-display">
			글 상세 정보가 없습니다.<br>
			<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
			</div>
			<%
		}
		
	}catch(Exception e){
		%>
		<div class="result-display">
		오류발생! 글 상세정보 호출 실패<br>
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