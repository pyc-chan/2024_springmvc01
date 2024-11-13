<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Green Spot Finder</title>
	<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
	<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/weather.css"><!-- 날씨 위젯 추가 -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script defer src="resources/js/swiper_controller.js"></script>

	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="/resources/js/weather.js"></script><!-- 날씨 위젯 추가 -->
</head>
<body>

<div id="container">
   <div class="wrap">
       <h1 style="text-align: center;" onclick="move_main()">
           <img src="resources/images/logo.png" alt="logo">
       </h1>
   </div>
   <div class="nav-left visible-xs">
       <div class="button" id="btn">
           <div class="bar top"></div>
           <div class="bar middle"></div>
           <div class="bar bottom"></div>
       </div>
   </div>
   <!-- nav-left -->
   <main class="move-to-left2">
       <div class="contents">

           <ul class="search_container">
               <li class="search">
                   <div class="search_div">
                       <form action="/total_search" method="get">
                           <input type="text" name="search_name" placeholder="주소를 입력하세요">
                           <button type="submit">
                           		<span class="material-icons">search</span>
                           </button>
                       </form>
                   </div>
               </li>
               <li class="gnb_menu">
                   <ul class="gnb" id="menu">
    <!-- 로그인 전 -->
    <li id="login" onclick="move_login()">
        <span class="material-symbols-outlined">person</span>
        <p>로그인</p>
    </li>
    <li id="join" onclick="move_join()">
        <span class="material-symbols-outlined">login</span>
        <p>회원가입</p>
    </li>
    <li id="customer" onclick="move_customer()">
        <span class="material-symbols-outlined">headphones</span>
        <p>고객센터</p>
    </li>
</ul>

<script>
    // 예시: 세션에서 로그인 상태를 확인하는 함수
    function checkLoginStatus() {
        // 세션에서 로그인 여부를 확인 (예: true/false)
        const isLoggedIn = sessionStorage.getItem('isLoggedIn') === 'true';
        const isAdmin = sessionStorage.getItem('isAdmin') === 'true';

        const menu = document.getElementById('menu');

        // 로그인 상태에 따라 메뉴 항목을 설정
        if (isLoggedIn) {
            // 로그인한 경우
            menu.innerHTML = `
                <li onclick="move_logout()">
                    <span class="material-icons">logout</span>
                    <p>로그아웃</p>
                </li>
                <li onclick="move_mypage_main()">
                    <span class="material-symbols-outlined">edit_document</span>
                    <p>MyPage</p>
                </li>
                <li onclick="move_customer()">
                    <span class="material-symbols-outlined">headphones</span>
                    <p>고객센터</p>
                </li>
            `;

            // 관리자일 경우 추가 메뉴
            if (isAdmin) {
                menu.innerHTML += `
                    <li onclick="move_accounts()">
                        <span class="material-symbols-outlined">manage_accounts</span>
                        <p>관리자</p>
                    </li>
                `;
            }
        }
    }

    // 페이지 로드 시 로그인 상태 확인
    window.onload = checkLoginStatus;
