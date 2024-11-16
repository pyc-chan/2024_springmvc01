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
			<p class="write_title">회원관리 상세보기</p>

			<table class="popuptable">
				<tr>
					<td>아이디</td>
					<td>
	                    ${lvo.u_id}
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
	                    ${lvo.u_pw}
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
	                    ${lvo.u_na}
					</td>
				</tr>
				<tr>
					<td>프로필 이미지</td>
					<td>
                       	<c:choose>
							<c:when test="${empty lvo.u_pic}">
								<span>등록된 첨부파일이 없습니다.</span>
							</c:when>
							<c:otherwise>
								<p class="attachment_name">첨부파일</p>
								<ul class="attachment">
									<li class="img_box">
										<a href="/board_down?f_name=${lvo.u_pic}">
											<img src="/resources/upload/${lvo.u_pic}">
										</a>
									</li>
									<li>
										<p class="img_name"><span>파일명</span> ${lvo.u_pic}</p>
										<p>
											<a class="img_down" href="/user_down?f_name=${lvo.u_pic}">다운로드</a>
										</p>
									</li>
								</ul>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
	                    ${lvo.u_pho}
					</td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
	                    ${lvo.u_gen}
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
	                    ${lvo.u_bir}
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
	                    ${lvo.u_em}
					</td>
				</tr>
				<tr>
					<td>생성일자</td>
					<td>
	                    ${lvo.u_reg}
					</td>
				</tr>
				<tr>
					<td>탈퇴일자</td>
					<td>
	                    ${lvo.u_out}
					</td>
				</tr>
				<tr>
					<td>탈퇴담당자</td>
					<td>
	                    ${lvo.a_idx}
					</td>
				</tr>
				<tr>
					<td>탈퇴사유</td>
					<td>
	                    ${lvo.u_outr}
					</td>
				</tr>
			</table>
			
			<div>
				<ul class="but_layout">
					<li>
	                    <form method="post">  
		                	<input type="hidden" name="cPage" value="${cPage}" /> 
		                	<input type="hidden" name="u_id" value="${lvo.u_id}" /> 
		                	
							<input type="button" value="목록" onclick="user_list()">
							<input type="button" value="회원 수정" onclick="user_update(this.form)">
							<input type="button" value="회원 삭제" onclick="user_delete(this.form)"> 
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