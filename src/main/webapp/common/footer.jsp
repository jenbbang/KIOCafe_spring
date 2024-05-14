<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
footer.center {
	margin-top: 3rem;
	display: flex;
}

footer>address {
	margin: auto;
	height: 10rem;
	width: 30rem;
}

footer>address>p {
	font-size: 15px;
	line-height: 15px;
	color: gray;
}

.email {
	text-decoration: underline;
}

footer>img {
	margin: auto;
	width: 20rem;
	height: 200px;
}
</style>
</head>
<body>
	<div style="width: 100%; margin: auto;">
		<div class="w3-panel w3-border-bottom w3-light-gray" >

		</div>

		<footer class="center w3-white">
			<address>
				<p>대표 : KMS &nbsp;&nbsp;&nbsp; 법인명 : KIObakerycafe
					&nbsp;&nbsp;&nbsp; 전화 : 1588-8800</p>
				<p class="email">E-mail : KIO@KIObakerycafe.co.kr</p>
				<p>주소 : 서울특별시 강남구 테헤란로1길 10 세경빌딩 3층</p>
				<p>사업자 등록 번호 : 111-11-111 </p>
				 <p>통신판매 신고 : 2022-서울강남-11호</p>
			</address>
			<img alt="로고 삽입"
				src="${pageContext.request.contextPath}/common/img/kic_project_logo_last.png" >
		</footer>
	</div>
	<br>
	<br>
</body>
</html>