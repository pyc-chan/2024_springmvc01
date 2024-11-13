<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공지사항 - 상세보기</title>
	<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    
    <link rel="stylesheet" href="resources/css/menu.css" />
    <link rel="stylesheet" href="resources/css/notice_detail.css" />
    <link rel="stylesheet" href="/resources/css/weather.css"><!-- 날씨 위젯 추가 -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="resources/js/menu.js"></script>
    <script src="/resources/js/weather.js"></script><!-- 날씨 위젯 추가 -->
</head>
<body>
	<div id="sub_main_container">
        <!-- sub_header 불러오기 -->
        <jsp:include page="../common/sub_header.jsp"></jsp:include>
        
        <!-- 컨텐츠 영역(main) 시작 -->
        <main>
            <div id="sub_container">
                <ul class="contents_box">
                    <li class="textleft">
                        <h2 class="great_title">공지사항</h2>
                        <p class="subheading_title">도심녹지 관련 소식을 안내합니다</p>

                        <div class="content">
		                    <ul>
		                        <li>
		                            <h2 class="title">${nvo.n_tle}</h2>
		                            <div class="tt">
		                                <ul>
		                                    <li>
		                                        <span class="title">작성자</span>
		                                        <span class="cont">${nvo.a_idx}</span>
		                                    </li>
		                                    <li>
		                                        <span class="title">작성일</span>
		                                        <span class="cont">${nvo.n_dat}</span>
		                                    </li>
		                                    <li>
		                                        <span class="title">조회수</span>
		                                        <span class="cont">${nvo.n_hit}</span>
		                                    </li>
		                                </ul>
		                            </div>
		                        </li>
		                    </ul>
		                    <ul>
		                        <li class="bodyCont">
		                        	${nvo.n_con}
		                        </li>
		                    </ul>
		                    <ul>
		                        <li>
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
														<a class="img_down" href="/notice_down?f_name=${nvo.f_name}">다운로드</a>
													</p>
												</li>
											</ul>
										</c:otherwise>
									</c:choose>
		                        </li>
		                    </ul>
		                </div>
		                
		                
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
													<p class="cmt_id">${k.c_id}  
													<c:if test="${k.c_up == 1}">
														<span class="cmt_update">(수정됨)</span>
													</c:if>
													<span class="cmt_name">${k.c_na}</span></p>
													<p class="cmt_content">${k.c_con}</p>
													<p class="cmt_date">${k.c_dat}</p>
													
													<%-- 실제는 로그인 성공 후 관리자이거나 글쓴 본인인 경우만 삭제 가능 --%>
													<div class="btn_contents">
														<button class="update_btn" onclick="move_comment_update(this.form)">수정</button>
														<button class="delete_btn" onclick="move_comment_delete(this.form)">삭제</button>
													</div>
														<input type="hidden" name="idxc_idx" value="${k.idxc_idx}">
														<input type="hidden" name="c_bor" value="notice">
														<input type="hidden" name="n_idx" value="${k.n_idx}">
														<input type="hidden" name="cPage" value="${cPage}">
													<div id="update_form">
														<textarea rows="3" cols="40" name="c_con" placeholder="댓글을 수정하세요." required>${k.c_con}
														</textarea>
														<input type="submit" class="update_btn" value="저장">
													</div>
													
										 		</li>
										 	</ul>
											<%-- 컨트롤러 가서 DB 삭제 후 다시 이곳으로 와야 한다. (나중에 ajax로 변경하자) --%>
											
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
										<input type="hidden" name="n_idx" value="${nvo.n_idx}">
										<input type="hidden" name="cPage" value="${cPage}">
										<input type="hidden" name="c_out" value="0">
										<input type="hidden" name="c_bor" value="notice">
										<input type="submit" class="insert_btn" value="등록">
									</div>
								</fieldset>
							</form>
						</div>
		                
		                
			            <div>               
			                <div class="button_box">
			                    <button class="cancle" onclick="move_notice()">목록</button>  
			                    <form method="post">  
				                	<input type="hidden" name="cPage" value="${cPage}" /> 
				                	<input type="hidden" name="n_idx" value="${nvo.n_idx}" /> 
				                	<input type="hidden" name="a_idx" value="${nvo.a_idx}" /> 
				                	 
				                	<span>
					                    <button class="write" onclick="move_notice_update(this.form)">수정</button>   
					                    <button class="delete" onclick="move_notice_delete(this.form)">삭제</button>     
				                    </span>
	                			</form>
			                </div>
			            </div>
                    </li>
                </ul>
            </div>
        	<!-- 컨텐츠 영역(main) 끝 -->
        	
        	
        	<!-- footer 불러오기 -->
        	<jsp:include page="../common/sub_footer.jsp"></jsp:include>
        </main>
        	
        <!-- 모바일 메뉴 불러오기 -->
        <jsp:include page="../common/sub_m_menu.jsp"></jsp:include>
    </div>
    
    
    <jsp:include page="../common/topBtn.jsp"></jsp:include>
    

    
    <script>
    function move_comment_update(f){
   	    // 수정 폼을 포함하는 div를 찾습니다.
   	    f.action="/notice/comment_update"
   	    var updateForm = document.getElementById("update_form");
   	    
   	    // 수정 폼의 표시 상태를 토글합니다.
   	    if (updateForm.style.display === "none" || updateForm.style.display === "") {
   	        updateForm.style.display = "block";
   	    } else {
   	        updateForm.style.display = "none";
   	    }
    }
    
    function move_comment_delete(f){
    	if(${clist.u_id == sessionScope.u_id}){ 
	    	if(removeCheck()){
		    	f.action="/comment/commentdelete";
		    	f.submit();
	    	}
    	}else{
    		alert("작성자만 삭제할 수 있습니다.");
    	}
    }
    
    function removeCheck() {
    	return confirm("정말 삭제하시겠습니까??");
    }
    
    function move_notice_delete(f){
    	f.action="/review/delete";
    	f.submit();
    }
    
    function move_notice_update(f) {
		f.action="/review/update";
		f.submit();
	}
    
        $(document).ready(function () {
            function toggleSidebar() {
                $(".button").toggleClass("active");
                $("main").toggleClass("move-to-left");
                $(".sidebar-item").toggleClass("active");
                $(".sidebar-item").toggleClass("active");
            }

            $(".button").on("click tap", function () {
                toggleSidebar();
            });

            
        });

        const btns = document.querySelectorAll(".sub_menu_area, .btn");

        btns.forEach((btn) => {
            btn.addEventListener("click", () => {
                const faqItem = btn.parentNode;
                const isActive = faqItem.classList.contains("active");

                removeActiveClasses();

                if (!isActive) {
                    faqItem.classList.add("active");
                }
            });
        });

        function removeActiveClasses() {
            btns.forEach((btn) => {
                btn.parentNode.classList.remove("active");
            });
        }

        function open_chatroom(){
            var windowWidth = $( window ).width(); 
            if(windowWidth > 1000) {
                //창 가로 크기가 500 미만일 경우  
                console.log("1000px 이상");
                
                $(".sidebar").addClass("displayNone");
                $(".sidebar").removeClass("displayBlock");
                $("main").removeClass("move-to-left");
                $(".button").removeClass("active");

                
                    
            } else if(windowWidth > 768) {
                //창 가로 크기가 500 미만일 경우  
                console.log("768px 이상");
                $(".sidebar").removeClass("displayNone");
                $(".sidebar").addClass("displayBlock");
                
            } else if(windowWidth > 480) {
                //창 가로 크기가 500 미만일 경우  
                console.log("480px 이상");
                $(".sidebar").removeClass("displayNone");
                $(".sidebar").addClass("displayBlock");
            }
        }

        $( window ).resize(function() {
            //창크기 변화 감지
            open_chatroom();
        });

        open_chatroom();

        // sroll top Script
        const basicScrollTop = function () {
            // The button
            const btnTop = document.querySelector('#goTop');
            // Reveal the button
            const btnReveal = function () {
                if (window.scrollY >= 300) {
                    btnTop.classList.add('is-visible');
                } else {
                    btnTop.classList.remove('is-visible');
                }
            }
            // Smooth scroll top
            // Thanks to => http://stackoverflow.com/a/22610562
            const TopscrollTo = function () {
                if (window.scrollY != 0) {
                    setTimeout(function () {
                        window.scrollTo(0, window.scrollY - 30);
                        TopscrollTo();
                    }, 5);
                }
            }
            // Listeners
            window.addEventListener('scroll', btnReveal);
            btnTop.addEventListener('click', TopscrollTo);

        };
        basicScrollTop();
    </script>
</body>
</html>