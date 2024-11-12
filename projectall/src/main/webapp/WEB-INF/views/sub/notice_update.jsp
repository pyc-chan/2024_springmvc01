<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>공원 이야기</title>
	<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    
    <link rel="stylesheet" href="resources/css/menu.css" />
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/notice_write.css" />
	<link rel="stylesheet" href="resources/css/summernote-lite.css">
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
	
	
							<form method="post" encType="multipart/form-data">
	                        <div class="content_box">
				                <ul>
				                    <li class="row">
				                        <div class="label">옵션</div>
				                        <div class="input">
					                        <c:choose>
					                        	<c:when test="${gvo.n_chk == 'check'}">
						                        	<label>
						                        		<input type="checkbox" name="n_chk" value="check" checked> 공지
						                        	</label>
					                        	</c:when>
					                        	<c:otherwise>
						                        	<label>
						                        		<input type="checkbox" name="n_chk" value="check"> 공지
						                        	</label>
					                        	</c:otherwise>
					                        </c:choose>
				                        </div>
				                    </li>
				                    <li class="row">
				                        <div class="label">카테고리</div>
				                        <div class="input">
				                        	<select name="n_opt" class="board_select" required>
				                        		<option value="공원">공원</option>
				                        		<option value="가로수길">가로수길</option>
				                        		<option value="보호수">보호수</option>
				                        		<option value="녹지행사">녹지행사</option>
				                        	</select>
				                        	<div class="choose_category"><span>현재 카테고리 :</span> ${gvo.n_opt}</div>
				                        </div>
				                    </li>
				                    <li class="row">
				                        <div class="label">제목</div>
				                        <div class="input">
				                        	<input type="text" name="n_tle" class="in_title" value="${gvo.n_tle}" placeholder="제목을 입력해주세요." required>
				                        </div>
				                    </li>
				                    <li class="top">
				                        <div class="label">내용</div>
				                        <div class="input">
				                        	<textarea id="content" name="n_con" rows="20" placeholder="내용을 입력해주세요.">
				                        		${gvo.n_con}
				                        	</textarea>
				                        </div>
				                    </li>
				                    <li class="row">
				                        <div class="label">첨부파일</div>
				                        <div class="input">
											<c:choose>
												<c:when test="${empty gvo.f_name}">
													<div class="filebox">
													    <input class="upload-name" value="파일찾기를 클릭해서 첨부파일을 등록해주세요." placeholder="파일찾기를 클릭해서 첨부파일을 등록해주세요.">
													    <label for="file">파일찾기</label> 
													    <input type="file" id="file" name="file_name">
													    <b>이전 파일 없음</b>
														<input type="hidden" name="old_file_name" value="">
													</div>
												</c:when>
												<c:otherwise>
													<div class="filebox">
													    <input class="upload-name" value="${gvo.f_name}" placeholder="파일찾기를 클릭해서 첨부파일을 등록해주세요.">
													    <label for="file">파일찾기</label> 
													    <input type="file" id="file" name="file_name">
													</div>
											
						                            <div class="file_lst">
						                                <label><span>다운로드 : </span> <a href="">${gvo.f_name}</a></label>
						                            </div>
												</c:otherwise>
											</c:choose>
				                        
				                        	
				                        </div>
				                    </li>
				                </ul>
				            </div>
							
				            <div class="button_box">    
				                <div>
				                	<input type="hidden" name="cPage" value="${cPage}" /> 
									<input type="hidden" name="idxn_idx" value="${gvo.idxn_idx}" /> 
				                    <button class="write" onclick="move_notice_update_ok(this.form)">작성완료</button>    
				                    <input type="button" class="cancle" value="목록" onclick="move_notice()">
				                </div> 
				            </div>
            				</form>
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
    
    
	<script src="resources/js/summernote-lite.js" ></script>
	<script src="resources/js/lang/summernote-ko-KR.js" ></script>
	
	<script type="text/javascript">
		$(function() {
			$("#content").summernote({
				lang : 'ko-KR',
				height : 300,
				focus : true,
				placeholder : "최대 3000자까지 쓸 수 있습니다.",
				callbacks : {
		        	onImageUpload : function(files, editor) {
						for (let i = 0; i < files.length; i++) {
							sendImage(files[i], editor);
						}
					}
		        }
			});
		});
		
		function sendImage(file, editor) {
			// FormData 객체를 전송할 때 , JQuery 가 설정
			let frm = new FormData();
			frm.append("s_file", file);
			$.ajax({
				url : "/saveImg",
				data: frm,
				method: "post",
			  	contentType : false,
			  	processData : false,
				cache : false,
				dataType : "json",
				success : function(data) {
					const path = data.path;
					const fname = data.fname;
					$("#content").summernote("editor.insertImage", path+"/"+fname);
				},
				error : function() {
					alert("읽기 실패");
				}
			});	
		}
	</script>
    
    <script src="resources/js/common.js"></script>
    <script>
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