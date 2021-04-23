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
<title>게사판 목록</title>
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
<div class="page-main-style">
	<h2>상품 목록</h2>
	<div class="align-right">
		<input type="button" value="등록" onclick="location.href='insertTestForm.jsp'">
	</div>
	<table>
		<tr>
			<th>상품번호</th>
			<th>상품명</th>
			<th>가격</th>
			<th>재고</th>
		</tr>
		<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try{
			//JDBC수행 1단계 : 드라이버 로드
			Class.forName(driverName);
			//JDBC수행 2단계 : Connection 객체 생성
			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


			sql = "SELECT * FROM product ORDER BY num DESC";
			
			//JDBC수행 3단계 : PrepareStatement 객체 생성
			pstmt = conn.prepareStatement(sql);
		
			//JDBC수행 4단계 : SQL문 실행
			rs = pstmt.executeQuery();
			while(rs.next()){
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int price = Integer.parseInt(rs.getString("price"));
				int stock = Integer.parseInt(rs.getString("stock"));
				
				%>
				<tr>
					<td><%= num %></td>
					<td><a href="detailTest.jsp?num=<%= num %>"><%= name %></a></td>
					<td><%= price %></td>
					<td><%= stock %></td>
				</tr>
				
				<%
			}
			
		}catch(Exception e){
			%>
			<tr>
				<td colspan="4" class="align-center">오류 발생</td>
			</tr>
			
			<%
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
			if(conn!=null)try{conn.close();}catch(SQLException e){}
		}
		%>
	</table>
</div>
</body>
</html>