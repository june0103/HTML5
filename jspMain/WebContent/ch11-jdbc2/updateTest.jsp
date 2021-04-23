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
<title>상품 수정 처리</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<%--
서버로 전송할 데이터 상품명(name), 가격(price), 재고(stock), 원산지(origin)을 입력할 입력폼을 작성

create table product(
	num number primary key, name varchar2(30) not null, price number(9) not null, stock number(9) not null,
	origin varchar2(30) not null, reg_date date not null
);

create sequence product_seq;
--%>
<%
	request.setCharacterEncoding("utf-8");
	
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	String origin = request.getParameter("origin");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	try{
		
		//JDBC수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
	
		sql = "UPDATE product SET name=?, price=?, stock=?, origin=? WHERE num=?";
		
		//JDBC수행 3단계 : PrepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//?에 바인딩
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setInt(3, stock);
		pstmt.setString(4, origin);
		pstmt.setInt(5, num);
		
		//JDBC수행 4단계 : SQL문 실행
		pstmt.executeUpdate();
		
		%>
		<div class="result-display">
			상품 수정 완료<br>
			<input type="button" value="목록 보기" onclick="location.href='selectTest.jsp'">
		</div>
		<%
	}catch(Exception e){
		%>
		<div class="result-display">
		오류발생 <br>
		<input type="button" value="상품수정 폼" onclick="location.href='updateTestForm.jsp?num=<%= num %>'">
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