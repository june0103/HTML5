<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1부터 100까지의 합</title>
</head>
<body>
<%
	//스크립트릿 : 변수 선언, 연산, 제어문, 출력
	int sum = 0;
	for(int i = 1; i<=100; i++){
		sum +=i;
	}
%>
<%--
JSP주석
표현식 : 변수의 값을 출력, 메서드의 결과값을 출력, 연산의 결과값
sum
 --%>
1부터 100까지의 합 <%= sum /*여러줄 주석 사용 가능, 한줄 주석은 오류 */%>
</body>
</html>