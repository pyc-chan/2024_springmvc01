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
					<p class="write_title">리뷰 관리</p>
					<div class="search-bar">
						<i class="fa fa-search search-icon"></i> 
						<input type="text" placeholder="Search">
					</div>
				</div>
				<table>
					<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>내용</th>
						<th>작성일</th>
						<th>수정 여부</th>
					</tr>
					<tr class="hover_back" onclick="review_detail()">
						<td>No</td>
						<td>제목</td>
						<td>내용</td>
						<td>작성자</td>
						<td>내용</td>
						<td>작성일</td>
						<td>수정 여부</td>
					</tr>
					<c:choose>
						<c:when test="${empty fvo_list }">
							<tr>
								<td colspan="7"><h3>원하는 정보가 존재하지 않습니다.</h3></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${fvo_list}" var="k" varStatus="c">
								<tr onclick="review_detail()">
									<td>No</td>
									<td>작성자 ${k.u_idx}</td>
									<td>내용 ${k.n_idx}</td>
									<td>작성일 ${k.rev_dat}</td>
									<td>수정 여부 ${k.rev_up}</td>
									<td>작성 게시판 ${k.rev_bor}</td>
									<td>작성 게시물 ${k.rev_ref}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<tfoot>
						<tr>
							<td colspan="7">
								<button onclick="review_write()">글쓰기</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>


		</div>
	</div>
		
    <jsp:include page="../common/admin_footer.jsp"></jsp:include>
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