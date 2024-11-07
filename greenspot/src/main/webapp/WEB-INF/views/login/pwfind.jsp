<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="logincss/pwfind.css">

<title>Insert title here</title>
</head>
<body>
<c:if test="${pwfind == 'fail'}">
    <script type="text/javascript">
        alert("입력을 다시 확인해주세요");
    </script>
</c:if>
	<div id="idfind">
		<header> </header>
		
		
		<main>
			<section class="pwfind_container">
				<div id="box">
					<h3 class="h3">비밀번호 찾기</h3>
					<form id="input" method="post" action="/pwFind">
						<input type="text" placeholder="아이디를 입력하세요" name="u_id" class="idinput">
						<input type="text" placeholder="이메일을 입력하세요" name="u_em" class="idinput">
						<input type="submit" value="입 력" id="input_id">
					</form>
					<div id="gobutton">
						<input type="button" value="메인화면으로 가기" class="main go" onclick="location.href='/mainGo'">
						<input type="button" value="로그인으로 가기" class="login go" onclick="location.href='/loginGo'">
					</div>
				</div>
			</section>
		</main>


		<footer> </footer>
	</div>
	
	<script type="text/javascript">
	
	
	
	
	
	
	</script>
</body>
</html>