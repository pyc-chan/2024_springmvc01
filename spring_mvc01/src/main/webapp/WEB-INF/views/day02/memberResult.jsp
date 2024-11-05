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
<h1>members 전체 내용 보기</h1>
<c:choose>
	<c:when test="${empty list}">
		<h2>내용이 존재하지 않습니다.</h2>
	</c:when>
	<c:otherwise>
		<c:forEach var="k" items="${list}">
			<li>${k.m_idx }</li>
			<li>${k.m_id }</li>
			<li>${k.m_pw }</li>
			<li>${k.m_name }</li>
			<li>${k.m_age }</li>
			<li>${k.m_reg }</li>
		</c:forEach>
	</c:otherwise>

</c:choose> 
</body>
</html>