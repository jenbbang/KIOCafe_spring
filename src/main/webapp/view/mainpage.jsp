<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<meta http-equiv="refresh"
	content="0; url=<%=request.getContextPath()%>/mainpage"></meta>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>카테고리 메인창</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

<!-- Demo styles -->
<style>
html, body {
	position: relative;
	height: 100%;
}

body {
	background: write;
	font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
	font-size: 14px;
	color: write;
	margin: 0;
	padding: 0;
}


.swiper {
	width: 100%;
	height: 80%;
	position: relative;
	z-index: -1;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

/*       .swiper-slide>a>img {
        display: block;
        width: 100%;
        height: 70%;
        object-fit: cover;
      } */
#wrapper {
   max-width: 1000px;
   margin: 0 auto;
   border: 2px solid white;
   border-radius: 6px;
   position: relative;
   z-index: 0;
}

/* span {
	font-weight: bold;

	color: black;
	text-decoration: underline;
} */
.div-center {
	position: relative;
	top: 50%;
}

table {
	margin: 0.6rem auto;
}

td>img {
	width: 20%;
	padding-left: 6rem;
}

/* 추천 메뉴 사진 위치 조정 left right 로 조정  */
.slideitem {
	position: relative;
	text-align: center;
	left: 94px;
	right: 0px;
}

/* ------------------------------------------------------- */
h2 {
	padding-top: 5rem;
	text-align: center;
}

.line {
	border: 0.3rem solid;
	border-color: #F9BFAB;
	border-top: 0;
	border-left: 0;
	border-right: 0;
	width: 10rem;
	margin: auto;
	margin-bottom: 6rem;
}

.product-container-div {
	padding: 0px 12px 60px 12px;
}

.product-div {
	border: 1px solid #e2e2e2;
	border-radius: 8px;
}

.product-div>img {
	width: 100%;
}

table {
	margin: 0.6rem auto;
}

.title {
	border-color: #FCE7E2;
}

td>img {
	width: 25%;
	padding-left: 6rem;
	object-fit: contain;
}

.border_space {
	margin-top: 18rem;
}

.flex-div {
	display: flex;
	width: 1200px;
	margin: auto;
	flex-wrap: wrap;
}

.product-container-div {
	padding: 0px 12px 60px 12px;
}

.product-div {
	border: 1px solid #e2e2e2;
	border-radius: 8px;
}

.product-div>img {
	width: 100%;
}

table {
	margin: 0.6rem auto;
}

.title {
	border-color: #FCE7E2;
}

td>img {
	width: 25%;
	padding-left: 6rem;
	object-fit: contain;
}

.border_space {
	margin-top: 18rem;
}

.flex-div {
	display: flex;
	width: 1200px;
	margin: auto;
	flex-wrap: wrap;
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
</style>
</head>

<body>

	<div class="cont_title01 " style="width: 75%; margin: auto;">
		<div id="wrapper">
			<div class="head-title">
				<span>메인페이지</span>
			</div>

			<!-- Swiper -->
			<div class="swiper mySwiper">
				<div class="swiper-wrapper">
					<div class="swiper-slide">
						<a href="${pageContext.request.contextPath}/category/bakeryMain">
							<div class="w3-display-container">
								<img
									src="<%=request.getContextPath()%>/view/bakery_main_img1.png"
									alt="Lights" style="width: 100%; height: 80%;">
							</div>
						</a>
					</div>
					<div class="swiper-slide">
						<a href="${pageContext.request.contextPath}/category/drinkMain">

							<div class="w3-display-container">
								<img src="<%=request.getContextPath()%>/view/drink_main_img1.png"
									alt="Lights" style="width: 100%; height: 80%;">
							</div>
						</a>
					</div>

				</div>
				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div>
				<div class="swiper-pagination"></div>
			</div>


			<div class="flex-div">
				<!-- 관리자 영역================================================================================= -->

				<div class="flex-div"></div>

				<c:if test="${boardCount == 0}">
					<p>등록된 게시물이 없습니다.</p>
				</c:if>

			</div>



			<!-- ============================================================================================================ -->


			<!-- Swiper JS -->
			<script
				src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

			<!-- Initialize Swiper -->
			<script>
				var swiper = new Swiper(".mySwiper", {
					cssMode : true,
					navigation : {
						nextEl : ".swiper-button-next",
						prevEl : ".swiper-button-prev",
					},
					pagination : {
						el : ".swiper-pagination",
					},
					mousewheel : true,
					keyboard : true,
				});
			</script>
</body>

</html>