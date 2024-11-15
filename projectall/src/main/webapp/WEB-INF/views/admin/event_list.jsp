<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
		rel="stylesheet">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
		integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/admin1-2.css">
	<title>관리자 페이지</title>
</head>

<body>

	<div class="container">
		
        <jsp:include page="../common/admin_menu3.jsp"></jsp:include>


		<!-- 메인 컨텐트 -->
		<div class="main-content">
			<div class="usertable">
				<div>
					<p class="write_title">녹지 행사 관리</p>
					<div class="search-bar">
						<i class="fa fa-search search-icon"></i> 
						<input type="text" placeholder="Search">
					</div>
				</div>
				<table>
					<colgroup>
						<col width="5%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tr>
						<th>No</th>
						<th>행사 이름</th>
						<th>경도</th>
						<th>위도</th>
						<th>시작날짜</th>
						<th>종료날짜</th>
					</tr>
					<tr class="hover_back" onclick="event_detail()">
						<td>No</td>
						<td>행사 이름</td>
						<td>경도</td>
						<td>위도</td>
						<td>시작날짜</td>
						<td>종료날짜</td>
					</tr>
					<c:choose>
						<c:when test="${empty fvo_list}">
							<tr>
								<td colspan="6"><h3>원하는 정보가 존재하지 않습니다.</h3></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${fvo_list}" var="k" varStatus="c">
								<tr class="hover_back"  onclick="event_detail()">
									<td>${(paging.nowBlock-1)*paging.numPerPage+c}</td>
									<td>${k.ev_na}</td>
									<td>${k.ev_lat}</td>
									<td>${k.ev_lon}</td>
									<td>${k.ev_sdat}</td>
									<td>${k.ev_edat}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<tfoot>
						<tr>
							<td colspan="6">
								<button onclick="event_write()">글쓰기</button>
							</td>
						</tr>
					</tfoot>
				</table>
				<jsp:include page="../common/every_paging.jsp"/>
			</div>


		</div>
	</div>
	<jsp:include page="../common/arrow.jsp"/>
    <jsp:include page="../common/admin_footer.jsp"></jsp:include>
    <script src="/resources/js/admin_common.js"></script>
	
	
	<script>

		const btns = document.querySelectorAll(".topmenu, .menubtn");


            function removeActiveClasses() {
                btns.forEach((btn) => {
                    btn
                        .parentElement
                        .classList
                        .remove("active");
                });
            }

            btns.forEach((btn) => {
                btn.addEventListener("click", () => {
                    const menuitem = btn.parentNode;
                    const isActive = menuitem
                        .classList
                        .contains("active");

                    removeActiveClasses();

                    if (!isActive) {
                        menuitem
                            .classList
                            .add("active");
                    }

                })
            });
        </script>
	</div>
</body>
</html>