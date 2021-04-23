<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 파라미터 출력</title>
</head>
<body>
<h2>request.getParameter()사용</h2>
이름 : <%= request.getParameter("name") %><br>
주소 : <%= request.getParameter("address") %><br>

<h2>requeset.getParameterValues()사용</h2>
<%
	String[] values = request.getParameterValues("pet");
	if(values!=null){
		for(int i = 0; i<values.length; i++){
%>
			<%= values[i] %>
<%
		}
	}
%>
</body>
</html>