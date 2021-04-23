<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연동 테스트</title>
</head>
<body>
<%
	String driverName = "oracle.jdbc.OracleDriver";
	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "scott";
	String dbPass = "tiger";
	
	Connection conn = null;
	try{
		//JDBC수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		out.println("정상적으로 연결되었습니다.");
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
%>
</body>
</html>