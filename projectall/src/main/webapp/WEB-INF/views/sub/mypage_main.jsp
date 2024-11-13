<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이 페이지</title>
	<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    
    <link rel="stylesheet" href="resources/css/menu.css" />
    <link rel="stylesheet" href="resources/css/mypage_main.css" />
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
                    <li class="textcenter">
                        <h2 class="great_title_my">마이페이지</h2>
                        
                        <!-- 마이 페이지 메뉴 -->
                        <jsp:include page="../common/mypage_menu.jsp"></jsp:include>
                        
                        <!-- 마이 페이지 프로필 -->
                        <jsp:include page="../common/mypage_profile.jsp"></jsp:include>
                        
                        <!-- 나의 녹지 스크랩 -->

                        <!-- 나의 리뷰 -->
                        <div class="my_review_list">
                            <div class="title">
                                <p>나의 리뷰</p>

                                <span onclick="my_review()">
                                    <p>더보기</p> <i class="material-icons">chevron_right</i>
                                </span>
                            </div>

                            <ul class="photo_list_ul">
                                <li onclick="my_review()">
                                    <div class="photo_list_img box">
                                        <img src="resources/images/${list.rev_filename }" alt="" class="content">
                                    </div>
                                    <div class="contents">
                                        <p class="place_name">조회수</p>
                                        <p class="place_content">
                                            ${list.rev_hit }                        
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>


                        <!-- 게시판 리스트 -->
                        <ul class="my_borad_list">
                            <li>
                                <div class="title">
                                    <p>1 : 1 문의 내역</p>
                                    <span onclick="my_qna()">
                                        <p>더보기</p> <i class="material-icons">chevron_right</i>
                                    </span>
                                </div>
                                <ul class="list">
                                    <c:forEach items="">
                                    <li onclick="my_qna()">
                                        <p>1: 1 문의 타이틀 입니다.</p>
                                        <span>2024.00.00</span>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </li>
                            <li>
                                <div class="title">
                                    <p>불편사항 신고 내역</p>

                                    <span onclick="my_customer()">
                                        <p>더보기</p> <i class="material-icons">chevron_right</i>
                                    </span>
                                </div>
                                <ul class="list">
                                    <li onclick="my_customer()">
                                        <p>신고 내역 타이틀 입니다.</p>
                                        <span>2024.00.00</span>
                                    </li>
                                    <li onclick="my_customer()">
                                        <p>신고 내역 타이틀 입니다.</p>
                                        <span>2024.00.00</span>
                                    </li>
                                    <li onclick="my_customer()">
                                        <p>신고 내역 타이틀 입니다.</p>
                                        <span>2024.00.00</span>
                                    </li>
                                    <li onclick="my_customer()">
                                        <p>신고 내역 타이틀 입니다.</p>
                                        <span>2024.00.00</span>
                                    </li>
                                    <li onclick="my_customer()">
                                        <p>신고 내역 타이틀 입니다.</p>
                                        <span>2024.00.00</span>
                                    </li>
                                </ul>
                            </li>
                        </ul>
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
	
	    
	    if (jQuery(window).width() > 0) {
	        jQuery(window).on("scroll", function (ev) {
	            if (jQuery(window).scrollTop() > 0) {
	                jQuery('.mypage_nav').addClass('bg_on');
	            } else {
	                jQuery('.mypage_nav').removeClass('bg_on');
	            }
	            return false;
	        });
	    }
	
	
	    //숫자 카운트 애니메이션
	    $('.nums').each(function () {
	        const $this = $(this),
	            countTo = $this.attr('data-count');
	
	        $({
	            countNum: $this.text()
	        }).animate({
	            countNum: countTo
	        }, {
	            duration: 500,
	            easing: 'linear',
	            step: function () {
	                $this.text(Math.floor(this.countNum));
	            },
	            complete: function () {
	                $this.text(this.countNum);
	            }
	        });
	    });
    </script>
</body>
</html>