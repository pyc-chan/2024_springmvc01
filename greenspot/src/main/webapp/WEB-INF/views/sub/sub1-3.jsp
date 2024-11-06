<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    
    <link rel="stylesheet" href="resources/css/menu.css" />
    <link rel="stylesheet" href="resources/css/common.css" />
    <link rel="stylesheet" href="resources/css/sub1-3.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="resources/js/menu.js"></script>
</head>
<body>
	
	<div id="sub_main_container">
        <!-- sub_header -->
        <jsp:include page="../common/sub_header.jsp"></jsp:include>

        
        <!-- 컨텐츠 영역(main) -->
        <main>
            <div id="sub_container">
                <ul class="contents_box">
                    <li class="textcenter">
                        <h2 class="great_title">다양한 공원 찾기</h2>
                        <p class="subheading_title">특별한 공원, 특별한 경험</p>
                        
						<div class="categories">
						    <ul>
						        <li>
						            <figure class="category_icon">
						                <img src="resources/images/category_icon03.png" alt="어린이공원">
						            </figure>
						            <span class="category">어린이공원</span>
						        </li>
						        <li>
						            <figure class="category_icon">
						                <img src="resources/images/category_icon03.png" alt="수변공원">
						            </figure>
						            <span class="category">수변공원</span>
						        </li>
						        <li>
						            <figure class="category_icon">
						                <img src="resources/images/category_icon03.png" alt="근린공원">
						            </figure>
						            <span class="category">근린공원</span>
						        </li>
						        <li>
						            <figure class="category_icon">
						                <img src="resources/images/category_icon03.png" alt="체육공원">
						            </figure>
						            <span class="category">체육공원</span>
						        </li>
						        <li>
						            <figure class="category_icon">
						                <img src="resources/images/category_icon03.png" alt="문화공원">
						            </figure>
						            <span class="category">문화공원</span>
						        </li>
						    </ul>
						</div>

			            <section class="contents2">
				            <ul class="region_scroll_ul total_search_mg">
				                <li class="region_list">
				                    <ul class="scroll_list_ul">
				                        <li>
				                            <ul class="scroll_list">
				                                <li class="category">
				                                    <span>지역</span>
				                                </li>
				                                <li class="content">
				                                    <h4>제목입니다.</h4>
				                                    <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
				                                    <p class="address">
				                                        서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
				                                    </p>
				                                </li>
				                            </ul>
				                        </li><li>
				                            <ul class="scroll_list">
				                                <li class="category">
				                                    <span>지역</span>
				                                </li>
				                                <li class="content">
				                                    <h4>제목입니다.</h4>
				                                    <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
				                                    <p class="address">
				                                        서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
				                                    </p>
				                                </li>
				                            </ul>
				                        </li><li>
				                            <ul class="scroll_list">
				                                <li class="category">
				                                    <span>지역</span>
				                                </li>
				                                <li class="content">
				                                    <h4>제목입니다.</h4>
				                                    <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
				                                    <p class="address">
				                                        서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
				                                    </p>
				                                </li>
				                            </ul>
				                        </li>
				                        <li>
				                            <ul class="scroll_list">
				                                <li class="category">
				                                    <span>지역</span>
				                                </li>
				                                <li class="content">
				                                    <h4>제목입니다.</h4>
				                                    <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
				                                    <p class="address">
				                                        서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
				                                    </p>
				                                </li>
				                            </ul>
				                        </li>
				                    </ul>
				                </li>
				                <li class="region_map">
				                    <!-- * 카카오맵 - 지도퍼가기 -->
				                    <!-- 1. 지도 노드 -->
				                    <div id="daumRoughmapContainer1729926174280" class="root_daum_roughmap root_daum_roughmap_landing"></div>
				                    <!--
				                        2. 설치 스크립트
				                        * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
				                    -->
				                    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
				                    <!-- 3. 실행 스크립트 -->
				                    <script charset="UTF-8">
				                        new daum.roughmap.Lander({
				                            "timestamp" : "1729926174280",
				                            "key" : "2m2jx",
				                            "mapWidth" : "640",
				                            "mapHeight" : "360"
				                        }).render();
				                    </script>
				                </li>
				            </ul>
            			</section>
                    </li>
                </ul>
                <div>
                      <ul class="paging_num_ul">
                          <li class="material-icons prev">
                              keyboard_double_arrow_left
                          </li>
                          <li class="material-icons prev">
                              chevron_left
                          </li>
                          <li class="active">1</li>
                          <li>2</li>
                          <li>3</li>
                          <li>4</li>
                          <li>5</li>
                          <li class="material-icons next">
                              chevron_right
                          </li>
                          <li class="material-icons next">
                              keyboard_double_arrow_right
                          </li>
                      </ul>
                  </div>
            </div>
            
			
                  
                    

            
        
        	<jsp:include page="../common/sub_footer.jsp"></jsp:include>
        </main>

        <jsp:include page="../common/sub_m_menu.jsp"></jsp:include>
    </div>

    <button id="goTop">
        <span class="material-icons">arrow_upward</span>
    </button>

    
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