<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check == true}">
	<script>
		alert('글수정 완료');
		location.href='list.do';
	</script>
</c:if>
<c:if test="${check == false}">
	<script>
		alert('비밀번호가 틀렸습니다.');
		history.go(-1);
	</script>
</c:if>