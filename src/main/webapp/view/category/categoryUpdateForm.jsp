<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!-- 코어태그가 없으면 c:if 안먹음  -->
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>게시판 수정 화면</title>
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <style type="text/css">
                .btn1 {
                    border: 0px;
                    width: 120px;
                    height: 35px;
                    background-color: #ffdddd;
                    color: white;
                }

                .abtn {
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
                function win_upload() {

                    var op = "width=500, height=150, left=50, top=150";
                    open("${pageContext.request.contextPath}/category/pictureimgForm", "",
                        op);

                    //self.close();

                }
            </script>

        </head>

        <body>

            <form action="<%=request.getContextPath()%>/category/categoryUpdatePro" method="post"
                enctype="multipart/form-data" name="f">
                <input type="hidden" name="cnum" value="${category.cnum}"> <input type="hidden" name="cpicture"
                    value="${category.cpicture}"> <input type="hidden" name="cprice" value="${category.cprice}">
                <table class="w3-table-all " style="width: 70%; margin: auto;">

                    <div class="w3-center w3-margin-top w3-margin-bottom">
                        <img src="${pageContext.request.contextPath}/view/category/img/${category.cpicture}" width="600"
                            height="400" id="pic"><br> <br> <a class="abtn " href="javascript:win_upload()">사진수정</a>
                    </div>
                    <tbody class="" style="margin: auto; width: 100px;">

                        <tr>
                            <td>카테고리</td>

                            <td><select name="cmenu" style="width: 220px">
                                    <option value="1" class="">디저트</option>
                                    <option value="2" class="">음료</option>
                                </select></td>
                        </tr>


                        <tr>
                            <td>상품이름</td>
                            <td><input type="text" name="cname" value="${category.cname}"></td>
                        </tr>

                        <tr>
                            <td>상품코드</td>
                            <td><input type="text" name="cnum" value="${category.cnum}"></td>
                        </tr>

                        <tr>
                            <td>상품가격</td>
                            <td><input type="text" name="cprice" value="${category.cprice}">원</td>
                        </tr>

                        <tr>
                            <td>상품수량</td>
                            <td><input type="text" name="cqty" value="${category.cqty}">개</td>
                        </tr>

                        <tr>
                            <td>내용설명</td>
                            <td><textarea rows="15" name="ctext">${category.ctext }</textarea></td>
                        </tr>

                        <tr>
                            <td class="w3-center" style="padding: 15 0 15 0;" colspan="2"><a class="abtn"
                                    href="javascript:document.f.submit()">상품수정</a></td>
                        </tr>


                    </tbody>
                </table>

            </form>

        </body>

        </html>