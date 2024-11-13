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
        <jsp:include page="../common/admin_menu1.jsp"></jsp:include>
		<!-- 메인컨텐츠 -->
	
	
		<div class="popuplayer">
			<p class="write_title">고객의 소리 게시판 상세보기</p>

			<table class="popuptable">
					<tr>
						<td>제목</td>
						<td>
		                    ${nvo.n_tle}
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
		                    ${nvo.n_con}
						</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
                        	<c:choose>
								<c:when test="${empty nvo.f_name}">
									<span>등록된 첨부파일이 없습니다.</span>
								</c:when>
								<c:otherwise>
									<p class="attachment_name">첨부파일</p>
									<ul class="attachment">
										<li class="img_box">
											<a href="/board_down?f_name=${nvo.f_name}">
												<img src="/resources/upload/${nvo.f_name}">
											</a>
										</li>
										<li>
											<p class="img_name"><span>파일명</span> ${nvo.f_name}</p>
											<p>
												<a class="img_down" href="/inquery_down?f_name=${nvo.f_name}">다운로드</a>
											</p>
										</li>
									</ul>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
			</table>
			
		                
			<%-- 댓글 출력 창 --%>
			<c:forEach var="k" items="${clist}">
					
       				 		<c:choose>
					    <c:when test="${k.c_out == 1}">
					        <div class="comment_list_del">
							 	<ul>
							 		<li>
										<p class="cmt_content">삭제된 댓글 입니다.</p>
							 		</li>
							 	</ul>
							</div>
					    </c:when>
					    <c:otherwise>
							<form method="post">
					        <div class="comment_list">
							 	<ul>
							 		<li>
							 			<img src="/resources/images/profile.png" alt="profile">
							 		</li>
							 		<li>
										<p class="cmt_id">아이디 <span class="cmt_update">(수정됨)</span> <span class="cmt_name">작성자</span></p>
										<p class="cmt_content">${k.c_con}</p>
										<p class="cmt_date">${k.c_dat}</p>
										
										<%-- 실제는 로그인 성공 후 관리자이거나 글쓴 본인인 경우만 삭제 가능 --%>
										<div class="btn_contents">
											<button class="update_btn">수정</button>
											<button class="delete_btn" onclick="move_comment_delete(this.form)">삭제</button>
										</div>
							 		</li>
							 	</ul>
								<%-- 컨트롤러 가서 DB 삭제 후 다시 이곳으로 와야 한다. (나중에 ajax로 변경하자) --%>
								<input type="hidden" name="idxc_idx" value="${k.idxc_idx}">
								<input type="hidden" name="c_ref" value="${k.c_ref}">
								<input type="hidden" name="idxn_idx" value="${k.c_ref}">
								<input type="hidden" name="cPage" value="${cPage}">
							</div>
							</form>
					    </c:otherwise>
					</c:choose>
				
					
				
			</c:forEach>
               
               <%-- 댓글 입력 창 --%>
			<div class="comment_conteainer">
				<form action="/comment_insert" method="post">
					<fieldset>
						<!-- 아이디 number -->
						<input type="hidden" name="u_idx" value="1">
						
						<p class="cmt_id">아이디 불러오기</p>
						<div class="insert_comment">
							<textarea rows="3" cols="40" name="c_con" placeholder="댓글을 남겨보세요." required></textarea>
							<!-- 댓글 저장 시 어떤 댓글이 원글인지 저장해야 한다. -->
							<input type="hidden" name="idxn_idx" value="${gvo.idxn_idx}">
							<input type="hidden" name="cPage" value="${cPage}">
							<input type="hidden" name="c_out" value="0">
							<input type="hidden" name="c_bor" value="inquery">
							<input type="submit" class="insert_btn" value="등록">
						</div>
					</fieldset>
				</form>
			</div>
			<div>
				<ul class="but_layout">
					<li>
	                    <form method="post">  
		                	<input type="hidden" name="cPage" value="${cPage}" /> 
		                	<input type="hidden" name="idxn_idx" value="${nvo.idxn_idx}" /> 
		                	<input type="hidden" name="a_idx" value="${nvo.a_idx}" /> 
		                	
							<input type="button" value="목록" onclick="inquery_list()">
							<!-- <input type="button" value="수정" onclick="inquery_update(this.form)"> -->
							<input type="button" value="삭제" onclick="inquery_delete(this.form)"> 
               			</form>
					</li>
				</ul>
			</div>
		</div>
		<!-- container div -->
	</div>
	<!-- container div -->
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
</body>
</html>