</script>

               </li>
           </ul>

           <section class="garosu_main_contents">
               <ul>
                   <li>
                       <div class="garosu_slider">
                           <!-- Slider main container -->
                           <div class="swiper">
                               <!-- Additional required wrapper -->
                               <div class="swiper-wrapper">
                                   <div class="swiper-slide" onclick="move_sub1_2()" style="background-image: url('resources/images/main_slide_1.jpg');">
                                       <div class="text_box">
                                           <h2>공원찾기</h2>
                                           <p>공원을 지역별로 찾을 수 있습니다.</p>
                                       </div>
                                   </div>
                                   <div class="swiper-slide" onclick="move_sub2_2()" style="background-image: url('resources/images/main_slide_2.jpg');">
                                       <div class="text_box">
                                           <h2>가로수길 찾기</h2>
                                           <p>가로수길을 지역별로 찾을 수 있습니다.</p>
                                       </div>
                                   </div>
                                   <div class="swiper-slide" onclick="move_sub3_2()" style="background-image: url('resources/images/main_slide_3.jpg');">
                                       <div class="text_box">
                                           <h2>보호수 찾기</h2>
                                           <p>보호수를 지역별로 찾을 수 있습니다.</p>
                                       </div>
                                   </div>
                               </div>
                               <!-- If we need pagination -->
                               <!-- <div class="swiper-pagination"></div> -->
               
                               <!-- If we need navigation buttons -->
                               <div class="swiper-button-prev">
                                   <div class="material-icons">arrow_back</div>
                               </div>
                               <div class="swiper-button-next">
                                   <div class="material-icons">arrow_forward</div>
                               </div>
                           </div>
                       </div>
                   </li>
                   <li>
                       <div class="garosu_find" onclick="move_sub2_3()">
                           <p>가로수길 찾기</p>
                           <em>
                               원하시는 가로수길 산책 경로를 <br> 
                               찾을 수 있습니다.
                           </em>
                       </div>
                       <div class="garosu_status" onclick="move_sub3_3()">
                           <p>보호수 현황</p>
                           <em>
                               대한민국의 보호수는 생물학적, 역사적, <br> 
                               문화적 가치를 지닌 나무로, 법적으로  <br>
                               보호받는 대상입니다. 
                           </em>
                       </div>
                   </li>
               </ul>
           </section>

           <section class="event_find_contents">
               <p class="title">녹지행사찾기</p>
               <ul>
                   <li>
                       <div class="event_slider">
                           <!-- Slider main container -->
                           <div class="swiper">
                               <!-- Additional required wrapper -->
                               <div class="swiper-wrapper">
                                   <!-- Slides -->
                                   <div class="swiper-slide" onclick="move_sub4_1()">
                                       <img src="resources/images/event_banner_1.jpg" alt="event_banner_1">
                                       <div>
                                           <span>녹지행사</span>
                                           <h3>2024 상상스타터클래스 2024 상상스타터클래스 2024 상상스타터클래스</h3>
                                           <p>
                                               강의 : 2024.10.31~2024.11.30 <br>
                                               접수 : 2024.09.26~2024.10.21
                                           </p>
                                       </div>
                                   </div>
                                   <div class="swiper-slide" onclick="move_sub4_1()">
                                       <img src="resources/images/event_banner_2.jpg" alt="event_banner_2">
                                       <div>
                                           <span>녹지행사</span>
                                           <h3>2024 상상스타터클래스 2024 상상스타터클래스 2024 상상스타터클래스</h3>
                                           <p>
                                               강의 : 2024.10.31~2024.11.30 <br>
                                               접수 : 2024.09.26~2024.10.21
                                           </p>
                                       </div>
                                   </div>
                                   <div class="swiper-slide" onclick="move_sub4_1()">
                                       <img src="resources/images/event_banner_3.jpg" alt="event_banner_3">
                                       <div>
                                           <span>녹지행사</span>
                                           <h3>2024 상상스타터클래스 2024 상상스타터클래스 2024 상상스타터클래스</h3>
                                           <p>
                                               강의 : 2024.10.31~2024.11.30 <br>
                                               접수 : 2024.09.26~2024.10.21
                                           </p>
                                       </div>
                                   </div>
                                   <div class="swiper-slide" onclick="move_sub4_1()">
                                       <img src="resources/images/event_banner_4.jpg" alt="event_banner_4">
                                       <div>
                                           <span>녹지행사</span>
                                           <h3>2024 상상스타터클래스 2024 상상스타터클래스 2024 상상스타터클래스</h3>
                                           <p>
                                               강의 : 2024.10.31~2024.11.30 <br>
                                               접수 : 2024.09.26~2024.10.21
                                           </p>
                                       </div>
                                   </div>
                                   <div class="swiper-slide" onclick="move_sub4_1()">
                                       <img src="resources/images/event_banner_5.jpg" alt="event_banner_5">
                                       <div>
                                           <span>녹지행사</span>
                                           <h3>2024 상상스타터클래스 2024 상상스타터클래스 2024 상상스타터클래스</h3>
                                           <p>
                                               강의 : 2024.10.31~2024.11.30 <br>
                                               접수 : 2024.09.26~2024.10.21
                                           </p>
                                       </div>
                                   </div>
                               </div>
               
                               <!-- If we need navigation buttons -->
                               <div class="swiper-button-prev">
                                   <div class="material-icons">arrow_back</div>
                               </div>
                               <div class="swiper-button-next">
                                   <div class="material-icons">arrow_forward</div>
                               </div>
                           </div>
                       </div>
                   </li>
                   <li class="calendar" onclick="move_sub4_2()">
                       
                   </li>
               </ul>
           </section>

           <section class="notice_contents">
               <p class="title">공지사항</p>
               <ul>
                   <li onclick="move_notice_detail()">
                       <span class="category">카테고리</span>
                       <p class="title">공지사항 타이틀 입니다. 공지사항 타이틀 입니다.공지사항 타이틀 입니다.공지사항 타이틀 입니다.</p>
                       <em>2024.00.00</em>
                   </li>
                   <li onclick="move_notice_detail()">
                       <span class="category">카테고리</span>
                       <p class="title">공지사항 타이틀 입니다.</p>
                       <em>2024.00.00</em>
                   </li>
                   <li onclick="move_notice_detail()">
                       <span class="category">카테고리</span>
                       <p class="title">공지사항 타이틀 입니다.</p>
                       <em>2024.00.00</em>
                   </li>
                   <li onclick="move_notice_detail()">
                       <span class="category">카테고리</span>
                       <p class="title">공지사항 타이틀 입니다.</p>
                       <em>2024.00.00</em>
                   </li>
               </ul>
               <button onclick="move_notice()">전체보기</button>
           </section>

           <section class="review_contents">
               <p class="title">리뷰</p>
               <ul>
                   <li onclick="move_review_detail()">
                       <img src="resources/images/rewiew_1.jpg" alt="rewiew_1">
                       <div class="contents_box">
                           <p>타이틀입니다. 타이틀입니다. 타이틀입니다. 타이틀입니다.</p>
                           <em>내용입니다.</em>
                       </div>
                   </li>
                   <li onclick="move_review_detail()">
                       <img src="resources/images/rewiew_2.jpg" alt="rewiew_2">
                       <div class="contents_box">
                           <p>타이틀입니다.</p>
                           <em>내용입니다.</em>
                       </div>
                   </li>
                   <li onclick="move_review_detail()">
                       <img src="resources/images/rewiew_3.jpg" alt="rewiew_3">
                       <div class="contents_box">
                           <p>타이틀입니다.</p>
                           <em>내용입니다.</em>
                       </div>
                   </li>
                   <li onclick="move_review_detail()">
                       <img src="resources/images/rewiew_4.jpg" alt="rewiew_4">
                       <div class="contents_box">
                           <p>타이틀입니다.</p>
                           <em>내용입니다.</em>
                       </div>
                   </li>
                   <li onclick="move_review_detail()">
                       <img src="resources/images/rewiew_5.jpg" alt="rewiew_5">
                       <div class="contents_box">
                           <p>타이틀입니다.</p>
                           <em>내용입니다.</em>
                       </div>
                   </li>
                   <li onclick="move_review_detail()">
                       <img src="resources/images/rewiew_6.jpg" alt="rewiew_6">
                       <div class="contents_box">
                           <p>타이틀입니다.</p>
                           <em>내용입니다.</em>
                       </div>
                   </li>
               </ul>
               <button onclick="move_review()">전체보기</button>
           </section>

           <section class="customer_contents">
               <ul>
                   <li onclick="move_customer()">
                       <p>고객의 소리</p>

                   </li>
                   <li onclick="move_faq()">
                       <p>자주하는 질문</p>
                   </li>
               </ul>
           </section>
       </div>

       

       <footer>
           <ul>
               <li>
                   <img src="resources/images/logo.png" alt="logo" onclick="move_main()">
                   
                   <p>
                       TEL : <a href="tel:02-739-7235">02-739-7235</a> | FAX : 
                       <a href="tel:02-733-3460">02-733-3460</a><br>
                       주소 : 서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
                   </p>
                   
                   <ul class="f_menu">
                       <li onclick="privacy()">개인정보처리방침</li>
                       <li onclick="terms_of_use()">이용약관</li>
                       <li onclick="move_customer()">고객센터</li>
                       <li onclick="move_notice()">공지사항</li>
                   </ul>
                   <p>© Green Spot Finder. All Rights Reserved.</p>
               </li>
               <li>
                   <ul class="icon">
                       <li class="kakaotalk" onclick="window.open('https://www.kakaocorp.com/page/service/service/KakaoTalk')"></li>
                       <li class="instagram" onclick="window.open('https://www.instagram.com/sem/campaign/emailsignup/?campaign_id=13530338586&extra_1=s%7Cc%7C547419126422%7Ce%7Cistagramm%7C&placement=&creative=547419126422&keyword=istagramm&partner_id=googlesem&extra_2=campaignid%3D13530338586%26adgroupid%3D126262418054%26matchtype%3De%26network%3Dg%26source%3Dnotmobile%26search_or_content%3Ds%26device%3Dc%26devicemodel%3D%26adposition%3D%26target%3D%26targetid%3Dkwd-349305952548%26loc_physical_ms%3D9195932%26loc_interest_ms%3D%26feeditemid%3D%26param1%3D%26param2%3D&gad_source=1&gclid=Cj0KCQiA_qG5BhDTARIsAA0UHSLkG1iX7sOtPqARxlafYWihCv-K7Aqq_GV9fSJ5TN1IS4ABeyXr3QoaAmUREALw_wcB')"></li>
                       <li class="youtube" onclick="window.open('https://www.youtube.com/')"></li>
                   </ul>
               </li>
           </ul>
       </footer>
   </main>

   <div class="sidebar active sidebar_pc">

       <ul class="container">
           <h1>
               <img src="resources/images/logo.png" alt="logo" onclick="move_main()">
           </h1>
           
           
           
		  	<c:choose>
		  		<c:when test="${loginok == 'ok'}">
		  		</c:when>
		  		<c:otherwise>
		  			<div class="profile_container">
	                    <ul class="profile">
	                        <li>
	                            <figure>
	                                <img src="resources/images/CK_cb036052326.jpg" alt="" srcset="">
	                            </figure>
	                        </li>
	                        <li>
	                            <p class="profile_nickname">닉네임(아이디)</p>
	                            <p class="profile_email">kim03189@naver.com</p>
	                        </li>
	                    </ul>
	                    <ul class="profile_btn">
	                        <li>
	                            <button class="mypage" onclick="move_mypage_main()">마이페이지</button>
	                        </li>
	                        <li>
	                            <button class="logout" onclick="logout()">로그아웃</button>
	                        </li>
	                    </ul>
	                </div>
                    
                    
		  			<ul class="slider_gnb">
			               <li onclick="move_login">
			                   로그인
			               </li>
			               <li onclick="move_join()">
			                   회원가입
			               </li>
			               <li onclick="move_customer()">
			                   고객센터
			               </li>
			           </ul>
		  		</c:otherwise>
		  	</c:choose>

           

           <li class="main_menu">
               <div class="main_menu_area">
                   <h3 class="title">
                       공원찾기
                   </h3>
               </div>
               <div class="answer">
                   <p class="text" onclick="move_sub1_1()">
                       공원 이야기
                   </p>
                   <p class="text" onclick="move_sub1_2()">
                       지역별 공원찾기
                   </p>
                   <p class="text" onclick="move_sub1_3()">
                       다양한 공원 찾기
                   </p>
                   <p class="text" onclick="move_sub1_4()">
                       공원 연락하기
                   </p>
               </div>
               <button class="btn">
                   <i class="fa-solid fa-chevron-up icon open"></i>
                   <i class="fa-solid fa-chevron-down icon close"></i>
               </button>
           </li>
           <li class="main_menu">
               <div class="main_menu_area">
                   <h3 class="title">
                       가로수길 찾기
                   </h3>
               </div>
               <div class="answer">
                   <p class="text" onclick="move_sub2_1()">
                       가로수길 걷기
                   </p>
                   <p class="text" onclick="move_sub2_2()">
                       지역별 가로수길 찾기
                   </p>
                   <p class="text" onclick="move_sub2_3()">
                       산책코스 찾기
                   </p>
                   <p class="text" onclick="move_sub2_4()">
                       가로수길 수목 조회
                   </p>
               </div>
               <button class="btn">
                   <i class="fa-solid fa-chevron-up icon open"></i>
                   <i class="fa-solid fa-chevron-down icon close"></i>
               </button>
           </li>
           <li class="main_menu">
               <div class="main_menu_area">
                   <h3 class="title">
                       지역 속 보호수
                   </h3>
               </div>
               <div class="answer">
                   <p class="text" onclick="move_sub3_1()">
                       보호수란?
                   </p>
                   <p class="text" onclick="move_sub3_2()">
                       지역별로 찾기
                   </p>
                   <p class="text" onclick="move_sub3_3()">
                       보호수 현황표
                   </p>
               </div>
               <button class="btn">
                   <i class="fa-solid fa-chevron-up icon open"></i>
                   <i class="fa-solid fa-chevron-down icon close"></i>
               </button>
           </li>
           <li class="main_menu">
               <div class="main_menu_area">
                   <h3 class="title">
                       녹지 행사
                   </h3>
               </div>
               <div class="answer">
                   <p class="text" onclick="move_sub4_1()">
                       날짜별 행사 찾기
                   </p>
                   <p class="text" onclick="move_sub4_2()">
                       지역별로 행사 찾기
                   </p>
               </div>
               <button class="btn">
                   <i class="fa-solid fa-chevron-up icon open"></i>
                   <i class="fa-solid fa-chevron-down icon close"></i>
               </button>
           </li>
           <li class="main_menu">
               <div class="main_menu_area">
                   <h3 class="title">
                       커뮤니티
                   </h3>
               </div>
               <div class="answer">
                   <p class="text" onclick="move_notice()">
                       공지사항
                   </p>
                   <p class="text" onclick="move_review()">
                       리뷰
                   </p>
                   <p class="text" onclick="move_customer()">
                       고객의 소리
                   </p>
                   <p class="text" onclick="move_faq()">
                       자주하는 질문
                   </p>
                   <p class="text" onclick="move_qna()">
                        1:1 문의
                    </p>
                </div>
                <button class="btn">
                    <i class="fa-solid fa-chevron-up icon open"></i>
                    <i class="fa-solid fa-chevron-down icon close"></i>
                </button>
            </li>
        </ul>
        
        
        <div class="weather-widget">  <!-- 날씨위젯 부분  -->  
      		<div class="temperature"><p id="temperature"></p></div>
		    <div class="status"><p id="condition"></p></div>
		    <div class="location"><p id="location"></p></div>
		    <!-- 최고,최저온도 작업안되서 주석처리함. 체감온도는 최단기,단기예보에서는 할수없음
		         오픈 API활용가이드 # 코드값 정보 참조  -->
		    <!-- <div class="feels-like">22° / 15° 체감온도 22°</div> --> 				   
		    <div class="weather-icon">
		    	<img id="img_icon" src="/resources/images/w01.png">
		    </div>        			
        </div>
    </div>
