<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>마이 페이지 - 회원정보 수정</title>
	<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    
    <link rel="stylesheet" href="resources/css/menu.css" />
    <link rel="stylesheet" href="resources/css/mypage_main.css" />
    <link rel="stylesheet" href="resources/css/my_info_mody.css" />
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
                        <h2 class="great_title">마이페이지</h2>
                        <p class="subheading_title_my">회원정보 수정</p>
                        
                        <!-- 마이 페이지 메뉴 -->
                        <jsp:include page="../common/mypage_menu.jsp"></jsp:include>
                        
                        <!-- 마이 페이지 프로필 -->
                        <jsp:include page="../common/mypage_profile.jsp"></jsp:include>
                        
                        <div class="my_info_mody">
	                        <!-- 마이 페이지 내용 시작 -->
	                        <form action="/emailchk" method="post">
								<h3 class="h3">
									비밀번호 <label class="star">*</label>
								</h3>
								<input class="joininput width100" type="password" name="u_pw" id="pwid"
									placeholder="비밀번호를 입력해주세요." required>
									<span id="pwtest"></span>
								<h3 class="h3">
									비밀번호 확인 <label class="star">*</label>
								</h3>
								<input class="joininput width100" type="password" name="u_pwchk" id="pwchkid"
									placeholder="비밀번호를 다시 입력해주세요." required> <span id="pwOK">비밀번호가
									일치하지 않습니다.</span>
								<h3 class="h3">
									이름 <label class="star">*</label>
								</h3>
								<input class="joininput width100" type="text" name="u_na"
									placeholder="이름을 입력해주세요." required>
								<h3 class="h3">
									휴대전화 <label class="star">*</label>
								</h3>
								<input class="joininput width100" id="phone" type="text" name="u_phone"
									placeholder="-없이 입력해주세요." required>
								<h3 class="h3">
									성별 <label class="star">*</label>
								</h3>
									<select name="u_gen" id="gen">
										<option value="male">남성</option>
										<option value="female">여성</option>
									</select>
								<h3 class="h3">
									생년월일 <label class="star">*</label>
								</h3>
								<div id="bir">
									<input type="date" name="u_bir" class="birth width100">
									<!-- <span>년</span>
									<input type="number" name="u_bir_m" class="birth" max="12">
									<span>월</span>
									<input type="number" name="u_bir_d" class="birth">
									<span>일</span>		 -->					
								</div>
								<button class="joinbtn width100" onclick="joinTry(this.form)" disabled>회원정보 수정</button>
							</form>
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
    $("#pwid").keyup(function(){
		// 비밀번호 정규식
		let pwdtest = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*[0-9])[A-Za-z\d!@#$%^&*]{8,15}$/;
		// pw 값 가져오기
		let pw = document.getElementById("pwid");
		// pw 값이 입력 되었을때
		if(pw != null){
			// 정규식으로 pw값 검사 false일때
			if(!pwdtest.test(pw.value)){
				$("#pwtest").text("비밀번호는 영어 대/소문자,특수문자,숫자를 포함하여 8자이상 15자이내여야 합니다.");
				pwtestok = 0;
			// 정규식으로 pw값 검사 true 일때
			}else{
				$("#pwtest").text("");
				pwtestok = 1;
				// function 실행 
				enabled();
			}
		}
	});	
    

	// 비밀번호, 비밀번호 확인 키보드 입력시
	$("#pwchkid, #pwid").keyup(function(){
		// p 비밀번호 값
		let p = document.getElementById("pwid").value;
		// pwch 비밀번호 확인 값
		let pwch = document.getElementById("pwchkid").value;
		
		// 값이 같으면
		if(p == pwch){
			$("#pwOK").text("비밀번호가 일치합니다.");
			$("#pwOK").css("color", "green");
			pwchkok = 1;
			// function 실행
			enabled();
		// 값이 다르면
		}else{
			$("#pwOK").text("비밀번호가 일치하지 않습니다.");
			$("#pwOK").css("color", "red");
			pwchkok = 0;
		}
		
	});
	
	
	// 회원가입 버튼 활성화
	function enabled() {
		console.log(pwtestok+","+pwchkok)
		// 비밀번호 정규식, 비밀번호 확인, 필수 체크박스 체크시 
		if(pwtestok == 1 && pwchkok == 1){
				// 버튼 활성화, 색 #111111로 변경
			$(".joinbtn").prop("disabled", false).css("background-color", "#111111");
		} else{
			$(".joinbtn").prop("disabled", true).css("background-color", "#999999");
		}
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