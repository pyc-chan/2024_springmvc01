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
<link rel="stylesheet" href="logincss/idfind.css">

<title>Insert title here</title>
</head>
<body>
	<div id="idfindok">
		<header> </header>


		<main>
			<div class="idfind_container">
				<c:when test="${ids.length}==0">
					<h2>등록된 아이디가 없습니다.</h2>
					<div id="gobutton">
						<input type="button" value="로그인" class="join go" onclick="location.href='/loginGo'">
						<input type="button" value="메인화면으로 가기" class="main go" onclick="location.href='/mainGo'">
					</div>
				</c:when>
				<c:otherwise>
				<table class="table">
					<thead class="thead">
						<tr>
							<th>번호</th>
							<th>아이디</th>
						</tr>
					</thead>
					<c:forEach var="k" items="${ids}" varStatus="status">
						<tr class="tr">
							<td>${status.count}</td>
							<td>${k} </td>
						</tr>
					</c:forEach>
				</table>
				<div id="gobutton">
						<input type="button" value="로그인" class="join go" onclick="location.href='/loginGo'">
						<input type="button" value="메인화면으로 가기" class="main go" onclick="location.href='/mainGo'">
					</div>
				</c:otherwise>
			</div>
		</main>


		<footer> </footer>
	</div>
	
	<script type="text/javascript">
	
	</script>
</body>
</html>