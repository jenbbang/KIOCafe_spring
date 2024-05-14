<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.head-title>span {
	width: 100%;
	height: 100%;
	margin: auto;
	font-size: 32px;
	background: linear-gradient(to top, #ffe4e1 20%, transparent 40%);
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
<script>
	
</script>
</head>

<body>

	<br>
	<br>
	<br>
	<div class="head-title w3-center">
		<span>상품 정보</span>
	</div>
	<br>
	<br>

	<div class="w3-center" style="margin-bottom: 40px;">
		<img
			src="${pageContext.request.contextPath}/view/category/img/${category.cpicture}"
			width="600" height="400" id="pic"><br> <br>

	</div>

	<table class="w3-center w3-margin-bottom"
		style="background-color: #fff; color: #000; width: 700px; margin: auto;">
		<tbody>
			<tr>
				<td>상품코드</td>
				<td>
					<p>${category.cnum}</p>
				</td>
			</tr>
			<tr>
				<td>상품분류</td>
				<td><c:if test="${category.cmenu==0}">
					디저트
				</c:if> <c:if test="${category.cmenu==1}">
					음료
				</c:if></td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td>
					<p>${category.cname}</p>
				</td>
			</tr>
			<tr>
				<td>상품수량</td>
				<td>
					<p>${category.cqty}&nbsp;개</p>
				</td>
			</tr>
			<tr>
				<td>개당가격</td>
				<td>
					<p>${category.cprice}&nbsp;원</p>
				</td>
			</tr>
			<tr>
				<td>글내용</td>
				<td>
					<p>${category.ctext}</p>
				</td>
			</tr>
		</tbody>


	</table>
	<div class="w3-center w3-margin-top">
		<a class="foot_abtn   w3-margin-right"
			style="background-color: #ffdddd;"
			href="${pageContext.request.contextPath}/category/categoryUpdateForm?cnum=${category.cnum}">상품수정</a>
		<a class="foot_abtn  " style="background-color: #ffdddd;"
			href="${pageContext.request.contextPath}/category/categoryDeletePro?cnum=${category.cnum}">상품삭제</a>
	</div>


</body>

</html>