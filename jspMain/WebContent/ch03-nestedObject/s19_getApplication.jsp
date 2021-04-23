<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 기본 객체의 속성 보기</title>
</head>
<body>
<%
	Enumeration attrEnum = application.getAttributeNames();
	while(attrEnum.hasMoreElements()){
		//속성명
		String name =(String)attrEnum.nextElement();
		//속성값
		Object value = application.getAttribute(name);
%>
application 속성 : <b> <%= name %></b> = <%= value %><br>
<%
	}
%>
</body>
</html>