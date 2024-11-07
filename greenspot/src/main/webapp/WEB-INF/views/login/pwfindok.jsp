<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="logincss/pwfindok.css">

<title>Insert title here</title>
</head>
<body>
	<div id="idfind">
		<header> </header>


		<main>
			<div class="idfind_container">
				<div id="box">
					<h3 class="h3">비밀번호 변경</h3>
					<form id="input_form" action="/pwupdate" method="post">
						<input type="password" placeholder="비밀번호를 입력하세요" name="u_pw" id="pwinput" class="width100"
						pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*[0-9])[A-Za-z\d!@#$%^&*]{8,15}$">
						<input type="hidden" name="u_id" value="${u_id }">
						<span id="pwtest"></span>
						<input type="submit" value="입 력" id="user_id" class="width100">
					</form>
					
					<div id="gobutton">
						<input type="button" value="로그인으로 가기" class="login go" onclick="location.href='/loginGo'">
						<input type="button" value="메인화면으로 가기" class="main go" onclick="location.href='/mainGo'">
					</div>
				</div>
			</div>
		</main>

		<footer> </footer>
	</div>
	
	<script type="text/javascript">
	$("#pwinput").keyup(function(){
		// 비밀번호 정규식
		let pwdtest = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*[0-9])[A-Za-z\d!@#$%^&*]{8,15}$/;
		// pw 값 가져오기
		let pw = document.getElementById("pwid");
		// pw 값이 입력 되었을때
		if(pw != null){
			// 정규식으로 pw값 검사 false일때
			if(!pwdtest.test(pw.value)){
				$("#pwtest").text("비밀번호는 영어 대/소문자,특수문자,숫자를 포함하여 8자이상 15자이내여야 합니다.");
			// 정규식으로 pw값 검사 true 일때
			}else{
				$("#pwtest").text("");
			}
		}
	});	
	
	$("#input_form").submit(function(){
		alert("");
	});
	</script>
</body>
</html>