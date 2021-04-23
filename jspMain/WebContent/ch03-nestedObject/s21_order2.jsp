<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%
	HashMap<String,Integer> map = new HashMap<String,Integer>();
	map.put("짜장면",5000);
	map.put("짬뽕",6000);
	map.put("볶음밥",7000);
	
	int delivery_fee = 2000;
	
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<body>
	이름 : <%= request.getParameter("name")  %><br>
	전화번호 : <%= request.getParameter("phone")  %><br>
	주소 : <%= request.getParameter("address")  %><br>
	주문 내용 : 
	<%
		String[] food = request.getParameterValues("food");
	int sum = 0;
	if(food!=null){
		for(int i  =0; i<food.length; i++){
			sum += map.get(food[i]);
			%>
				<%= food[i] %>
			<%
		}
		if(sum<15000) sum += delivery_fee;
		else delivery_fee = 0;
		%>
		<br>
		배달비 : <%= delivery_fee %><br>
		총 주문 비용(배달비 포함) : <%= sum %>
		<%
	}else{
		%>
		<p>선택한 음식이 없습니다.</p>
		<%
	}
	%>
</body>
</html>