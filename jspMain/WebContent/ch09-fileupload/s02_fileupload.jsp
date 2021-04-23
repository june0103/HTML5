<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 처리</title>
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
	out.println("<br>");
	out.println("제목 : "+multi.getParameter("title"));
	out.println("<br>------------------------------<br>");

	//파일정보 읽기
	//전송전 원래의 파일 이름
	String original = multi.getOriginalFileName("uploadFile");
	
	//서버에 저장된 파일 이름
	String filename = multi.getFilesystemName("uploadFile");
	
	//전송된 파일의 컨텐트 타입
	String type = multi.getContentType("uploadFile");
	
	//파일의 용량 구하기
	File file = multi.getFile("uploadFile");
	
	out.println("전송전 원래의 파일 이름 :" + original + "<br>");
	out.println("서버에 저장된 파일 이름 :" + filename + "<br>");
	out.println("전송된 파일의 컨텐트 타입 :" + type + "<br>");
	out.println("파일의 용량 :" + file.length() + "bytes");
	
%>
</body>
</html>