<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
	<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
		integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/admin1-2.css">
	<link rel="stylesheet" href="/resources/css/common.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<title>관리자 페이지</title>
</head>

<body>

	<div class="container">
		
        <jsp:include page="../common/admin_menu1.jsp"></jsp:include>


		<!-- 메인 컨텐트 -->
		<div class="main-content">
			<div class="usertable">
				<div>
					<p class="write_title">1:1 문의 게시판</p>
					<div class="search-bar">
						<i class="fa fa-search search-icon"></i> 
						<input type="text" placeholder="Search">
					</div>
				</div>
				<table>
					<colgroup>
						<col width="5%">
						<col width="30%">
						<col width="25%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
					</colgroup>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성일</th>
						<th>답변여부</th>
						<th>답변자</th>
					</tr>
					<tr class="hover_back" onclick="qna_detail()">
						<td>No</td>
						<td>제목</td>
						<td>내용</td>
						<td>작성일</td>
						<td>
							<span class="completed">처리완료</span>
						</td>
						<td>답변자</td>
					</tr>
					<tr class="hover_back" onclick="qna_detail()">
						<td>No</td>
						<td>제목</td>
						<td>내용</td>
						<td>작성일</td>
						<td>
							<span class="unprocessed">미처리</span>
						</td>
						<td>답변자</td>
					</tr>
					<c:choose>
						<c:when test="${empty fvo_list }">
							<tr>
								<td colspan="6"><h3>원하는 정보가 존재하지 않습니다.</h3></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${fvo_list}" var="k" varStatus="c">
								<tr onclick="qna_detail()">
									<td>No ${k.n_tle}</td>
									<td>제목 ${k.n_tle}</td>
									<td>내용 ${k.n_tle}</td>
									<td>작성일 ${k.n_tle}</td>
									<td>답변여부 ${k.n_tle}</td>
									<td>답변자 ${k.n_tle}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<tfoot>
						<tr>
							<td colspan="6">
								<!-- <button onclick="qna_write()">글쓰기</button> -->
							</td>
						</tr>
					</tfoot>
				</table>
                    
                <ul class="paging_num_ul">
                    <li class="material-icons prev">
                        keyboard_double_arrow_left
                    </li>
                	<c:choose>
                		<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
                      <li class="material-icons prev">
                          chevron_left
                      </li>
                		</c:when>
                		<c:otherwise>
                      <li class="material-icons prev">
                      	<a href="/notice?cPage=${paging.beginBlock - paging.pagePerBlock}">
                          	chevron_left
                          </a>
                      </li>
                		</c:otherwise>
                	</c:choose>
                	
                	<!-- 페이지 번호 -->
                	<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
                		<c:choose>
							<c:when test="${k == paging.nowPage }">
								<li class="active">${k}</li>
							</c:when>
						    <c:otherwise>
						    	<li><a href="/notice?cPage=${k}">${k}</a></li>
						    </c:otherwise>
						</c:choose>
			                   	</c:forEach>
					
					<!-- 다음 버튼 -->
					<c:choose>
						<c:when test="${paging.beginBlock >= paging.pagePerBlock}">
							<li class="material-icons next">
			                             chevron_right
								</li>
						</c:when>
						<c:otherwise>
							<li class="material-icons next">
			                             <a href="/notice?cPage=${paging.beginBlock + paging.pagePerBlock}">
			                             	chevron_right
			                             </a>
			                         </li>
						</c:otherwise>
					</c:choose>

                    
                    <li class="material-icons next">
                        keyboard_double_arrow_right
                    </li>
                </ul>
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