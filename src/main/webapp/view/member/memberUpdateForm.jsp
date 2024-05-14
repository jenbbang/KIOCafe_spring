
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<html>

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
<script>
	function sample4_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.

				if (data.bname !== '' && /[동|로|가]$/g.order - (data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}

				let inputAddress = "";
				inputAddress = data.roadAddress;
				if (data.buildingName) {
					inputAddress = data.roadAddress + " (" + data.buildingName
							+ ")"
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				// 우편번호
				document.getElementById("addressInput1").value = "("
						+ String(data.zonecode) + ") " + inputAddress;

			}
		}).open();
	}
</script>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
	$(function() {
		$('#JBtn').click(function() {
			if ($('#inputId').val() == "") {
				alert("아이디를 입력해주세요");
				$('#inputId').focus();
				return false;

			} else if ($('#inputName').val() == "") {
				alert("이름을 입력해주세요");
				$('#inputName').focus();
				return false;

			} else if ($('#addressInput1').val() == "") {
				alert("주소를 입력해주세요");
				$('#addressInput1').focus();
				return false;
			} else if ($('#rcvMobile').val() == "") {
				alert("번호를 입력해주세요");
				$('#rcvMobile').focus();
				return false;
			}
		})

	})
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

.center {
	display: block;
	margin: auto;
	width: 100%;
	text-align: center;
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
	background: #b5babd;
	color: #fff;
	font-weight: bold;
}

td {
	border-left: 1px solid #eaeaea;
	border-bottom: 1px solid #eaeaea;
	background: sand;
}

.head-title {
	margin-top: 40px;
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
	background-color: #ffeaed;
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

.btn1 {
	border: 0px;
	width: 120px;
	height: 35px;
	background-color: #ffeaed;
	color: black;
}
 
.foot_btn {
	margin-top: 20px;
	padding: 0 15 0 15;
	font-size: 17px;
	font-weight: bold;
	line-height: 38px;
	text-align: center;
	margin-right: 15px;
	border: none;
	background-color: #ffeaed;
	min-width: 98px;
}
</style>


</head>

<body>
	<!--  -->
	<form
		action="${pageContext.request.contextPath}/member/memberUpdatePro"
		method="post">
		<div class="cont_title01 " style="width: 75%; margin: auto;">
			<!--  -->
			<!--  -->
			<!--  -->
			<div class="head-title">
				<span>회원정보수정</span>
			</div>
			<table class="board_write">

				<colgroup>
					<col style="width: 172px">
					<col>
				</colgroup>


				<tbody>

					<div class="head-title" style="text-align: left; margin-bottom: 10px;">
				<span style="font-size: 25px;">필수항목</span>
			</div>
					<tr>
						<th scope="row">아이디</th>
						<td style="display: flex;"><input type="text"
							placeholder="아이디를 입력해주세요." class="text" name="id" id="inputId"
							value="${sessionScope.id}" style="width: 200px;"> <!-- <div class="check_font" id="id_check"></div> -->
						</td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td><input type="password" placeholder="비밀번호를 입력해주세요."
							class="text" name="pass" id="inputPass1" style="width: 200px;">
						</td>
					</tr>

					<tr>
						<th scope="row">이름</th>
						<td><input type="text" class="text" name="name"
							id="inputName" value="${mb.name}" style="width: 200px;">
						</td>
					</tr>
					<tr>
						<th scope=" row">닉네임</th>
						<td><input type="text" class="text" name="nickname"
							value="${mb.nickname}" style="width: 200px;"></td>
					</tr>
					<tr>
						<th scope=" row">전화번호</th>
						<td><input type="text" class="text" name="tel"
							value="${mb.tel}"></td>
					</tr>
					<tr>
						<th scope=" row">이메일</th>
						<td><input type="text" class="text" name="email"
							value="${mb.email}"></td>
					</tr>
					<tr>
						<th scope=" row">주소</th>

						<td class="address-input">
							<div>
								<input type="text" id="addressInput1" class="text"
									name="address" value="${mb.address}" style="width: 350px;">
								<input type="button" class="btn1"
									onclick="sample4_execDaumPostcode()" value="우편번호찾기"></input>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

			<!--  -->
			<!--  -->
			<!--  -->

			<div class="center" style="margin-top: 40px;">
				<button class="foot_btn " type="submit" style="width: 140px;"
					id="JBtn">회원정보수정</button>
			</div>
		</div>
		<!--  -->
		<!--  -->
		<!--  -->
		<!--  -->
	</form>
</body>

</html>
