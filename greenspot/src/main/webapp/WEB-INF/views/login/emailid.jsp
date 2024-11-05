<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- 리셋 cdn -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
<!-- 폰트 어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="logincss/emailid.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<div class="email">
	<header>
	</header>
	<main>
		<div id="emailchk_container">	
			<h3 class="h3">받은 이메일의 인증번호을 넣어주세요</h3>
			<form id="authform" method="post" >
				<input type="number" id="authNumber" name="authNumber"
					placeholder="인증번호" maxlength="6" required> 
				<input type="hidden" name="u_em" value="${u_em}">
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
		if(authNum == ${sessionNumber})
			$("#authform").action="/idfindok";
			$("#authform").submit();
		else
			alert("인증번호가 다릅니다.");
	})
		/* document.getElementById("submit").addEventlistener("click",function(){
		const authNum = document.getElementById("authNumber").value
		if(authNum == "${randomNumber}"){
			action = "/idFindOK"
			alert("")
			submit()
		} else{
			alert("인증번호가 다릅니다.")
		}
		
	}) */
	
	</script>
	
</body>
</html>