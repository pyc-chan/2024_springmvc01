<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="resources/css/admin1-1.css">
<title>관리자 페이지</title>
</head>

<body>

	<div class="container">

		<!-- 사이드 바 -->
		<!-- 
		<div class="side-bar">
			<div class="icon-bar"></div>
			<div class="search-menu">
				<div class="profile">
					<img src="resources/images/logo_w.png" alt="logo">
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
		
		-->
		
		<jsp:include page="adminsidebar.jsp" />

		<!-- 메인 컨텐트 -->
		<div class="popuplayer">
			<div class="list_table">
				<div class="usertable">
					<div class=title>
						<p>회원관리</p>
						<button onclick="usermanagement()">
							더보기
							<i class="material-icons see_more">chevron_right</i>
						</button>
					</div>
					<table>
						<tr>

							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>등급</th>
							<th>최초 가입일</th>
							<th>최종 접속일</th>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>

					</table>
				</div>
				<div class="inquirytable">
					<div class="title">
						<p>1:1 문의</p>
						<button onclick="fna()">
							더보기
							<i class="material-icons see_more">chevron_right</i>
						</button>
					</div>
					<table>
						<tr>

							<th class="id">아이디</th>
							<th class="name">이름</th>
							<th class="email">이메일</th>
							<th class="grade">등급</th>
							<th class="first">최초 가입일</th>
							<th class="last">최종 접속일</th>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>

					</table>
				</div>

				<div class="servicetable">
					<div class="title">
						<p>공지사항</p>
						<button onclick="announce()">
							더보기
							<i class="material-icons see_more">chevron_right</i>
						</button>
					</div>
					<table>
						<tr>

							<th class="id">아이디</th>
							<th class="name">이름</th>
							<th>제목</th>
							<th class="first">최초 가입일</th>
							<th class="last">최종 접속일</th>
							<th class="reply">답변하기</th>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>
						<tr>

							<td>hong</td>
							<td>홍길동</td>
							<td>admin@naver.com</td>
							<td>1</td>
							<td>2024.00.00</td>
							<td>2024.00.00</td>
						</tr>

					</table>
					<!-- 차트 -->


				</div>
			</div>


			<div class="chart">
				<div class="linegraph">
					<div>
						<p>회원가입자 수 월별 분석</p>
						<div class="chart_box1"></div>
					</div>
				</div>
				<div class="circlegraph">
					<div>
						<p>카테고리별 일별 클릭률 분석</p>
						<div class="chart_box2"></div>
					</div>
				</div>
			</div>




		</div>

		<script defer src="resources/js/admincommon.js"></script>


		<script>
    const btns = document.querySelectorAll(".topmenu");

    function removeActiveClasses() {
      btns.forEach((btn) => {
        btn.parentElement.classList.remove("active");
      });
    }


    btns.forEach((btn) => {
      btn.addEventListener("click", () => {
        const menuitem = btn.parentNode;
        const isActive = menuitem.classList.contains("active");

        removeActiveClasses();

        if (!isActive) {
          menuitem.classList.add("active");
        }

      })
    });
  </script>
</body>

</html>