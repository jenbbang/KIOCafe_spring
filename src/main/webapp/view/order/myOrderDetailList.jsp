
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
<style type="text/css">
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
}

tr {
	border-bottom: 1px solid #ffe4e1;
}

th, td {
	text-align: center !important
}
</style>
<script>
	history.replaceState({}, numm, location.pathname);
</script>
</head>
<body>
	<br>
	<div class="cont_title01 " style="width: 75%; margin: auto;">
		<div class="head-title">
			<span>주문상세현황</span> <br> <br>
		</div>



		<table class="w3-table w3-bordered w3-hoverable">

			<tbody>
				<tr>
					<th>제품번호</th>
					<th>제품명</th>
					<th>개당가격</th>
					<th>구매수량</th>
					<th>총가격</th>
				</tr>
			</tbody>
			<tbody>
				<c:forEach var="c" items="${list}">

					<tr>
						<td><span> ${c.dnum}</span></td>
						<td><span> ${c.dname } </span></td>
						<td><span> ${c.dprice}</span>원</td>
						<td><span> ${c.dqty }</span></td>
						<td><span> ${c.dtotal}</span>원</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

	</div>
</body>
</html>