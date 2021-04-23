<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%
	HashMap<String,Integer> map = new HashMap<String,Integer>();
	map.put("가방",200000);
	map.put("신발",100000);
	map.put("옷",50000);
	map.put("식사권",150000);
	
	int delivery_fee = 5000;
	
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
</head>
<body>
	이름 : <%= request.getParameter("name")  %><br>
	날짜 : <%= request.getParameter("order_date")  %><br>
	구입 내용 : 
	<%
		String[] items = request.getParameterValues("item");
	int sum = 0;
	if(items!=null){
		for(int i  =0; i<items.length; i++){
			sum += map.get(items[i]);
			%>
				<%= items[i] %>
			<%
		}
		if(sum<300000) sum += delivery_fee;
		else delivery_fee = 0;
		%>
		<br>
		배송비 : <%= delivery_fee %><br>
		총 구매 비용(배송비 포함) : <%= sum %>
		<%
	}else{
		%>
		<p>선택한 상품이 없습니다.</p>
		<%
	}
	%>
</body>
</html>