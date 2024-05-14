
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
<style>
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
	text-align: center;
}

tr {
	border-bottom: 1px solid #ffe4e1;
}

th, td {
	text-align: center !important
}
</style>
<script>
	
</script>
</head>

<body>
	<br>
	<div class="cont_title01 " style="width: 75%; margin: auto;">
		<div class="head-title">
			<span>주문현황</span> <br> <br>
		</div>


		<table class="w3-table w3-bordered w3-hoverable">

			<tbody>
				<tr>
					<th>주문번호</th>
					<th>주문날짜</th>
					<th>제품명</th>
					<th>구매수량</th>
					<th>총가격</th>
					<th>배송지</th>
				</tr>
			</tbody>
			<tbody>
				<c:forEach var="c" items="${list}">
					<tr style="cursor: pointer"
						onclick="javascript:location.href='${pageContext.request.contextPath}/order/myOrderDetailList?orderId=${c.ORDERID}'">
						<!-- <tr onclick="location.href"='naver.com';"> -->
						<td><span> ${c.ORDERID}</span></td>
						<td><span> ${c.ORDERDATE}</span></td>
						<td><span> ${c.DNAME } <c:if test="${c.COUNT > 1}"> 외 
								 ${c.COUNT}개 </c:if>
						</span></td>
						<td><span> ${c.DQTY }</span></td>
						<td><span> ${c.DPRICE}</span>원</td>
						<td><span> ${c.DADDRESS}</span></td>
						</a>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>
</body>
</html>