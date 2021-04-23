<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="dbInfo.jspf" %>
[<%
/*  <!--pi아이디, pname상품명,psize크기,pcolor색깔,pcost가격  --> */
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
 	
	try{
		//JDBC수행 1단계 : 드라이버 로드
		Class.forName(driverName);
		//JDBC수행 2단계 : Connection 객체 생성
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


		sql = "SELECT * FROM item ORDER BY pid ASC";
		
		//JDBC수행 3단계 : PreparedStatement
		pstmt = conn.prepareStatement(sql);
		
		//JDBC수행 4단계 : sql문을 테이블에 반영하고 결과행을 ResultSet에 담음
		rs = pstmt.executeQuery();

		while(rs.next()){
	
			String pid = rs.getString("pid");
			String pname = rs.getString("pname");
			String psize = rs.getString("psize");
			String pcolor = rs.getString("pcolor");
			int pcost = rs.getInt("pcost");
			
			if(rs.getRow()>1){
				out.println(",");
			}
			
			%>
			
			{
				"pid" : "<%= pid %>",
				"pname" : "<%= pname %>",
				"psize" : "<%= psize %>",
				"pcolor" : "<%= pcolor %>",
				"pcost" : "<%= pcost %>"
			}
		
		<%	
		}

	
	}catch(Exception e){
	%>
		{"result":"failure"}
	<%	
		e.printStackTrace();
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(rs!=null)try{rs.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
 %>]