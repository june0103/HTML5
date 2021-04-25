<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 메뉴 시작 -->
<div class="align-right">
	<c:if test="${!empty user_num}">
	<a href="myPage.do">My페이지</a>
	<a href="deleteForm.do">회원 탈퇴</a>
	[${user_id}님 로그인]
	<a href="logout.do">로그아웃</a>
	</c:if>
	<c:if test="${empty user_num}">
	<a href="registerForm.do">회원가입</a>
	<a href="loginForm.do">로그인</a>
	</c:if>
	<hr size="1" noshade="noshade" width="100%">
</div>
<!-- 메뉴 끝 -->