</div>


<!-- popup -->
	<div class="popuplayout" style="display: block; position: fixed; top: 20px; left: 20px; z-index: 6; width: 520px; height: 650px; background: #ddd;">
		<img src="/resources/images/event_banner_1.jpg" alt="event_banner_1">
		<ul class="popup_btn">
			<li>
				<form method="post">
					<button onclick="popupTodayClose()">오늘 하루 보지 않기</button> 
				</form>
			</li>
			<li>
				<button onclick="popupClose()">닫기</button> 
			</li>
		</ul>
	</div>

<button id="goTop">
    <span class="material-icons">arrow_upward</span>
</button>

<script type="text/javascript" src="/resources/js/route_settings.js"></script>
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

   
   const btns = document.querySelectorAll(".main_menu_area, .btn");

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
           //창 가로 크기가 1000px 이상일 경우  
           console.log("1000px 이상");

           $("main").addClass("move-to-left2");
           $("main").addClass("move-to-left0");
           $(".button").removeClass("active");

       } else if(windowWidth > 768) {
           //창 가로 크기가 500 미만일 경우  
           console.log("768px 이상");

           if($("#btn").hasClass("active") === true) {
               // class가 존재함.
               
           } else {
               // class가 존재하지 않음	
               $("main").removeClass();
           }

           $(".sidebar").removeClass("sidebar_pc");
           $("main").removeClass("move-to-left2");

       } else if(windowWidth > 480) {
           //창 가로 크기가 500 미만일 경우  
           console.log("480px 이상");

           $(".sidebar").removeClass("sidebar_pc");
           $("main").removeClass("move-to-left2");

       } else if(windowWidth > 320) {
           //창 가로 크기가 500 미만일 경우  
           console.log("320px 이상");

           $(".sidebar").removeClass("sidebar_pc");
           $("main").removeClass("move-to-left2");
           

           function toggleSidebar() {
               $(".button").toggleClass("active");
               $("main").toggleClass("move-to-left");
           }
       }
   }

   
   open_chatroom();

   $( window ).resize(function() {
       //창크기 변화 감지
       open_chatroom();
   });

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
   
   AOS.init();
</script>
</body>
</html>