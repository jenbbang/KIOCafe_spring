<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Head</title>
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        </head>

        <body>




            <!-- 로고 및 index이동   시작 -->

            <div class="w3-center">
                <a href="${pageContext.request.contextPath}/mainpage"> <img
                        src="${pageContext.request.contextPath}/common/img/kic_project_top_img_last.png"
                        style="width: 100%; height: 300px">
                </a>
            </div>

            <!-- 로고 및 index이동   끝-->

            <!--  -->
            <div style="width: 70%; margin: auto;">
                <!-- 회원가입 로그인 마이페이지 시작 -->

                <p style="font-size: 10px; color: gray; text-align: right;">
                    <c:if test="${sessionScope.id==null}">
                        <a href="${pageContext.request.contextPath}/member/joinForm"
                            style="font-size: 15px">회원가입</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/member/loginForm" style="font-size: 15px">로그인</a>
                    </c:if>

                    <c:if test="${sessionScope.id!=null}">
                        <a href="${pageContext.request.contextPath}/member/logout"
                            style="font-size: 15px">로그아웃</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/member/myaccount" style="font-size: 15px">마이페이지</a>
                    </c:if>
                </p>

                <!-- 회원가입 로그인 마이페이지  끝  -->
            </div>


            <!-- 메뉴바  -->

            <div class="w3-bar w3-middle" style="background-color: #ffeaea;">
                <div style="width: 70%; margin: auto;">

                    <a href="${pageContext.request.contextPath}/mainpage" class="w3-bar-item w3-button">HOME</a>
                    <div class="w3-dropdown-hover">
                        <button class="w3-button  ">카테고리</button>
                        <div class="w3-dropdown-content w3-bar-block w3-card-4">

                            <c:if test="${sessionScope.id=='admin' and sessionScope.id!=null}">
                                <a href="${pageContext.request.contextPath}/category/categoryList"
                                    class="w3-bar-item w3-button">상품리스트</a>
                            </c:if>
                            <a href="${pageContext.request.contextPath}/category/bakeryMain"
                                class="w3-bar-item w3-button">베이커리</a> <a
                                href="${pageContext.request.contextPath}/category/drinkMain"
                                class="w3-bar-item w3-button">드링크</a>
                        </div>
                    </div>



                    <div class="w3-dropdown-hover">
                        <button class="w3-button  ">장바구니</button>
                        <div class="w3-dropdown-content w3-bar-block w3-card-4">
                            <a href="${pageContext.request.contextPath}/cart/cartList"
                                class="w3-bar-item w3-button">장바구니</a> <a
                                href="${pageContext.request.contextPath}/cart/orderList"
                                class="w3-bar-item w3-button">결제란</a>
                        </div>
                    </div>

                    <a href="${pageContext.request.contextPath}/order/myOrderListInfo"
                        class="w3-bar-item w3-button">주문조회</a>

                </div>
            </div>
            <!-- 메뉴바  끝-->

        </body>




























        </html>