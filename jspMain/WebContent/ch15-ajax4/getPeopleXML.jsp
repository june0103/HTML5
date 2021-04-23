<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet"%>
<%@ include file="dbInfo.jspf"%>
<?xml version="1.0" encoding="UTF-8"?>
<people>
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
			sql = "SELECT * FROM people ORDER BY id ASC";
			//JDBC수행 3단계 : PreparedStatement
			pstmt = conn.prepareStatement(sql);
			//JDBC수행 4단계 : sql문을 테이블에 반영하고 결과행을 ResultSet에 담음
			rs = pstmt.executeQuery();
			while(rs.next()){
				String id = rs.getString("id");
				String name = rs.getString("name");
				String job = rs.getString("job");
				String address = rs.getString("address");
				String bloodtype = rs.getString("bloodtype");
				%>	
				<person>
					<id><%= id %></id>
					<name><%= name %></name>
					<job><%= job %></job>
					<address><%= address %></address>
					<bloodtype><%= bloodtype %></bloodtype>
				</person>
				<%	
				}			
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(rs!=null)try{rs.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
%>
</people>