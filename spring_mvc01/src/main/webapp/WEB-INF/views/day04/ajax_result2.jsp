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
	<h2>Ajax 연습하는 장소</h2>
	<button id="btn1">json 테스트</button>
	<button id="btn2">json 테스트(makeup)</button>
	<button id="btn3">json 테스트(공공데이터)</button>

	<hr>
	<div id="result"></div>

	<script type="text/javascript">
		$("#btn1").click(function() {
			$("#result").empty();
			$.ajax({
				url : "/test05", // 서버주소
				method : "post", // 전달방식
				dataType : "json", // 가져오는 결과 데이터 타입
				// data : "",			// 서버에 갈때 가져갈 데이터 (파라미터값)
				// async : true / false	// 비동기 = (true,기본) , 동기 = false 설정
				success : function(data) {
					// console.log(data);
					let table = "<table>";
					table += "<thead><tr><th>Name</th><th>Scope</th></tr></thead>";
					table += "<tbody>";
					$.each(data, function(index, obj) {
						let name = obj.name;
						let scope = obj.scope;
						table += "<tr>";
						table += "<td>"+name+"</std>";
						table += "<td>"+scope+"</td>";
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
		
		$("#btn2").click(function() {
			$("#result").empty();
			$.ajax({
				url : "/test06", // 서버주소
				method : "post", // 전달방식
				dataType : "json", // 가져오는 결과 데이터 타입
				// data : "",			// 서버에 갈때 가져갈 데이터 (파라미터값)
				// async : true / false	// 비동기 = (true,기본) , 동기 = false 설정
				success : function(data) {
					// console.log(data);
					let table = "<table>";
					table += "<thead><tr><th>id</th><th>brand</th><th>name</th><th>price</th><th>image</th></tr></thead>";
					table += "<tbody>";
					$.each(data, function(index, obj) {
						// 최대 5개만 표시
						
						if(index >= 5){
							return false; // 반복종료
						}
						let id = obj.id;
						let brand = obj.brand;
						let name = obj.name;
						let price = obj.price;
						let img = obj.image_link;
						table += "<tr>";
						table += "<td>"+id+"</std>";
						table += "<td>"+brand+"</std>";
						table += "<td>"+name+"</std>";
						table += "<td>"+price+"</std>";
						table += "<td><img src='"+img+"' width='100'></std>";
						
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
				url : "/test07", // 서버주소
				method : "post", // 전달방식
				dataType : "json", // 가져오는 결과 데이터 타입
				// data : "",			// 서버에 갈때 가져갈 데이터 (파라미터값)
				// async : true / false	// 비동기 = (true,기본) , 동기 = false 설정
				success : function(data) {
					let items = data.response.body.items.item;
					let table = "<table>";
					table += "<thead><tr><th>날짜</th><th>최소온도</th><th>최대온도</th>";
					table += "</tr></thead>";
					table += "<tbody>";
					
					// 오늘 날짜 구하기
					let today = new Date();
					
					$.each(items, function(index,obj){
						for (var i = 3; i < 11; i++) {
							let f_Date = new Date(today);
							f_Date.setDate(today.getDate()+i);
							
							let r_date = f_Date.toISOString().split('T')[0];
							table += "<tr>"
							table += "<td>" + r_date+ "</td>";
							table += "<td>" + obj["taMin"+i]+ "</td>";
							table += "<td>" + obj["taMax"+i]+ "</td>";
							table += "</tr>"
							
						}
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
	</script>
</body>
</html>