<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결과 : result2.jsp</h1>
	<h2>강아지 이름들</h2>
	<c:forEach var="k" items="${dogName }">
		<h3>${k }</h3>
	</c:forEach>
	<h2>고양이 이름들</h2>
	<c:forEach var="k" items="${catName }">
		<h3>${k }</h3>
	</c:forEach>
</body>
</html>