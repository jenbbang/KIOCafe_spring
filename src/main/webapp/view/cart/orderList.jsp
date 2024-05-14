<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<title>t</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script defer>
                function sample4_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function (data) {
                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var roadAddr = data.roadAddress; // 도로명 주소 변수
                            var extraRoadAddr = ''; // 참고 항목 변수
                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.

                            // console.log(data.buildingName);

                            if (data.bname !== '' && /[동|로|가]$/g.order - (data.bname)) {
                                extraRoadAddr += data.bname;
                            }
                            console.log(data);
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
                                + data.zonecode + ")" + inputAddress;
                        }
                    }).open();
                }
                $(document).ready(
                    function () {
                        let dtotal = $('[name="dtotal"]').val();
                        let dtotalLength = $("input[name=dtotal]").length;

                        let totalPrice = 0;
                        for (let i = 0; i < dtotalLength; i++) {
                            totalPrice = parseInt(totalPrice)
                                + parseInt($("input[name='dtotal']").eq(i).attr(
                                    "value"));
                        }
                        function numberWithCommas(x) {
                            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                        }

                        $("#payPrice").text(numberWithCommas(totalPrice) + "원");
                        $("#orderPrice").text(numberWithCommas(totalPrice) + "원");
                        $("#lastPrice").text(numberWithCommas(totalPrice) + "원");
                    });
            	$(function() {
            		$('#confirm').click(function() {
            			console.log("hi")
            			if ($('#inputName1').val() == "") {
            				alert("주문하시는분 이름을 입력해주세요");
            				$('#inputName1').focus();
            				return false;
            			} else if ($('#inputTel1').val() == "") {
            				alert("주문하시는분 휴대폰 번호를 입력해주세요");
            				$('#inputTel1').focus();
            				return false;
            			} else if ($('#inputName2').val() == "") {
            				alert("이름을 입력해주세요");
            				$('#inputName2').focus();
            				return false;
            			} else if ($('#inputTel2').val() == "") {
            				alert("받으시는분 휴대폰 번호를 입력해주세요");
            				$('#inputTel2').focus();
            				return false;
            			
            			} else if ($('#inputAddress').val() == "") {
            				alert("받으시는분 주소를 입력해주세요");
            				$('#inputAddress').focus();
            				return false;
            			} else if (!$('input:radio[name=dpaym]').is(':checked')) {
            				alert("결제방식을 선택해주세요"); 
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

table {
	width: 100%;
}

div {
	box-sizing: border-box;
}

.order-table {
	margin-bottom: 40px;
}

.order-table>thead {
	border-left: 1px solid grey;
	background: w3-sand;
	color: #fff;
	text-align: center;
}

.product td:nth-child(n+2) {
	padding: 23px 0;
	border-left: 1px solid white;
	border-bottom: 1px solid white;
	background: w3-sand;
	text-align: center;
}

.product td {
	padding: 23px 0;
}

th {
	padding: 21px 0;
	border-left: 1px solid white;
	background: #ffe4e1;
	color: black;
}

td {
	border-left: 1px solid #eaeaea;
	border-bottom: 1px solid #eaeaea;
	background: w3-sand;
}

img {
	float: left;
	width: 100px;
	padding-left: 20px;
	margin-right: 20px;
}

.txt {
	padding-left: 0px;
	padding-right: 160px;
	font-weight: 500;
	line-height: 22px;
}

.orderPrice {
	font-size: 15px;
	margin-top: 10px;
	margin-left: 0em;
	background-color: w3-sand;
	display: flex;
	justify-content: space-between;
}

.orderPrice>div:nth-child(-n+3) {
	border-top: black solid 1px;
	border-bottom: #d9d9d9 solid 1px;
	min-width: 326px;
	height: 84px;
}

.orderPrice>div:nth-child(2) {
	/* border-left: 1px solid #d9d9d9;
            border-right: 1px solid #d9d9d9; */
	outline: 1px black;
}

.orderPrice-head>div>button {
	width: 55px;
	background-color: black;
}

.orderPrice-middle {
	display: inline-flex;
	justify-content: space-around;
}

.orderPrice-middle>div>button {
	padding: 0px;
	margin-left: 10px;
}

.cart_total {
	display: table;
	table-layout: fixed;
	width: 100%;
	margin-top: 40px;
	border-top: 1px solid #b5babd;
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
	background-color: #FFEAEA;
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

.order-div1 {
	background-color: #fdfdf8;
	width: 100%;
	margin: auto;
	display: flex;
	justify-content: space-between;
	margin: auto;
	border-top: #d9d9d9 1px solid;
	border-bottom: #d9d9d9 1px solid;
}

.order-div2>.head-box {
	outline: 1px #d9d9d9 solid;
}

.space-between {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
	margin-bottom: 10px;
	padding-left: 30px;
	padding-right: 30px;
}

.head-box {
	padding: 20px;
	height: 80px;
	border-top: 1px #d9d9d9 solid;
	border-bottom: 1px #d9d9d9 solid;
	display: flex;
	justify-content: space-between;
}

.coupton-btn {
	margin-top: 20px;
}

.order-div1>div {
	width: 100%;
	font-size: 15px;
}

.price-input {
	text-align: right;
	padding: 10px;
	width: 115px;
	height: 37px;
}

.order-div13 {
	
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vm;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.myaddress-modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	position: absolute;
	top: calc(50vh - 100px);
	left: calc(50vw - 200px);
	background-color: white;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 10px;
	width: 400px;
	height: 200px;
}

input[type="checkbox"] {
	margin-right: 5px;
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
	font-weight: bold;
	background: linear-gradient(to top, #ffe4e1 20%, transparent 40%);
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
	background-color: #ffdddd
}
</style>


<script>

            </script>
</head>

<body>
	<!--  -->




	<div class=" " style="width: 75%; margin: auto;">
		<div class="head-title">
			<span>주문작성 & 결제</span> <br> <br> <br>
			<div class="modal">asdasdsda</div>
			<form method="post" name="form">

				<table class="order-table">
					<thead>
						<tr>
							<th>상품명/옵션</th>
							<th>배송수단</th>
							<th style="width: 100px;">수량</th>
							<th>상품가</th>
							<th>주문금액</th>
							<th>배송비</th>
						</tr>
					</thead>
					<tbody>
						<!--  -->
						<c:forEach var="c" items="${list }">
							<tr class="product">
								<td>
									<div>
										<img
											src="<%=request.getContextPath()%>/view/cart/img/${c.dpicture}"
											alt="">
									</div>
									<div class="txt">
										<p>${c.dname }</p>
									</div>
								</td>
								<td>대전배송</td>
								<td>${c.dqty }</td>
								<td>${c.dprice }</td>
								<td>${c.dtotal }원</td>
								<td>0원</td>
							</tr>

							<input type="hidden" value="${c.dnum}" name="dnum">
							<input type="hidden" value="${c.dname}" name="dname">
							<input type="hidden" value="${c.dqty }" name="dqty">
							<input type="hidden" value="${c.dprice}" name="dprice">
							<input type="hidden" value="${c.dtotal }" name="dtotal">

							<input type="hidden" class="w3-check" id="${did}" value="1"
								name="did" />

						</c:forEach>
						<input type="hidden" value="${c.dpay}" name="dpay">


						<!--  -->
						<!--  -->

						<!--  -->
					</tbody>
				</table>
				<!--  -->
				<div class="order-div1">
					<div class="order-div11">
						<div class="head-box">
							<label for="">주문금액</label> <span id="orderPrice">16,000</span>
						</div>
					</div>
					<!--  -->
					<div class="order-div2">
						<div class="head-box">
							<label for="">할인금액</label> <span>0</span>
						</div>

					</div>
					<!--  -->
					<div class="order-div13">
						<div class="head-box">
							<label for="">결제예정금액</label> <span id="payPrice">0</span>
						</div>
					</div>
				</div>
				<!--  -->
				<!--  -->
				<!--  -->
				<br>
				<div class="head-title"
					style="text-align: left; margin-bottom: 10px;">

					<span style="font-size: 25px;">주문하시는분 (보내시는분)</span>
				</div>

				<table class="board_write">
					<colgroup>
						<col style="width: 175px">
						<col>
					</colgroup>
					<tbody>
						<tr class="bd_top">
							<th scope="row">이름</th>
							<td><input type="text" id="inputName1" readonly="readonly" class="text"
								style="width: 200px;" value="${mb.name}"></td>
						</tr>
						<tr>
							<th scope="row">휴대폰번호</th>
							<td><input type="text" id="inputTel1"  readonly="readonly" class="text"
								value="${mb.tel}" numberonly="true" maxlength="20" value=""
								placeholder="휴대폰 입력 (숫자만)"></td>
						</tr>
					</tbody>
				</table>
				<!--  -->
				<!--  -->
				<!--  -->
				<div class="head-title"
					style="text-align: left; margin-bottom: 10px;">
					<span style="font-size: 25px;">받으시는분 (상품받으실분)</span>
					<!-- <input type="checkbox" style="margin: 5px;"> <span style="font-size: 14px;">주문자 정보와 동일</span> -->

				</div>
				<table class="board_write">
					<colgroup>
						<col style="width: 172px">
						<col>
					</colgroup>
					<tbody>
						<!--            <tr class="bd_top">
                                    <th scope="row">배송지</th>
                                    <td><label for=""> <input type="radio" class="text">새로
                                            입력
                                        </label>
                                        <button class="btn1" style="margin-left: 10px;"
                                            onclick="openAddressModal()">나의배송지</button>
                                    </td>
                                </tr> -->
						<tr>
							<th scope="row">받으시는분</th>
							<td><input type="text" class="text" id="inputName2"
								style="width: 200px;" value="${mb.name}"></td>
						</tr>
						<tr>
							<th scope="row">휴대폰번호</th>
							<td><input type="text" id="inputTel2" class="text"
								numberonly="true" maxlength="20" value="${mb.tel}"
								placeholder="휴대폰 입력 (숫자만)"></td>
						</tr>

						<tr>
							<th scope="row">주소</th>
							<td class="address-input">
								<div>
									<input type="text" id="inputAddress" class="text"
										name="daddress" value="${mb.address}" style="width: 350px;">
									<input type="button" class="btn1"
										onclick="sample4_execDaumPostcode()" value="우편번호찾기"></input>
								</div>

							</td>
						</tr>
						<tr>
							<th scope="row">주문시요청사항</th>
							<td><input type="text" class="text" style="width: 200px;">
							</td>
						</tr>

					</tbody>
				</table>
				<!--  -->
				<!--  -->
				<!--  -->
				<div class="head-title"
					style="text-align: left; margin-bottom: 10px;">

					<span style="font-size: 25px;">결제선택</span>
				</div>

				<table class="board_write ">
					<colgroup>
						<col style="width: 172px">
						<col>
					</colgroup>
					<tbody>
						<tr class="bd_top">
							<th scope="row">총 결제금액</th>
							<td style="padding: 15px"><span class="price" id="lastPrice"></span>
							</td>
						</tr>
						<tr>
							<th scope="row">결제방법</th>
							<td style="padding: 15px"><input type='radio' name='dpaym'
								value="0" style="margin-right: 5px;" /><label>무통장입금</label> <input
								type='radio' name='dpaym' value="1"
								style="margin-right: 5px; margin-left: 15px;" /><label>신용카드</label>
							</td>
						</tr>
					</tbody>
				</table>


				<div class="center" style="margin: 30px; font-size: 12px;">
					<!-- 20181011 joonyus 조건추가-->
					<label><input type="checkbox"><span></span><i>(필수)
							결제서비스 약관에 동의하며, 원활한 배송을 위한 개인정보 제공에 동의합니다.</i></label> <a href="javascript:;"
						class="openClause">[약관보기]</a>
				</div>
				<div class="center" style="margin: 30px;">
					<div>
						<input class="foot_btn" id="confirm" style="margin-bottom: 10px;"
							type="submit" value="결제진행"
							onclick="javascript: form.action='${pageContext.request.contextPath}/order/payment';" />

						<input class="foot_btn" type="submit" value="주문취소"
							onclick="javascript: form.action='${pageContext.request.contextPath}/cart/cancleOrder';" />

					</div>
				</div>
			</form>
		</div>
	</div>
</body>

</html>