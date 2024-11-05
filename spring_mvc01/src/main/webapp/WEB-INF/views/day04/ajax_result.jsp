<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{width: 600px; border-collapse: collapse;}
	table, th, td{ border: 1px solid red; text-align: center;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

<h2> Ajax 연습하는 장소</h2>
	<button id="btn1">text 테스트</button>
	<button id="btn2">xml 테스트</button>
	<button id="btn3">날씨 xml 테스트</button>
	<button id="btn4">공공데이터 포털 xml 테스트</button>
	
	
	<hr>
	<div id="result"></div>
	
	
	<script type="text/javascript">
		$("#btn1").click(function() {
			$("#result").empty();
			$.ajax({
				url : "/test01",		// 서버주소
				method : "post",		// 전달방식
				dataType : "text",		// 가져오는 결과 데이터 타입
				// data : "",			// 서버에 갈때 가져갈 데이터 (파라미터값)
				// async : true / false	// 비동기 = (true,기본) , 동기 = false 설정
				success : function(data) {
					$("#result").append(data);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		});
		$("#btn2").click(function() {
			$("#result").empty();
			$.ajax({
				url : "/test02",		// 서버주소
				method : "post",		// 전달방식
				dataType : "xml",		// 가져오는 결과 데이터 타입
				// data : "",			// 서버에 갈때 가져갈 데이터 (파라미터값)
				// async : true / false	// 비동기 = (true,기본) , 동기 = false 설정
				success : function(data) {
					let table = "<table>";
					table += "<thead><tr><th>회사</th><th>차명</th><th>개수</th></tr></thead>";
					table += "<tbody>";
					$(data).find("product").each(function() {
						let company = $(this).text();
						let name = $(this).attr("name");
						let count = $(this).attr("count");
						
						table += "<tr>";
						table += "<td>"+company+"</td>";
						table += "<td>"+name+"</td>";
						table += "<td>"+count+"</td>";
						table += "</tr>";
					});
					
					table += "</tbody>";
					
					table += "</table>";
					
					
					$("#result").append(table);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		});
	
		$("#btn3").click(function() {
			$("#result").empty();
			$.ajax({
				url : "/test03",		// 서버주소
				method : "post",		// 전달방식
				dataType : "xml",		// 가져오는 결과 데이터 타입
				// data : "",			// 서버에 갈때 가져갈 데이터 (파라미터값)
				// async : true / false	// 비동기 = (true,기본) , 동기 = false 설정
				success:function(data) {
					let table = "<table>";
					table += "<thead><tr><th>회사</th><th>차명</th><th>개수</th></tr></thead>";
					table += "<tbody>";
					$(data).find("local").each(function() {
						let local = $(this).text();
						let ta = $(this).attr("ta");
						let desc = $(this).attr("desc");
						let icon = $(this).attr("icon");
						
						table += "<tr>";
						table += "<td>"+local+"</td>";
						table += "<td>"+ta+"</td>";
						table += "<td>"+desc+"</td>";
						table += "<td><img src='https://www.kma.go.kr/images/icon/NW/NB"+icon+".png'></td>";
						table += "</tr>";
					
					
					});
					table += "</tbody>;"
					table += "</table>;"
				
					$("#result").append(table);
				},
				error : function(){
					alert("읽기실패");
				}
			});
		});
		
		$("#btn4").click(function() {
			$("#result").empty();
			$.ajax({
				url : "/test04",		// 서버주소
				method : "post",		// 전달방식
				dataType : "xml",		// 가져오는 결과 데이터 타입
				// data : "",			// 서버에 갈때 가져갈 데이터 (파라미터값)
				// async : true / false	// 비동기 = (true,기본) , 동기 = false 설정
				success : function(data) {
					let table = "<table>";
					table += "<thead><tr><td>지역</td><td>초미세먼지</td><td>미세먼지</td><td>오존</td><td>이산화질소</td><td>일산화탄소</td></tr></thead>"
					table += "<tbody>"
					$(data).find("item").each(function(){
						table += "<tr>";
						table += "<td>"+$(this).find("sidoName").text() +"</td>";
						table += "<td>"+$(this).find("pm25Value").text() +"</td>";
						table += "<td>"+$(this).find("pm10Value").text() +"</td>";
						table += "<td>"+$(this).find("o3Value").text() +"</td>";
						table += "<td>"+$(this).find("no2Value").text() +"</td>";
						table += "<td>"+$(this).find("coGrade").text() +"</td>";
						table += "</tr>";
					})
					table += "</tbody>"
					table += "</table>";
					$("#result").append(table);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		});
	
	</script>

</body>
</html>