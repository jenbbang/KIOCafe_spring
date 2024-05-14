<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">
.btn {
	margin-top: 20px;
	padding: 0 15 0 15;
	font-size: 17px;
	font-weight: bold;
	line-height: 38px;
	text-align: center;
	margin-right: 15px;
	border: none;
	background-color: #ffdddd;
	min-width: 98px;
}
.abtn {
	margin-top: 20px;
	padding: 9 15 9 15 !important; 
	font-size: 17px;
	font-weight: bold;
	line-height: 38px;
	text-align: center;
	margin-right: 15px;
	border: none;
	background-color: #ffdddd;
	text-decoration: none;
}</style>
<script>
	function win_upload() {

		var op = "width=500, height=150, left=50, top=150";
		open("${pageContext.request.contextPath}/category/pictureimgForm", "",
				op);

	}
</script>


</head>

<body>

	<form class="w3-container"
		action="${pageContext.request.contextPath}/category/menuUpdatePro"
		name="f" method="post" onsubmit="return inputCheck(this)">
		<input type="hidden" name="cpicture"> <br> <br> <br>
		<h3 class="w3-center">상품 등록</h3>
		<br> <br>

		<div class="w3-center">
			<img src="" width="600" height="400" id="pic"><br> <br>
			<a class="abtn"  href="javascript:win_upload()">사진등록</a>
		</div>
		<br>



		<table class="w3-table w3-bordered"
			style="background-color: #fff; color: #000; width: 700px; margin: auto;">
			<tbody>



				<tr>
					<td>카테고리</td>

					<td><select name="cmenu" style="width: 220px">
							<option value="1" class="w3-center">디저트</option>
							<option value="2" class="w3-center">음료</option>
					</select></td>
				</tr>

				<tr>
					<td>제품이름</td>
					<td><input type="text" name="cname"></td>
				</tr>
				<tr>
					<td>제품코드</td>
					<td><input type="text" name="cnum"></td>
				</tr>
				<tr>
					<td>제품가격</td>
					<td><input type="text" name="cprice">&nbsp;원</td>
				</tr>
				<tr>
					<td>제품수량</td>
					<td><input type="text" name="cqty"></td>
				</tr>
				<tr>
					<td>내용설명</td>
					<td><textarea cols="50" rows="10" name="ctext"></textarea></td>
				</tr>
				<!--  <tr>
            <td>수량</td>
            <td><input type="text" name="cqty"></td>
         </tr> -->
		</table>
		<br>
		<div class="w3-center">

			<!--  <a href="${pageContext.request.contextPath}/view/category/mainpage.jsp">-->
			<input type="submit" class="btn" value="상품 등록">
		</div>
		</tbody>
	</form>

</body>
</html>