<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="email">
	<header>
	</header>
	<main>
		<div id="emailchk_container">	
			<h3 class="h3">받은 이메일의 인증번호을 넣어주세요</h3>
			<form id="numform" method="post">
				<input type="number" id="authNumber" name="authNumber"
					placeholder="인증번호" maxlength="6" required> 
				<input type="hidden" name="u_id" value="${lvo.u_id}">
				<input type="hidden" name="u_pw" value="${lvo.u_pw}">
				<input type="hidden" name="u_na" value="${lvo.u_na}">
				<input type="hidden" name="u_phone" value="${lvo.u_phone}">
				<input type="hidden" name="u_gen" value="${lvo.u_gen}">
				<input type="hidden" name="u_bir" value="${lvo.u_bir}">
				<input type="hidden" name="u_em" value="${lvo.u_em}">
				<input type="button" id="btn" value="전송">
			</form>
		</div>	
	</main>
	<footer>
	</footer>

</div>	
	<script type="text/javascript">
		document.getElementById("btn").addEventListener("click",function(){
			const authNum = document.getElementById("authNumber").value;
			if(authNum == ${randomNumber}){ // randomNumber 변수명이 달라 오류
				document.getElementById("numform").action = "/joinOK";
				document.getElementById("numform").submit(); // submit의 대상인 form 을 명시하지 않아서 오류
			} else{
				alert("인증번호가 다릅니다.");
			}
			
		})
		/* function authnumchk() {
			
		} */
	</script>

</body>
</html>