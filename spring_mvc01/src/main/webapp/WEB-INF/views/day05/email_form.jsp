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
	<h2>비밀번호 받을 이메일을 넣어주세요</h2>
	<form action="/email_send" method="post">
		<input type="email" name="email"
			pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*"
			title="이메일 양식" required> <input type="submit" value="전송">
	</form>
	<form action="/email_send_chk" method="post"
		onsubmit="return authNum()">
		<input type="number" id="authNumber" name="authNumber"
			placeholder="인증번호" maxlength="6" required> <input
			type="submit" value="전송">
	</form>


	<script type="text/javascript">
		<c:if test="${!empty chkEmail}">
			alert("일치합니다.");
		</c:if>
	
		function authNum() {
			const authNumber = document.querySelector("#authNumber").value;
			// 숫자가 6자리인지 확인
			if(authNumber.length !== 6 || isNaN(authNumber)){
				alert("6자리 숫자만 입력해야 합니다.");
				return false; // 중단
			}
			return true;
		}
	</script>
</body>
</html>