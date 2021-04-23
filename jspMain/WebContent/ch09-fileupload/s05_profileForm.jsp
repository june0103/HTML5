<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 업로드하기</title>
<script type="text/javascript">
	window.onload=function(){
		var file = document.getElementById('file');
		
		file.onchange= function() {
			if(file.files && file.files[0]){
				//선택한 이미지를 읽기 위해 filereader객체 생성
				var reader = new FileReader();
				
				//file객체로부터 이미지 정보를 읽기
				reader.readAsDataURL(file.files[0]);
				
				//file객체로부터 이미지 정보를 다 읽으면 이벤트 발생
				reader.onload = function() {
					var image = document.getElementById('image');
					var submit_btn = document.getElementById('submit_btn');
					
					image.src = reader.result;
					
					image.style.display='';
					submit_btn.style.display='';
				}
			}
		}
	}
</script>
</head>
<body>
<h2>프로필 사진 업로드하기</h2>
<img id="image" width="100" height="100" style="display: none;">
<form action="s06_profile.jsp" method="post" enctype="multipart/form-data">
	<input type="file" name="file" id="file" accept="image/png, image/jpeg, image/gif">
	<input type="submit" value="전송" id="submit_btn" style="display: none;">
</form>
</body>
</html>