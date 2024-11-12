<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인</title>
	<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    
    <link rel="stylesheet" href="resources/css/menu.css" />
    <link rel="stylesheet" href="resources/css/login.css" />
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
                    <li id="box" class="textleft">
                        <h2 id="logintxt">로그인</h2>
					<form action="loginok" method="post" style="margin-top: 29px">
						<h3 class="h3">아이디</h3>
						<input class="id" type="text"
							style="border-bottom: 1px solid #dddddd;"
							placeholder="아이디를 입력해주세요.">
						<h3 class="h3">비밀번호</h3>
						<input class="pw" type="password"
							style="border-bottom: 1px solid #dddddd;"
							placeholder="비밀번호를 입력해주세요.">
						<button id="loginbtn" onclick="submit()">로그인</button>
					</form>
					<div id="three">
						<a href="/idFindGo" class="tmp">아이디 찾기</a>
						<a href="/pwFindGo" class="tmp">비밀번호 찾기</a> 
						<a href="/joinGo" class="tmp">회원가입</a>
					</div>
					<div style="padding: 20px 0px;">
						<p class="ptag">아이디와 비밀번호 입력하기 귀찮으시죠?</p>
						<p class="ptag">1초 회원가입으로 입력없이 간편하게 로그인 하세요.</p>
					</div>
					
				
					<button class="sns kakao" onclick="location.href='https://kauth.kakao.com/oauth/authorize?client_id=673fbc7db4cc9805a5120f9f38a7289a&redirect_uri=http://localhost:8080/kakaologin&response_type=code'">카카오 로그인</button>
					<button class="sns naver" onclick="location.href='https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=bv_786diGR8Y0y00e9Bx&redirect_uri=http://localhost:8080/naverlogin&state=STATE_STRING'">네이버로 로그인</button>
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
    </script>
</body>
</html>