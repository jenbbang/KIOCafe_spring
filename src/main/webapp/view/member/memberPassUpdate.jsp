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
<script>
function passChk(form){
	if(form.chgpass1.value!=form.chgpass2.value){
		alert("변경 비밀번호와 재입력 번호가 다릅니다.")
		form.chgpass2.value="";
		form.chgpass2.focus()
		return false	
	}
	
	return true
}



</script>

</head>
<body>
<div class="cont_title01 " style="width: 30%; margin: auto;">
<form class="w3-container" action="${pageContext.request.contextPath}/member/memberPassPro" method="post" onsubmit="return passChk(this)">
  <br>
  <div class="head-title">
                <span>비밀번호 수정</span>
                <br>     <br>
          		</div>
  <br>
  <p> 
  <label>현재 비밀번호</label>
  <input class="w3-input" type="password" name="pass"></p>
  <p>
   <label>변경 비밀번호</label>
  <input class="w3-input" type="password" name="chgpass1"></p>
    <p>
   <label>변경 비밀번호 재입력</label>
  <input class="w3-input" type="password" name="chgpass2"></p>
  <p>
  <br>
  
  <input class="w3-input w3-pale-red" type="submit" value="확인"></p>
</form>

</div>
</body>
</html>