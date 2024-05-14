<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
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
</style>
</head>
<html>
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>
<c:if test="${param.id eq 'login'}">
<script> alert("login 하세요")</script>
</c:if>
<c:if test="${param.id eq 'forbidden'}">
<script> alert("금지되어 있습니다.")</script>
</c:if>

<div style="width:800px; margin: auto;">
<form class="w3-container" action="${pageContext.request.contextPath}/member/loginPro" method="post">
  <br>
  <br>
  <br>
  <p>
  <div class="cont_title01 " style="width: 75%; margin: auto;">
 <div class="head-title">
                <span>로그인</span>
                <br>     <br>
          		</div>
  
    
  <label>ID</label>
  <p><input class="w3-input w3-hover-light-gray" type="text" name="id"></p>
  <p>
  <label>Password</label>
  <input class="w3-input w3-hover-light-gray" type="password" name="pass"></p>
  <p style="text-align: center">
  <br>
  <input class="w3-btn w3-pale-red" type="submit" style="width: 100px"   value="확인" ></p>
</div>
</form>
  </div>

</body>
</html> 