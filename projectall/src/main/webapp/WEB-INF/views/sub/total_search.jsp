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
    <link rel="stylesheet" href="resources/css/total_search.css" />
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
                    <li class="textLeft">
                        <ul class="sub_search_container">
                            <li class="sub_search">
                                <div class="sub_search_div">
                                    <form action="/total_search" method="get">
                                        <input type="text" name="search_name" value="${search_name}" placeholder="주소 혹은 지역명을 입력해주세요">
                                        <button type="submit">
                                        	<span class="material-icons">search</span>
                                        </button>
                                    </form>
                                </div>
                            </li>
                        </ul>

                        <p class="search_res_total"><span>‘${search_name}’</span> 에 대한 총 <span>100</span>건의  전체 검색결과가 있습니다.</p>

                        <ul class="total_search_res_title">
                            <li>
                                <h3>검색결과</h3>
                            </li>
                            <li>
                                <!-- <button>전체보기</button> -->
                            </li>
                        </ul>
                        <ul class="empty_list total_search_mg">
                            <li>
                                총 0건이 검색되었습니다.
                            </li>
                        </ul>

                        <ul class="total_search_res_title">
                            <li>
                                <h3>공지사항 검색결과</h3>
                            </li>
                            <li>
                                <button>전체보기</button>
                            </li>
                        </ul>
                        <ul class="category_list_ul total_search_mg">
                            <li>
                                <ul class="category_list">
                                    <li class="category">
                                        <span>지역</span>
                                    </li>
                                    <li class="content">
                                        <h4>제목입니다.</h4>
                                        <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
                                        <p class="address">
                                            서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <ul class="category_list">
                                    <li class="category">
                                        <span>지역</span>
                                    </li>
                                    <li class="content">
                                        <h4>제목입니다.</h4>
                                        <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
                                        <p class="address">
                                            서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
                                        </p>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <ul class="category_list">
                                    <li class="category">
                                        <span>지역</span>
                                    </li>
                                    <li class="content">
                                        <h4>제목입니다.</h4>
                                        <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
                                        <p class="address">
                                            서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
                                        </p>
                                    </li>
                                </ul>
                            </li>
                        </ul>

                        <ul class="total_search_res_title">
                            <li>
                                <h3>지역별 찾기(스크롤) 검색결과</h3>
                            </li>
                            <li>
                                <button>전체보기</button>
                            </li>
                        </ul>
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
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
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
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
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
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
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
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
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
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
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
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
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
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
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
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
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

                        
                        <ul class="total_search_res_title">
                            <li>
                                <h3>지역별 찾기(페이징) 검색결과</h3>
                            </li>
                            <li>
                                <button>전체보기</button>
                            </li>
                        </ul>
                        <ul class="region_paging_ul total_search_mg">
                            <li class="region_list">
                                <ul class="paging_list_ul">
                                    <li>
                                        <ul class="paging_list">
                                            <li class="category">
                                                <span>지역</span>
                                            </li>
                                            <li class="content">
                                                <h4>제목입니다.</h4>
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
                                                <p class="address">
                                                    서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
                                                </p>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <ul class="paging_list">
                                            <li class="category">
                                                <span>지역</span>
                                            </li>
                                            <li class="content">
                                                <h4>제목입니다.</h4>
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
                                                <p class="address">
                                                    서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
                                                </p>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <ul class="paging_list">
                                            <li class="category">
                                                <span>지역</span>
                                            </li>
                                            <li class="content">
                                                <h4>제목입니다.</h4>
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
                                                <p class="address">
                                                    서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
                                                </p>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <ul class="paging_list">
                                            <li class="category">
                                                <span>지역</span>
                                            </li>
                                            <li class="content">
                                                <h4>제목입니다.</h4>
                                                <p class="text">Lorem Ipsum is simply dummy text of the printing and  typesetting industry. Lorem Ipsum has been the industry's </p>
                                                <p class="address">
                                                    서울특별시 마포구 백범로 23, 3층 (신수동, 케이터틀)
                                                </p>
                                            </li>
                                        </ul>
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
                            </li>
                            <li class="region_map">
                                <!-- * 카카오맵 - 지도퍼가기 -->
                                <!-- 1. 지도 노드 -->
                                <div id="daumRoughmapContainer1729933377215" class="root_daum_roughmap root_daum_roughmap_landing"></div>

                                <!--
                                    2. 설치 스크립트
                                    * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                                -->
                                <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

                                <!-- 3. 실행 스크립트 -->
                                <script charset="UTF-8">
                                    new daum.roughmap.Lander({
                                        "timestamp" : "1729933377215",
                                        "key" : "2m2kf",
                                        "mapWidth" : "640",
                                        "mapHeight" : "360"
                                    }).render();
                                </script>
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
    </script>
</body>
</html>