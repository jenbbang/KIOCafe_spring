<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
 img=opener.document.getElementById("pic");
 img.src = "${pageContext.request.contextPath}/view/category/img/${filename}";//업로드 된 이미지 화면에 출력
 opener.document.f.cpicture.value="${filename}"; //파라미터에 파일이름 설정 
	self.close();
	
	</script>
</body>
</html>