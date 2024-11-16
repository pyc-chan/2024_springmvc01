<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
	<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
		integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/admin1-3.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>관리자 페이지</title>
</head>

<body>
	<div class="container">
        <jsp:include page="../common/admin_menu3.jsp"></jsp:include>
		<!-- 메인컨텐츠 -->
	
	
		<div class="popuplayer">
			<p class="write_title">녹지 행사 관리 상세보기</p>

			<table class="popuptable">
					<tr>
						<td>행사 이름</td>
						<td>
							${evvo.ev_name}
						</td>
					</tr>
					<tr>
						<td>경도</td>
						<td>
							${evvo.ev_lat}
						</td>
					</tr>
					<tr>
						<td>위도</td>
						<td>
							${evvo.ev_long}
						</td>
					</tr>
					<tr>
						<td>시작날짜</td>
						<td>
							${evvo.ev_sdat}
						</td>
					</tr>
					<tr>
						<td>종료날짜</td>
						<td>
							${evvo.ev_edat}
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>
							${evvo.ev_tle}
						</td>
					</tr>
					<tr>
						<td>구분</td>
						<td>
							${evvo.ev_ty}
						</td>
					</tr>
					<tr>
						<td>관리기관명</td>
						<td>
							${evvo.ev_ce_na}
						</td>
					</tr>
					<tr>
						<td>관계자 전화번호</td>
						<td>
							${evvo.ev_pho}
						</td>
					</tr>
			</table>
		</div>
		<!-- container div -->
	</div>
	<!-- container div -->
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
</body>
</html>