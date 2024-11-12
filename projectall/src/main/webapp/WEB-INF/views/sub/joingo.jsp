<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
    
    <link rel="stylesheet" href="resources/css/menu.css" />
    <link rel="stylesheet" href="resources/css/join.css" />
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
						<h2 id="jointxt">회원가입</h2>
                        
						<form action="/emailchk" style="margin-top: 29px" method="post">
							<h3 class="h3">
								아이디 <label class="star">*</label>
							</h3>
							<div id="idflex">
							<input class="joininput" type="text" name="u_id" id="uid"
								placeholder="아이디를 입력해주세요." required>
							<button id="id_chk" onclick="idchk(this.form)">중복 확인</button>
							</div>
							<label id="idchkresult">중복 확인을 해주세요</label>
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
							<div class="emailsec width100">
								<h3 class="h3">
									이메일 <label class="star">*</label>
								</h3>
								<div id="flexbox">
								<input class="email" id="email" type="text" name="u_em"
									style="border-bottom: 1px solid #dddddd;"
									placeholder="입력해주세요." required>
								<span class="com">@</span>
								<input class="email" id="emailback" type="text" name="u_emailback"
									style="border-bottom: 1px solid #dddddd;"
									placeholder="입력해주세요." required readonly
									pattern="[a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*">
								<select name="u_emailbacks" id="emailselect" onchange="change_input(this.value)">
									<option value="null">선택하세요</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="nate.com">nate.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="yahoo.com">yahoo.com</option>
									<option value="select">직접 입력</option>
								</select>
								</div>
							</div>
							<label>
								<div class="option width100">
									<input id="allchk" type="checkbox" /> 
									<span class="optiontxt">약관 전체 동의하기</span>
								</div>
							</label>
							<label>
								<div class="optiondetail width100">
									<input class="optionchk" id="essential1" type="checkbox" />
									<span class="optiontxt">(필수)이용약관에 동의합니다.</span>
								</div>
							</label>
							<label>
								<div class="optiondetail width100">
									<input class="optionchk" id="essential2" type="checkbox" />
									<span class="optiontxt">(필수)이용약관에 동의합니다.</span>
								</div>
							</label>
							<label>
								<div class="optiondetail width100">
									<input class="optionchk" type="checkbox" />
									<span class="optiontxt">(선택)이용약관에 동의합니다.</span>
								</div>
							</label>
							<label>
								<div class="optiondetail width100">
									<input class="optionchk" type="checkbox" />
									<span class="optiontxt">(선택)이용약관에 동의합니다.</span>
								</div>
							</label>
							<button class="joinbtn width100" onclick="joinTry(this.form)" disabled>회원가입</button>
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
    
	
	
	<script src="resources/js/joingo.js"></script>
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