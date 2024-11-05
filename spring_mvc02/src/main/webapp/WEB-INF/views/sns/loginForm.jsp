<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>일반 로그인</h1>	
	<div id="login" style="margin: 30px;">
		<form action="/member_login" method="post">
			<p>	ID : <input type="text" name="m_id" required>	</p>
			<p>	PW : <input type="password" name="m_pw" required></p>
			<input type="submit" value="로그인">
		</form>
	</div>
	
	<h1>SNS 로그인</h1>
	
	    
    <div id="login" style="margin: 30px;">
        <form action="/id_login" method="post">
            <p>    ID : <input type="text" name="m_id" required>    </p>
            <p>    PW : <input type="password" name="m_pw" required></p>
            <input type="submit" value="로그인">
        </form>
    </div>
	
	
	<!-- 인가코드받기요청 -->
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=14144ccc98df3b4e7046aa897d24d791&redirect_uri=http://localhost:8080/kakaologin&response_type=code">
	<img alt="카카오" src="resources/images/kakao_login_medium_wide.png">
	</a>
	
	<br>
	
	<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=bv_786diGR8Y0y00e9Bx&redirect_uri=http://localhost:8080/naverlogin&state=STATE_STRING">
	<img alt="네이버" src="resources/images/btnG_naver.png" style="width: 100px">
	</a>
	
	
	<hr>
	<button type="button" onclick="kakao_map01()">카카오 지도연습 01</button>
	<button type="button" onclick="kakao_map02()">카카오 지도연습 02</button>
	<button type="button" onclick="kakao_map03()">카카오 지도연습 03</button>
	<button type="button" onclick="kakao_map04()">카카오 지도연습 04</button>
	<button type="button" onclick="daum_addr()">다음주소API</button>
	
	<script type="text/javascript">
		function kakao_map01() {
			location.href = "/kakao_map01";
		}
		function kakao_map02() {
			location.href = "/kakao_map02";
		}
		function kakao_map03() {
			location.href = "/kakao_map03";
		}
		function kakao_map04() {
			location.href = "/kakao_map04";
		}
		function kakao_map04() {
			location.href = "/daum_addr_";
		}
	</script>
	
</body>
</html>