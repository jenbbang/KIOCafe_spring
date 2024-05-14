<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">

            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
                crossorigin="anonymous">
            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
            <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/view/cart/css/cartlist.css"> --%>

                <title>Document</title>

                <script defer>
                    /* 가격 콤마 찍는 함수 */
                    function numberWithCommas(x) {
                        return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                    }

                    function getClickIdFunc(id) {
                        let sendId = 0; // 001, 002 같은 id 담을 변수
                        // 클릭한 id값이 plus/minus 인지 구별
                        if (id.includes("plus")) {
                            sendId = id.substr(4);
                            plusQtxFunc(sendId);
                        }
                        if (id.includes("minus")) {
                            sendId = id.substr(5);
                            minusQtxFunc(sendId);
                        }
                    }

                    function plusQtxFunc(id) {
                        let price = $("#price" + id).text();
                        let qtx = $("#qtx" + id).text();
                        $("#qtx" + id).text(parseInt(qtx) + 1);
                        $("#qtx" + id).val(parseInt(qtx) + 1);
                        console.log("qtx " + id);
                        let nowQtx = $("#qtx" + id).text();
                        priceMulFunc(id, price, nowQtx);
                        checkBoxValueOnOff(id);
                        allPriceSum();
                    }

                    function minusQtxFunc(id) {
                        let price = $("#price" + id).text();
                        let qtx = $("#qtx" + id).text();
                        if (qtx != 0) {
                            $("#qtx" + id).text(parseInt(qtx) - 1);
                            $("#qtx" + id).val(parseInt(qtx) - 1);
                            let nowQtx = $("#qtx" + id).text();
                            priceMulFunc(id, price, nowQtx);
                            checkBoxValueOnOff(id);
                            allPriceSum();
                        }
                    }

                    function priceMulFunc(id, price, qtx) {

                        $("#priceMul" + id).text(parseInt(price) * parseInt(qtx));
                        $("#viewPriceMul" + id).text(
                            numberWithCommas(parseInt(price) * parseInt(qtx)));

                        $('#qtx').val(parseInt(qtx));
                        /* console.log ("priceMul : "  + $("#priceMul" + id).text()); */
                        $("#priceMul" + id).text(parseInt(price) * parseInt(qtx));
                    }

                    function allPriceSum() {

                        let totalPrice = document.getElementsByName("dtotal");
                        let priceSumResult = 0;

                        for (let i = 0; i < totalPrice.length; i++) {
                            /* console.log("dtotal : [" + i + " ]"
                                    + document.getElementsByName("dtotal")[i].value); */
                            if (document.getElementsByName("dtotal")[i].value == "") {
                                priceSumResult += 0;
                            } else {
                                priceSumResult += parseInt(document.getElementsByName("dtotal")[i].value);
                            }

                        }
                        // console.log("priceSumResult :  " + priceSumResult)

                        $("#allPrice").text(numberWithCommas(priceSumResult));
                    }

                    /*  */
                    /*  */
                    /*  */

                    function checkBoxValueOnOff(id) {
                        // console.log(" checkBoxValueOnOff ");

                        let chBoxCheckState = document.getElementById(id);
                        let chQtx = $("#qtx" + id).val()

                        // console.log(" dtotal.val(); : " + $("#dtotalInput" + id).val());
                        if (chBoxCheckState.checked == true) {
                            chBoxCheckState.value = id;

                            //console.log("price Mul : " + $("#priceMul" + id).val());

                            $("#dtotalInput" + id).val($("#priceMul" + id).text());
                            $("#qtxInput" + id).val($("#qtx" + id).text());

                        } else {
                            console.log(chQtx);
                            chBoxCheckState.value = "";
                            $("#qtxInput" + id).val("");
                            $("#dtotalInput" + id).val("");
                        }

                        allPriceSum();
                    }
                    function checkConfrim() {
                        if ($(".classCheckConfirm:checked").length == 0) {

                            alert("결제하실 제품을 체크해주세요")
                            window.location.href = `${window.location.href}/cart/cartList`;

                        }else{
                        	 form.action='${pageContext.request.contextPath}/cart/cartUpdatePro';
                        }



                    }
                    function checkAll() {
                        let allCheck = document.getElementById("allCheck");
                        let checkBoxAll = document.getElementsByName("did");

                        if (allCheck.checked == true) {
                            for (let i = 0; i < checkBoxAll.length; i++) {
                                checkBoxAll[i].checked = true;
                                checkBoxValueOnOff(checkBoxAll[i].getAttribute("id"));
                            }

                        } else {
                            for (let i = 0; i < checkBoxAll.length; i++) {
                                checkBoxAll[i].checked = false;
                                checkBoxValueOnOff(checkBoxAll[i].getAttribute("id"));
                            }
                        }
                    }

                    // ctx001 상품 개수, price001 상품 가격, priceMul001 1상품 합계

                    // this.id를 이용해 클릭한 id값 id에 담아주는 함수

                    jQuery(document)
                        .ready(
                            function () {

                                let getDid = "";
                                let getMulPrice = "";
                                let getPrice = "";
                                let commaMulPrice = "";
                                let commaPrice = "";
                                for (let i = 0; i < $('[name="did"]').length; i++) {
                                    getDid = $('[name="did"]').eq(i).attr("id");

                                    getMulPrice = $("#viewPriceMul" + getDid).text();
                                    commaMulPrice = numberWithCommas(getMulPrice);
                                    $("#viewPriceMul" + getDid).text(commaMulPrice);

                                    getPrice = $("#price" + getDid).text();
                                    commaPrice = numberWithCommas(getPrice);
                                    $("#price1" + getDid).text(commaPrice);

                                }
                                let totalPrice = document.getElementsByName("0");
                                let priceSumResult = 0;
                                /* 
                                 for (let i = 0; i < totalPrice.length; i++) {
                                     priceSumResult += parseInt(totalPrice[i].innerHTML);
                                 }
                                 $("#allPrice").text(priceSumResult);
                                 */

                                $('.plusA-btn')
                                    .click(
                                        function () {

                                            ;
                                            // var id = $('#inputId').val(); //id값이 "id"인 입력란의 값을 저장
                                            let clickBtnId = $(this).attr("id");
                                            let idNum = "";

                                            idNum = clickBtnId.substr(4);

                                            console.log("idNum : " + idNum);

                                            $
                                                .ajax({
                                                    url: '${pageContext.request.contextPath}/category/categoryQtySelectOne', //Controller에서 요청 받을 주소
                                                    type: 'post', //POST 방식으로 전달
                                                    data: {
                                                        dnum: idNum
                                                        // 클릭한 아이디 전달
                                                    },
                                                    success: function (cqty) { //컨트롤러에서 넘어온 cnt값을 받는다
                                                        let qtx = $(
                                                            "#qtx"
                                                            + idNum)
                                                            .text();
                                                        console
                                                            .log("qtx : "
                                                                + qtx);
                                                        console
                                                            .log("cqty : "
                                                                + cqty);

                                                        if (parseInt(qtx) > parseInt(cqty)) {
                                                            $(
                                                                "#qtx"
                                                                + idNum)
                                                                .text(
                                                                    qtx - 1);
                                                            alert("최대 수량입니다")
                                                        } else {

                                                        }
                                                    },
                                                    error: function () {
                                                        // alert("에러입니다");
                                                    }
                                                });

                                        })
                            });
                </script>
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
                        text-align: left;
                    }

                    .productATotalPrice {
                        display: none;
                    }

                    .price {
                        display: none;
                    }

                    table {
                        text-align: center;
                        margin: 0px;
                    }

                    tr {
                        border-top: 1px solid #ffe4e1;
                        border-bottom: 1px solid #ffe4e1;
                    }

                    th,
                    td {
                        align-items: center;
                        min-width: 100px;
                        text-align: center;
                        vertical-align: middle;
                    }

                    td:not(.btn-td) {
                        line-height: 165px;
                    }

                    img {
                        width: 150px;
                    }

                    .count {
                        height: 28px;
                    }

                    .count-btn {
                        width: 45px;
                        height: 35px;
                        display: block;
                        display: flex;
                        align-items: center;
                    }

                    .up {
                        background-image: url('./img/up.png');
                    }

                    .down {
                        background-image: url('./img/down.png');
                    }

                    .checkbox {
                        position: absolute;
                        bottom: 3px;
                    }

                    /*  */
                    .pay-div {
                        width: 70%;
                        margin: auto;
                        display: flex;
                        justify-content: end;
                        border: 1px #e988b4 solid;
                        border-radius: 6px;
                        margin-top: 45px;
                        padding-top: 15px;
                        padding-bottom: 10px;
                    }

                    .pay-div>h4 {
                        margin-right: 10px;
                    }

                    .foot_btn {
                        padding: 0 15 0 15;
                        font-size: 17px;
                        font-weight: bold;
                        line-height: 38px;
                        text-align: center;
                        margin-right: 15px;
                        border: none;
                        background-color: #ffdddd
                    }


                    button {
                        background: #fcfcfb;
                    }
                </style>

        </head>

        <body>
            <form method="post" name="form">

                <div class="cont_title01 " style="width: 75%; margin: auto;">
                    <div class="head-title">
                        <span>빵바구니</span> <br> <br>
                    </div>

                    <div style="display: flex; justify-content: space-between;">

                        <!-- <div>
                    <span>전체선택</span> <input type="checkbox" id="allCheck"
                        class="w3-check" onclick="checkAll()">
                </div> -->

                    </div>
                    <table class="w3-table " style="width: 95%; margin-left: 30px;">
                        <!--  -->
                        <thead>
                            <tr>
                                <th scope="col" style="text-align: center; vertical-align: middle;">
                                    <div>
                                        <span>전체선택</span> <input type="checkbox" id="allCheck" class="w3-check"
                                            onclick="checkAll()">
                                    </div>
                                </th>
                                <th scope="col" style="text-align: center; vertical-align: middle;">이미지</th>
                                <th scope="col" style="text-align: center; vertical-align: middle;">제품코드</th>
                                <th scope="col" style="text-align: center; vertical-align: middle;">제품명</th>
                                <th scope="col" style="text-align: center; vertical-align: middle;">개당가격</th>
                                <th scope="col" style="text-align: center; vertical-align: middle;">구매수량</th>
                                <th scope="col" style="text-align: center; vertical-align: middle;">합계</th>
                            </tr>
                        </thead>
                        <!--  -->

                        <tbody style="text-align: center; vertical-align: middle;">
                            <c:forEach var="c" items="${list }">

                                <tr>
                                    <td style="text-align: center; vertical-align: middle;"><span>
                                            <input type="checkbox" class="w3-check classCheckConfirm" id="${c.dnum}"
                                                value="" name="did" onclick="checkBoxValueOnOff(this.id)">
                                        </span></td>

                                    <td style="text-align: center; vertical-align: middle;"><img
                                            src="<%=request.getContextPath()%>/view/cart/img/${c.dpicture}" alt=""></td>


                                    <td style="text-align: center; vertical-align: middle;"><span>${c.dnum }</span>
                                    </td>
                                    <td style="text-align: center; vertical-align: middle;"><span>${c.dname }</span>
                                    </td>


                                    <td style="text-align: center; vertical-align: middle;"><span class="price"
                                            id="price${c.dnum}">${c.dprice }</span> <span
                                            id="price1${c.dnum}">${c.dprice }</span></td>
                                    <!--  -->


                                    <td class="btn-td" style="text-align: center; vertical-align: middle;"><span
                                            style="text-align: center; vertical-align: middle;">
                                            <button type="button" class="w3-button w3-white minusA-btn  count-btn"
                                                id="minus${c.dnum}" onclick="getClickIdFunc(this.id)"
                                                style="border: 1px black solid; border-radius: 8px;">
                                                <span>-</span>
                                            </button> <span class="count productA-cnt-p" style="text-align: center"
                                                id="qtx${c.dnum }">${c.dqty }</span> <input type="hidden"
                                                id="qtxInput${c.dnum}" value="" name="dqty">

                                            <button type="button" class="w3-button w3-white plusA-btn   count-btn"
                                                id="plus${c.dnum}" onclick="getClickIdFunc(this.id)"
                                                style="border: 1px black solid; border-radius: 8px;">
                                                <span>+</span>
                                            </button>
                                        </span></td>
                                    <!--  -->
                                    <td style="text-align: center; vertical-align: middle;"><span
                                            class="productATotalPrice" id="priceMul${c.dnum}">${c.dtotal}</span>
                                        <span class="productATotalPrice1" id="viewPriceMul${c.dnum}"
                                            name="viewPriceMul">${c.dtotal}</span> <input type="hidden"
                                            id="dtotalInput${c.dnum}" value="" name="dtotal">
                                    </td>

                                </tr>

                            </c:forEach>
                        </tbody>
                    </table>

                </div>
                </div>
                <div>
                    <div class="pay-div">
                        <h4 class="pay-p allPrice" style="font-size: 25px; margin-top: 5px; font-weight: 400;">
                            상품금액 : <span id="allPrice" style="font-size: 25px; font-weight: 400;">0</span>
                        </h4>
                        <div style="text-align: center; vertical-align: middle;">

                            <input type="hidden" id="${c.dpay }" value="0" name="dpay">


                            <input class="foot_btn w3-right " type="submit" value="삭제"
                                onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cartDelete';" />

                            <input class="foot_btn " type="submit" value="결제"
                                onclick="checkConfrim(); " />


                        </div>
                    </div>

                </div>


            </form>

        </body>




        </html>