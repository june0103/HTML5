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
	String pid = request.getParameter("pid");
	String pname = request.getParameter("pname");
	String psize = request.getParameter("psize");
	String pcolor = request.getParameter("pcolor");
	int pcost = Integer.parseInt(request.getParameter("pcost"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		//JDBC수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


		sql = "INSERT INTO item (pid,pname,psize,pcolor,pcost) VALUES(?,?,?,?,?)";
		
		//JDBC수행 3단계 : PrepareStatement 객체 생성
		pstmt = conn.prepareStatement(sql);
		//?에 바인딩
		pstmt.setString(1, pid);
		pstmt.setString(2, pname);
		pstmt.setString(3, psize);
		pstmt.setString(4, pcolor);
		pstmt.setInt(5, pcost);
		
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