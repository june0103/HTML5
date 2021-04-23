<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		border-collapse: collapse;
		border: solid 1px #000000;
		width: 500px;
		margin:0 auto;
	}
	td{
		border: solid 1px #000000;
		text-align: center;
		vertical-align: middle;
		height: 40px;
	}
	td.td-middle{
		text-align: left;
		vertical-align: top;
		height: 200px;
	}
	td.td-width{
		width: 100px;
	}
</style>
</head>
<body>
<table>
	<tr>
		<td colspan="2">
			<jsp:include page="/ch05-actionTag/module/top.jsp">
				<jsp:param value="대한회사" name="company"/></jsp:include>
		</td>
	</tr>
	<tr>
		<td class="td-middle td-width">
			<jsp:include page="/ch05-actionTag/module/left.jsp"></jsp:include>
		</td>
		<td class="td-middle">
			레이아웃1
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<jsp:include page="/ch05-actionTag/module/bottom.jsp"></jsp:include>
		</td>
	</tr>
</table>
</body>
</html>