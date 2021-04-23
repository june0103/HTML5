<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="dbInfo.jspf" %>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환
	String id = request.getParameter("id");
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		
		//JDBC수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
	
	
		sql = "SELECT id FROM people WHERE id=?";
		
		//JDBC수행 3단계 : PrepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//?에 바인딩
	
		pstmt.setString(1, id);
		
		//JDBC수행 4단계 : SQL문 테이블에 반영하고 결과행을 ResultSet에 반영
		rs = pstmt.executeQuery();
		if(rs.next()){ //결과행이 존재하고 id가 중복됨
%>
			{
				"result" : "success",
				"id" : "idDuplicated"
			}
<%	
		}else{ //결과행이 없고 id가 중복되지 않음
%>
			{
				"result" : "success",
				"id" : "idNotFound"
			}
<%	
		}
	}catch(Exception e){
%>
		{
			"result" "failure"
		}
<%
		e.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException e){}
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
%>