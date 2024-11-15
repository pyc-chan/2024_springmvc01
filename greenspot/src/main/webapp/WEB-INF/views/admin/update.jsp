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
<link rel="stylesheet" href="resources/css/admin1-3.css">
<title>관리자 페이지</title>
</head>

<body>
	<div class="container">
		<!-- 사이드 바 -->
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
		<!-- 메인컨텐츠 -->
		<div class="popuplayer">
			<p class="write_title">팝업레이어</p>
			<p class="write_contents">초기화면 접속 시 자동으로 뜰
				팝업레이어를 설정합니다.</p>


			<table class="popuptable">
				<tr>
					<td>팝업 레이어 제목</td>
					<td><input type="text" placeholder="제목을 입력해주세요"
						name="fna_title" value="${fna_title }"> ${fvo.fna_title }
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea class="textarea" name="fna_content"
							value="${fna_content }" placeholder="내용을 입력하세요">${fvo.fna_content }</textarea></td>
				</tr>
			</table>
			<form action="update" method="post">
				<div class="btns">
					<input type="hidden" name="fna_idx" value="${fvo.fna_idx }">
					<button type="submit">수정완료</button>
					<button type="reset">취소</button>
				</div>
			</form>
		</div>
		<!-- container div -->
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
</body>
</html>