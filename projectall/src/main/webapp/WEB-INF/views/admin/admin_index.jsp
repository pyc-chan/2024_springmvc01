<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>관리자 페이지</title>
	<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
	<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
  	<link rel="stylesheet" href="/resources/css/admin1-1.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<!-- ECharts CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/echarts/5.2.2/echarts.min.js"></script>
	
  	<script src="https://cdn.jsdelivr.net/npm/echarts@5.3.2/dist/echarts.min.js"></script>
	<style>
	    
	</style>
</head>

<body>

	<div class="container">
		
        <jsp:include page="../common/admin_menu1.jsp"></jsp:include>

		<!-- 메인 컨텐트 -->
		<div class="popuplayer">
			<div class="list_table">
				<div class="usertable">
					<div class=title>
						<p>회원관리</p>
						<!-- 메인에서 가는 cPage는 1 -->
						<button onclick="user_list(1)">
							더보기
							<i class="material-icons see_more">chevron_right</i>
						</button>
					</div>
					<table>
						<colgroup>
							<col width="25%">
							<col width="30%">
							<col width="25%">
							<col width="20%">
						</colgroup>
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>가입일</th>
						</tr>
						<c:forEach items="userlist" var="k">
							<tr>
								<td>${k.u_id }</td>
								<td>${k.u_na }</td>
								<td>${k.u_em }</td>
								<td>${k.u_reg }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div class="inquirytable">
					<div class="title">
						<p>1:1 문의</p>
						<!-- 메인에서 가는 cPage는 1 -->
						<button onclick="qna_list(1)">
							더보기
							<i class="material-icons see_more">chevron_right</i>
						</button>
					</div>
					<table>
						<colgroup>
							<col width="25%">
							<col width="30%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<tr>
							<th>제목</th>
							<th>내용</th>
							<th>작성일</th>
							<th>답변여부</th>
							<th>답변자</th>
						</tr>
						<c:forEach items="qnalist" var="c">
						<tr>
							<td>${k.q_tle }</td>
							<td>${k.q_con }</td>
							<td>${k.q_dat }</td>
							<c:choose>
							<c:when test="${k.q_ans==0 }">
							<td colspan="2">
								<span class="unprocessed">미처리</span>
							</td>
							</c:when>
							<c:otherwise>
							<td>
								<span class="completed">처리완료</span>
							</td>
							<td>${k.a_idx }</td>
							</c:otherwise>
							</c:choose>
						</tr>
						</c:forEach>
					</table>
				</div>

				<div class="servicetable">
					<div class="title">
						<p>공지사항</p>
						<button onclick="notice_list(1)">
							더보기
							<i class="material-icons see_more">chevron_right</i>
						</button>
					</div>
					<table>
						<colgroup>
							<col width="15%">
							<col width="40%">
							<col width="30%">
							<col width="15%">
						</colgroup>
						<tr>
							<th>제목</th>
							<th>내용</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<c:forEach items="noticelist" var="k">
						<tr>
							<td>${k.n_tle }</td>
							<td>${k.n_con }</td>
							<td>${k.n_dat }</td>
							<td>${k.n_hit }</td>
						</tr>
						</c:forEach>
					</table>
					<!-- 차트 -->


				</div>
			</div>


			<div class="chart">
				<div class="linegraph">
					<div>
						<p>회원가입자 수 월별 분석</p>
						<div class="chart_box1">
							<div id="signupChart"></div>
						</div>
					</div>
				</div>
				<div class="circlegraph">
					<div>
						<p>카테고리별 일별 클릭률 분석</p>
						<div class="chart_box2">
							<!-- 차트 영역 -->
							<div id="container">
							    <div id="chart"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
        <jsp:include page="../common/admin_footer.jsp"></jsp:include>

<!-- 회원가입자 수 월별 분석 -->
<script src="/resources/js/signup_mock.js" defer></script>

<!-- 카테고리별 일별 클릭률 분석 -->
<script src="/resources/js/category_click_mock.js" defer></script>
<script src="/resources/js/admin_common.js"></script>


</body>

</html>