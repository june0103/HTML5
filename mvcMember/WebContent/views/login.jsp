<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == true}">
	<script>
		alert('로그인 성공');
		location.href='main.do';
	</script>
</c:if>
<c:if test="${check == false}">
	<script>
		alert('로그인 실패');
		history.go(-1);
	</script>
</c:if>
