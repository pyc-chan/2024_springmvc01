<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공 사 중</h1>
	<form action="${pageContext.request.contextPath }/GuestBook2Controller" method="post">
		<input type="submit" value="[목록으로 이동]">
		<input type="hidden" name="cmd" value="g_list">
	
	</form>
</body>
</html>