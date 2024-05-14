<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8" />
            <title>bakeryMain</title>
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
            <!-- Link Swiper's CSS -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />

            <!-- Demo styles -->
            <style>
                html,
                body {
                    position: relative;
                    height: 100%;
                }

                body {
                    background: white;
                    font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
                    font-size: 14px;
                    color: #000;
                    margin: 20px;
                    padding: 0 20px;

                }

                h1 {
                    padding-top: 5rem;
                    text-align: center;
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
                    padding-left: 10rem;
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




            <!--  -->
            <!--  -->
            <!--  -->
            
            
            <div class="cont_title01 " style="width: 75%; margin: auto;">
            	<div class="head-title">
                <span>베이커리</span>
          		</div>

                <div class="flex-div">

                    <c:forEach var="list" items="${list}">
                        <div class="product-container-div" style="width: 25%">
                        <a href="${pageContext.request.contextPath}/category/categoryDetailForm?cnum=${list.cnum}">
							 <img src="${pageContext.request.contextPath}/view/category/img/${list.cpicture}" width="200" height="200" id="pic"></a><br>

                         
                            <table>
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td style="background-color: #FCE7E2 ;">${list.cname}</td>
                                    
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="width: 6rem">${list.cprice}원</td>
                                </tr>
                            </table>
                        </div>
                    </c:forEach>
                </div>
            </div>




            <!--  -->
            <!--  -->
            <!--  -->





        </body>

        </html>