<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 정보</title>
</head>
<body>
세션 ID : <%= session.getId() %><br>
세션 생성 시간 : <%= session.getCreationTime() %><br>
<%
	//long타입 시간 -> Date타입의 시간으로 변환
	time.setTime(session.getCreationTime());
%>
세션 생성 시간 : <%= sf.format(time) %><br>
최근(마지막) 접근 시간 : <%= session.getLastAccessedTime() %><br>
<%
	//long타입 시간 -> Date타입의 시간으로 변환
	time.setTime(session.getLastAccessedTime());
%>
최근(마지막) 접근 시간 : <%= sf.format(time) %><br>
세션 유지 시간 변경하기(기본 세션 유지 시간은 30분)<br>
<%
	session.setMaxInactiveInterval(60*20);
	//web.xml에 50분으로 지정된 상태(jsp에서 셋팅한 정보가 현재 세션에 우선 반영된다)
%>
세션 유지 시간 : <%= session.getMaxInactiveInterval() %>초<br>
</body>
</html>