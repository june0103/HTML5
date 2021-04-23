<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다중 업로드</title>
</head>
<body>
<form action="s04_fileMuliUpload.jsp" method="post" enctype="multipart/form-data">
	작성자 <input type="text" name="user"><br>
	파일1 <input type="file" name="uploadFile1"><br>
	파일2 <input type="file" name="uploadFile2"><br>
	<input type="submit" value="파일 올리기">

</form>

</body>
</html>