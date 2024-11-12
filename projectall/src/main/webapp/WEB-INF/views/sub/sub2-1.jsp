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
    
    <link rel="stylesheet" href="/resources/css/menu.css" />
    <link rel="stylesheet" href="/resources/css/sub2-1.css" />
    <link rel="stylesheet" href="/resources/css/weather.css"><!-- 날씨 위젯 추가 -->
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="/resources/js/menu.js"></script>
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
                        <section class="contents1">
							<div class="introleft">
		                        <h2 class="great_title">가로수길 걷기</h2>
		                        <p class="subheading_title">도심을 푸르게 만드는 가로수길</p>
							</div>
							<div class="introright">
								<p class="content1 text1">
								    가로수길은 도시 내 도로변에 나무를 심어 조성한 녹지 공간으로, 환경적, 미관적 기능을 동시에
								    수행합니다.
								</p>
								<p class="content1 text2">
								    가로수길의 역사는 일제 강점기 때 처음 도입된 이후, 도시화가 본격화된 1960년대부터 본격적으로
								    확대되었습니다. 당시 정부는 급격한 도시 개발로 인한 환경 문제를 해결하고, 도시 미관을 개선하기 위해
								    가로수길 조성 정책을 적극적으로 추진했습니다. 이후 가로수는 도심 내 중요한 환경 자산으로 자리잡게
								    되었고, 도시 경관을 아름답게 하고 쾌적한 환경을 제공하는 역할을 해왔습니다.
								</p>
							</div>
						</section>
                    </li>
                </ul>
            </div>
						
			<section class="contents2">
				<div class="img"></div>
			</section>
			
			<section class="contents3">
				<div class="text">
				    <img src="/resources/images/icon1.png">
				    <h3 class="title2">환경적 기능</h3>
				    <p class="paragraph">
				        도시 내에서 공기 정화, 온도 조절, 소음 감소 
				        등의 환경적 기능을 수행하며, 보행자에게 쾌적한 
				        그늘을 제공하여 도로 이용 경험을 개선
				        하는 데 기여합니다. 
				    </p>
				</div>
				<div class="text">
				    <img src="/resources/images/icon2.png">
				    <h3 class="title2">정서적 기능</h3>
				    <p class="paragraph">
						가로수길은 도시민들에게 자연과 함께하는
						공간으로서, 휴식과 여가 활동을 장려하며 
						심리적 안정감을 제공합니다. 
				    </p>
				</div>
				<div class="text">
				    <img src="/resources/images/icon3.png">
				    <h3 class="title2">심미적 기능</h3>
				    <p class="paragraph">
				        도로변에 나무를 일정 간격으로 심어 도심 내 
				        자연 경관을 형성합니다.
				    </p>
				</div>
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