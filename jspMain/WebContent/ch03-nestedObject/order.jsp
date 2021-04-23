<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<%
	HashMap<String,Integer> map = new HashMap<String,Integer>();
	map.put("가방",150000);
	map.put("신발",200000);
	map.put("옷",300000);
	map.put("식사권",100000);
	
	int delivery = 5000;
	
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문내역</title>
</head>
<body>
	이름 : <%= request.getParameter("name")  %><br>
	날짜 : <%= request.getParameter("date")  %><br>
	주소 : <%= request.getParameter("address")  %><br>
	주문 내용 : 
	<%
		String[] product = request.getParameterValues("product");
	int total = 0;
	if(product!=null){
		for(int i  =0; i<product.length; i++){
			total += map.get(product[i]);
			%>
				<%= product[i] %>
			<%
		}
		if(total<300000) total += delivery;
		else delivery = 0;
		%>
		<br>
		배송비 : <%= delivery %><br>
		총 주문 비용(배송비 포함) : <%= total %>
		<%
	}else{
		%>
		<p>선택한 상품이 없습니다.</p>
		<%
	}
	%>
</body>
</html>