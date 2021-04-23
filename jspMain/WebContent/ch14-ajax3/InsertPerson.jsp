<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="dbInfo.jspf" %>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");

	//전송된 데이터 반환
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String job = request.getParameter("job");
	String address = request.getParameter("address");
	String bloodtype = request.getParameter("bloodtype");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		//JDBC수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


		sql = "INSERT INTO people (id,name,job,address,bloodtype) VALUES(?,?,?,?,?)";
		
		//JDBC수행 3단계 : PrepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//?에 바인딩
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, job);
		pstmt.setString(4, address);
		pstmt.setString(5, bloodtype);
		
		//JDBC수행 4단계 : SQL문 실행
		pstmt.executeUpdate();
	%>
	{"result":"success"}
	<%	
	
	}catch(Exception e){
	%>
		{"result":"failure"}
	<%	
		e.printStackTrace();
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
%>