<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 1000px;
		border-collapse: collapse;
		margin: 10px auto;
	}
	table, th, td {
		border: 1px solid black;
		text-align: center;
		padding: 10px; 
	}
	h1{text-align: center;}
</style>
</head>
<body>

	<c:choose>
		<c:when test="${idx==1 }"><h1> 사번 검색 결과</h1></c:when>
		<c:when test="${idx==2 }"><h1> 이름 검색 결과</h1></c:when>
		<c:when test="${idx==3 }"><h1> 직종 검색 결과</h1></c:when>
		<c:when test="${idx==4 }"><h1> 부서 검색 결과</h1></c:when>
	</c:choose>
	<h2> 인원 : ${list.size() }명</h2>
	<table>
		<thead>
			<tr>
				<th style="width: 20%">번호</th>
				<th style="width: 20%">사번</th>
				<th style="width: 20%">이름</th>
				<th style="width: 20%">직종</th>
				<th style="width: 20%">부서</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr> <td colspan="5">자료가 존재하지 않습니다</td> </tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list }" varStatus="vs">
					<tr>
						<td>${vs.count}</td>
						<td>${k.empno}</td>
						<td>${k.ename}</td>
						<td>${k.job}</td>
						<td>${k.deptno}</td>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</tbody>
	</table>
</body>
</html>