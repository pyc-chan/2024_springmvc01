<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>kakao 결과</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h2>카카오 로그인 성공</h2>
	<div id="result"></div>
	
	
	<!-- 계정과 함께 로그아웃 -->
	<a href="https://kauth.kakao.com/oauth/logout?client_id=14144ccc98df3b4e7046aa897d24d791&logout_redirect_uri=http://localhost:8080/kakaologout">로그아웃</a>
	
<!-- <script type="text/javascript">
		$(function(){
			$("#result").empty();
			$.ajax({
				url : "/kakaoUserInfo",
				method : "post",
				dataType : "json",
				success : function(){
	                // 세션 이용
					let str = "<li>닉네임 : ${nickname}</li>";
					str += "<li>이미지 : <img src= ${profileImage}></li>";
					$("#result").append(str);
				} ,
				error : function(){
					alert("일기실패");
				}
			});
		});
	</script> -->
	<script type="text/javascript">
     $(function() {
         $("#result").empty();
         $.ajax({
             url : "/kakaoUserInfo",
             method : "post",
             dataType : "json",
             success : function(data) {
            	 // json 이용
            	 const name = data.properties.nickname;
            	 const img = data.properties.profile_image;
            	 const email = data.kakao_account.email ;
            	 
            	 let str  = "<li>닉네임 : "+ name +" </li>";
            	     str += "<li>email : "+ email +" </li>";
                     str += "<img src= " + img +">";
             $('#result').append(str);
             }, 
             error : function() {
                 alert("정보를 불러오는 데 실패했습니다.");
             }
         });
      });
    </script>
</body>
</html>