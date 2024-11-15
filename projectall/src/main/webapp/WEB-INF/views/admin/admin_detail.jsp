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
        <jsp:include page="../common/admin_menu2.jsp"></jsp:include>
		<!-- 메인컨텐츠 -->
	
	
		<div class="popuplayer">
			<p class="write_title">관리자 계정 상세보기</p>

			<table class="popuptable">
				<tr>
					<td>아이디</td>
					<td>
	                    ${avo.a_id}
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
	                    ${avo.a_na}
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
			            ${avo.a_pho}
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						${avo.a_em}
					</td>
				</tr>
				<tr>
					<td>활동여부</td>
					<td>
						${avo.a_stat}
					</td>
				</tr>
			</table>
			
			<div>
				<ul class="but_layout">
					<li>
	                    <form method="post">  
		                	<input type="hidden" name="cPage" value="${cPage}" /> 
		                	<input type="hidden" name="a_idx" value="${avo.a_idx}" /> 
		                	
							<input type="button" value="목록" onclick="admin_list(this.form)">
							<input type="button" value="회원 수정" onclick="admin_update(this.form)">
							<input type="button" value="회원 삭제" onclick="admin_delete(this.form)"> 
               			</form>
					</li>
				</ul>
			</div>
		</div>
		<!-- container div -->
	</div>
	<!-- container div -->
	<jsp:include page="../common/admin_footer.jsp"></jsp:include>
	<script src="/resources/js/admin_common.js"></script>
	<script>
	function admin_list(f) {
		f.action="/admin/adminlist";
		f.submit();
	}
	
	function admin_update(f) {
		f.action="/admin/adminupdate";
		f.submit();
	} 
	
	function admin_delete(f) {
		f.action="/admin/admindelete";
		f.submit();
	}
	
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