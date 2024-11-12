<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="resources/css/sub1-1.css" />
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
            <div id="sub_container2">
                <ul class="contents_box">
                    <li class="textleft">
                        <h2 class="great_title">공원이야기</h2>
                        <p class="subheading_title">도심 공원에서 만나는 자연과 지속가능성</p>
                        
                        <p class="content1">
				            대한민국의 도심공원은 도시 내에서 자연환경을 조성하고 시민들에게 녹지 공간을 제공하기 위한 목적으로 만들어졌습니다. 도심공원의 역사는 20세기 초 일제강점기 시절까지 거슬러 올라가며, 당시 서구식 공원의 개념이 도입되어 공공 휴식 공간이 조성되기 시작했습니다. 해방 후 대한민국의 경제 성장과 도시화가 
				            가속화되면서, 공원의 역할은 단순한 휴식 공간에서 벗어나 도시 내 환경 보전, 생태계 보호, 그리고 시민들의 건강 증진과 여가 활동을 위한 필수적 요소로 
				            자리잡게 되었습니다.
				        </p>
                    </li>
                </ul>
            </div>

		    <section class="contents1">
		        <div class="text">
		            <p class="title2">남산공원</p>
		            <p class="text1">
		                남산공원은 1900년대 초반에 조성되었으며, 
		                <br>
		                당시에는 일본의 식민지 지배 하에 있었습니다. 
		                <br>
		                이 공원은 도심 속에서 자연을 경험할 수 있는 공간으로 
		                <br>
		                만들어졌고, 시민들에게 휴식과 여가를 제공하는 
		                <br>
		                역할을 했습니다. 남산공원은 현재도 서울의 
		                <br>
		                주요 관광 명소 중 하나로, 많은 사람들이 방문하는 장소입니다. 
		                <br>
		                대한민국 최초의 공원
		            </p>
		        </div>
		    </section>
					    
            

		    <section class="contents3">
		    	<p class="content1">
		        	도심공원의 정의는 크게 '도시 내에 조성되 녹지 공간'으로 요약할 수 있습니다.
		            <br>
		            이는 도시 환경에서 자연과 인간의 공존을 가능하게 하는 중요한 공공 자원으로, 기후 변화 대응, 공기 질 개선, 생물 다양성 보전 등 환경적 기능을 수행합니다.
		           <br>
		           또한, 도심공원은 주민들이 일상 속에서 자연을 경험하고 사회적 상호작용을 촉진하는 장소로, 공동체 형성에 기여하는 역할을 담당합니다. 
		           <br>
		           오늘날 대한민국의 도심공원은 이러한 다양한 역할을 수행하며, 지속 가능한 도시 개발을 위한 필수적인 인프라로 인식되고 있습니다.           
		        </p>
		    </section>
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