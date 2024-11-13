<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon"
	href="/resources/images/favicon.png">
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/admin1-2.css">
<link rel="stylesheet" href="/resources/css/common.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>관리자 페이지</title>
</head>

<body>

	<div class="container">

		<jsp:include page="../common/admin_menu1.jsp"></jsp:include>


		<!-- 메인 컨텐트 -->
		<div class="main-content">
			<div class="usertable">
				<div>
					<p class="write_title">고객의 소리 게시판</p>
					<div class="search-bar">
						<i class="fa fa-search search-icon"></i> <input type="text"
							placeholder="Search">
					</div>
				</div>
				<table>
					<colgroup>
						<col width="5%">
						<col width="30%">
						<col width="25%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성일</th>
						<th>답변여부</th>
						<th>답변자</th>
					</tr>
					<c:choose>
						<c:when test="${empty list}">
							<tr>
								<td colspan="6"><h3>원하는 정보가 존재하지 않습니다.</h3></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="k" varStatus="c">
								<tr class="hover_back" onclick="inquery_detail(${k})">
									<td>${paging.nowBlock*paging.pagePerBlock-c }</td>
									<td>${k.i_tle }</td>
									<td>${k.i_con }</td>
									<td>${k.i_dat }</td>
									<c:choose>
										<c:when test="${k.i_con == 1 }">
											<td><span class="completed">처리완료</span></td>
											<td>${k.a_idx }</td>
										</c:when>
										<c:otherwise>
											<td colspan="2"><span class="unprocessed">미처리</span></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>

				<jsp:include page="../common/every_paging.jsp"/>

			</div>


		</div>
	</div>

	<jsp:include page="../common/admin_footer.jsp"></jsp:include>
	
	<jsp:include page="../common/arrow.jsp"></jsp:include>
</body>
</html>