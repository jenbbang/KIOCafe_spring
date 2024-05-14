<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>t</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</script>

<style>
body {
	margin: 0;
}

html {
	line-height: 1.15;
	/*기본 행간 높이*/
}

* {
	box-sizing: border-box;
}

.btn-right {
	display: block;
	margin: auto;
	width: 100%;
	text-align: right;
}

div {
	box-sizing: border-box;
}

.title {
	padding-top: 40px;
}

table {
	width: 100%;
}

th {
	padding: 21px 0;
	border-left: 1px solid #eaeaea;
	font-weight: bold;
}

td {
	border-left: 1px solid #eaeaea;
	border-bottom: 1px solid #eaeaea;
	background: #fcfcfb;
	height: 40px;
	padding-left: 12px;
}

.head-title {
	margin-top: 30px;
	text-align: center;
}

.head-title>span {
	width: 100%;
	height: 100%;
	margin: auto;
	font-size: 32px;
	background: linear-gradient(to top, #ffe4e1 20%, transparent 40%);
}

.cont_title01 {
	margin-top: 20px;
	padding: 10px;
	font-size: 20px;
	line-height: 38px;
	font-weight: bold;
	text-align: left;
}

.board_write {
	color: black;
	border-top: 1px solid #d9d9d9;
	font-size: 15px;
	line-height: 20px;
	text-align: left;
	box-sizing: border-box;
	border-right: 1px solid #d9d9d9;
}

.board_write th {
	color: black;
	padding: 15px 35px;
	background-color: #FFEAEA;
}

.body-table>td {
	background-color: #FFE400;
}

input.text {
	padding: 0 10px;
	margin: 15px 15px;
	border: 1px solid #c4c4c4;
	font-size: 15px;
	line-height: 33px;
	box-sizing: border-box;
}

.address-input {
	padding-top: 10px;
	padding-bottom: 15px;
}

.address-input>div>input {
	margin: 5px 0px 0px 15px;
}

.foot_abtn {
	margin-top: 20px;
	padding: 9 15 9 15;
	font-size: 17px;
	font-weight: bold;
	line-height: 38px;
	text-align: center;
	margin-right: 15px;
	border: none;
	background-color: #ffdddd;
	text-decoration: none;
}
</style>


</head>

<body>
	<!--  -->




	<div class="cont_title01 " style="width: 75%; margin: auto;">
		<!--  -->
		<!--  -->
		<!--  -->
		<div class="head-title">
			<span>마이페이지</span>
		</div>
		<table class="board_write">

			<colgroup>
				<col style="width: 172px">
				<col>
			</colgroup>

			<tbody class="body-table">
				<p class="title">${mb.nickname}의정보</p>
				<tr>
					<th scope="row">아이디</th>
					<td>${sessionScope.id }</td>
				</tr>
				<tr>
					<th scope="row">이름</th>
					<td>${mb.name }</td>
				</tr>
				<tr>
					<th scope="row">현 주소</th>
					<td>${mb.address }</td>
				</tr>
				<tr>
					<th scope="row">전화번호</th>
					<td>${mb.tel }</td>
				</tr>
				<tr>
					<th scope="row">이메일</th>
					<td>${mb.email }</td>
				</tr>
			</tbody>
		</table>
		<div class="btn-right" style="margin-top: 30px;">
			<a class="foot_abtn "
				href="${pageContext.request.contextPath}/member/memberUpdateForm">회원정보수정</a>
			<a class="foot_abtn"
				href="${pageContext.request.contextPath}/member/memberDelete">회원탈퇴</a>
			<a class="foot_abtn"
				href="${pageContext.request.contextPath}/member/memberPassUpdate">비밀번호수정</a>
		</div>
	</div>


</body>

</html>