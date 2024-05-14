
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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



</style>
</head>
<body>


<form class="w3-container w3-center" style="width:400px; margin: auto;" action="${pageContext.request.contextPath}/member/memberDeletePro" method="post">
 <br>
 <div class="cont_title01 " style="width: 120%; margin: auto;">
 <div class="head-title">
                <span>회원탈퇴</span>
                <br>     <br>
          		</div>


  <p>
  
  <input class="w3-input" type="password" name="pass" placeholder="탈퇴를 원하시면, 비밀번호를 입력해주세요."></p>
  <p class="w3-center">
  <br>
  <input class="w3-btn w3-pale-red" type="submit" style="width: 100px"  value="확인"> &nbsp;&nbsp;&nbsp;
  <input class="w3-btn w3-pale-red" type="button" style="width: 100px" value="취소" onClick="window.history.back();"></p>
</div>
</form>

</body>
</html>