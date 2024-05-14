
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
	text-align: left;
}

.foot_abtn {
	margin-top: 20px;
	padding: 0 15 0 15;
	font-size: 17px;
	font-weight: bold;
	line-height: 38px;
	text-align: center;
	margin-right: 15px;
	border: none;
	background-color: #ffdddd;
	text-decoration: none;
}
}
</style>
</head>
<body>
	<br>
	<div class="cont_title01 " style="width: 75%; margin: auto;">

		<div class="head-title">
			<span>상품 리스트 </span>
		</div>


		<c:if test="${categoryCount == 0}">
			<p>등록된 게시물이 없습니다.</p>

		</c:if>
		<a class="foot_abtn w3-right  w3-margin-bottom"
			href="${pageContext.request.contextPath}/category/menuUpdate">상품등록</a>
		
		<c:if test="${categoryCount > 0}">
			<table class="w3-table w3-bordered w3-hoverable  w3-margin-bottom">
				<tbody>
					<tr>
						<th>상품코드</th>
						<th>상품이름</th>
						<th>상품분류</th>
						<th>상품설명</th>
						<th>상품가격</th>
						<th>상품수량</th>
						<th>상품사진</th>
					</tr>
				</tbody>
				<tbody>
					<c:forEach var="c" items="${list}">



						<tr>
							<td><a
								href="${pageContext.request.contextPath}/category/categoryInfo?cnum=${c.cnum}">${c.cnum}</a></td>
							<td>${c.cname}</td>
							<td>${c.cmenu==1?"베이커리":"드링크"}</td>
							<td>${c.ctext}</td>
							<td>${c.cprice}</td>
							<td>${c.cqty}</td>
							<td>${c.cpicture}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="w3-bar w3-center w3-small">

				<c:if test="${start <= bottomLine}">
					<a href="#" class="w3-button  w3-disabled ">[이전]</a>
				</c:if>
				<c:if test="${start > bottomLine}">

					<a
						href="${pageContext.request.contextPath}/category/categoryList?pageNum=${start-bottomLine}"
						class="w3-button">[이전]</a>
				</c:if>




				<c:forEach var="p" begin="${start}" end="${end}">

					<a
						href="${pageContext.request.contextPath}/category/categoryList?pageNum=${p}"
						class="w3-button   <c:if test="${pageInt==p}"> w3-red  </c:if>">${p}</a>

				</c:forEach>

				<c:if test="${end  >= maxPage}">
					<a href="#" class="w3-button    w3-disabled ">[다음]</a>
				</c:if>
				<c:if test="${end  < maxPage}">

					<a
						href="${pageContext.request.contextPath}/category/categoryList?pageNum=${start+bottomLine}"
						class="w3-button  ">[다음]</a>
				</c:if>


			</div>
		</c:if>
	</div>
</body>
</html>