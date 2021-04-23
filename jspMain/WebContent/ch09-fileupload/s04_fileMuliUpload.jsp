<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다중 업로드 처리</title>
</head>
<body>
<%
	String realFolder = ""; //파일 업로드 경로의 절대 경로
	
	//파일 업로드 경로
	String saveFolder = "/upload";
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5*1024*1024; //파일의 최대 업로드 사이즈, 5M
	
	//파일 업로드 절대 경로 구하기
	realFolder = application.getRealPath(saveFolder);
	
	out.println("파일 업로드 절대 경로 : " + realFolder+"<br>");
	out.println("------------------------------<br>");
	
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
	
	out.println("작성자 : " + multi.getParameter("user"));
	out.println("<br>------------------------------<br>");
	
	out.println("파일1 : " + multi.getFilesystemName("uploadFile1"));
	out.println("<br>");
	out.println("파일2 : " + multi.getFilesystemName("uploadFile2"));
	
	
%>
</body>
</html>