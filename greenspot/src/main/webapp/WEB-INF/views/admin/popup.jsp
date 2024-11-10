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
		
		<jsp:include page="adminsidebar.jsp"></jsp:include>
		
		<!-- 메인컨텐츠 -->
	
	
		<div class="popuplayer">
			<p class="write_title">팝업레이어</p>


			<table class="popuptable">
				<tr>
					<td>
						제목
					</td>
					<td>
						${pvo.pop_tle}
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						${pvo.pop_con}
					</td>
				</tr>
				<tr>
					<td>이미지</td>
					<td>
						<img alt="" src="resources/${pvo.pop_pic }">
					</td>
				</tr>
				
			</table>
			<div>
				<ul class="but_layout">
					<li>
						<input type="button" value="수정" onclick="update_go()">
						<input type="button" value="삭제" onclick="delete_go()">
					</li>
				</ul>
			</div>
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