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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/admin1-2.css">

<title>관리자 페이지</title>
</head>

<body>

	<div class="container">

		<!-- 사이드 바 -->
		<div class="side-bar">
			<div class="icon-bar"></div>
			<div class="search-menu">
				<div class="profile">
					<img src="" alt="">
					<p>계정 이름</p>
				</div>
				<div class="controller">
					<div class="menu active">
						<div class="topmenu">
							<i class="fa-solid fa-user"></i>
							<p>회원관리</p>
						</div>
						<div>
							<div class="submenu">
								<a href="">회원 목록 조회</a>
							</div>
							<div class="submenu">
								<a href="">회원 관리</a>
							</div>
							<div class="submenu">
								<a href="">회원 휴몇 및 삭제 관리</a>
							</div>
						</div>
						<button class="menubtn">
							<i class="fa-solid fa-chevron-up icon open"></i> <i
								class="fa-solid fa-chevron-down icon close"></i>
						</button>
					</div>

					<div class="menu">
						<div class="topmenu">
							<i class="fa-solid fa-comment"></i>
							<p>고객센터</p>
						</div>
						<div>
							<div class="submenu">회원 목록 조회</div>
							<div class="submenu">회원 관리</div>
							<div class="submenu">회원 휴몇 및 삭제 관리</div>

							<button class="menubtn">
								<i class="fa-solid fa-chevron-up icon open"></i> <i
									class="fa-solid fa-chevron-down icon close"></i>
							</button>
						</div>
					</div>

					<div class="menu">
						<div class="topmenu">
							<i class="fa-solid fa-clipboard-list"></i>
							<p>게시판 관리</p>
						</div>
						<div>
							<div class="submenu">회원 목록 조회</div>
							<div class="submenu">회원 관리</div>
							<div class="submenu">회원 휴몇 및 삭제 관리</div>

							<button class="menubtn">
								<i class="fa-solid fa-chevron-up icon open"></i> <i
									class="fa-solid fa-chevron-down icon close"></i>
							</button>
						</div>
					</div>
				</div>
				<div class="logout">
					<i class="fa-solid fa-arrow-right"></i> <a href="">로그아웃</a>

				</div>
			</div>
		</div>



		<!-- 메인 컨텐트 -->
		<div class="main-content">
			<div class="usertable">
				<div>
					<p>회원 목록</p>
					<div class="search-bar">
						<i class="fa fa-search search-icon"></i> <input type="text"
							placeholder="Search">
					</div>
				</div>
				<table>
					<tr>
						<th><input type="checkbox"></th>
						<th>게시글 제목</th>
						<th>게시글 내용</th>
					</tr>
					<c:choose>
						<c:when test="${empty fvo_list }">
							<tr>
								<td colspan="3"><h3>원하는 정보가 존재하지 않습니다.</h3></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${fvo_list}" var="k" varStatus="c">
								<tr>
									<td><input type="checkbox"></td>
									<td><a href="/fna_detail?fna_idx=${k.fna_idx}">
											${k.fna_title }</a></td>
									<td><a href="/fna_detail?fna_idx=${k.fna_idx }">${k.fna_content }
									</a></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<tfoot>
						<tr>
							<td colspan="3">
								<button onclick="write_page()">글쓰기</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>


		</div>
	</div>
	</div>

	<script defer src="resources/js/admincommon.js"></script>

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