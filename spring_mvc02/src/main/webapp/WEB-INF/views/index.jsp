<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Spring MVC 02</h2> 
	<h3><a href="/sns_login">SNS Login</a></h3>
	<h3><a href="/gb2_list">guestbook2</a></h3>
	<h3><a href="/bbs">게시판 : bbs</a></h3>
	<h3><a href="/bbs2">ajax_게시판 : bbs</a></h3>
	<h3><a href="/board_list">게시판 : board</a></h3>
	<h3><button onclick="shop_go()">쇼핑몰</button></h3>
	<h3><button onclick="addr_go()">주소록</button></h3>
	<h3><button onclick="map_go()">지도</button></h3>
	<!-- <h3><button onclick="scheduled_go()">스케줄처리</button></h3> -->
	
	
	
	<script type="text/javascript">
		function shop_go() {
			location.href = "/shop";
		}
		function addr_go() {
			location.href = "/daum_addr";
		}
		function map_go() {
			location.href = "/kakao_map";
		}
		
	</script>
</body>


</html>