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
	<h1>하이</h1>
	<h2><a href="/loginGo">로그인</a></h2>

	<script type="text/javascript">
	<c:if test="${loginok == 'ok'}">
		console.log("${sessionScope.u_id}");
	    console.log("${sessionScope.u_na}");
 	    console.log("${sessionScope.u_pro}");
	    console.log("${sessionScope.u_em}");
	</c:if>
	<c:if test="${empty sessionScope.u_id}">
    console.log("u_id is empty");
</c:if>
<c:if test="${empty sessionScope.u_na}">
    console.log("u_na is empty");
</c:if>
<c:if test="${empty sessionScope.u_pro}">
    console.log("u_pro is empty");
</c:if>
<c:if test="${empty sessionScope.u_em}">
    console.log("u_em is empty");
</c:if>
	
	</script>
	
	
	

</body>
</html>