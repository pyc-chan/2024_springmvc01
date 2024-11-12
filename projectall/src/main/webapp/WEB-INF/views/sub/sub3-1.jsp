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
    <link rel="stylesheet" href="resources/css/sub2-1.css" />
    <link rel="stylesheet" href="resources/css/sub3-1.css" />
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
                        <section class="contents1">
							<div class="introleft">
		                        <h2 class="great_title">보호수란?</h2>
		                        <p class="subheading_title">생태계의 기록자, 보호수</p>
							</div>
							<div class="introright">
								<p class="content1 text1">
			                        대한민국의 보호수는 생물학적, 역사적, 문화적 가치를 지닌 나무로, 법적으로 보호받는 대상입니다. <br>
			                        보호수 제도는 1960년대 이후 정부가 생태계 보전과 역사적 자산의 보호를 위해 도입한 것으로, <br>
			                        오랜 세월 동안 환경 변화에 적응하며 자라온 나무들을 대상으로 합니다. <br>
			                        이 나무들은 단순한 자연물의 범주를 넘어, 지역 사회와의 깊은 연관성을 가지며 <br>
			                        문화유산으로서의 의미를 지니고 있습니다. 보호수는 주로 수령이 오래되거나 특정 역사적 <br>
			                        사건과 연관된 나무들로 지정됩니다.
								</p>
							</div>
						</section>
                    </li>
                </ul>
            </div>
						
			<section class="contents2">
				<div class="img"></div>
			</section>
			
			

            <div class="tablecontainer">
                <p>보호수의 유형 구분 및 정의</p>

                <div class="table_guide">
                    <div class="guide">
                        좌우로 드래그 해주세요.
                    </div>
                </div>

                <div class="table">
                    <table class="table1">
                        <colgroup>
                            <col width="">
                            <col width="">
                            <col width="">
                        </colgroup>
                        <tr>
                            <th class="tablehead1">구분</td>
                            <th class="tablehead2">유형</td>
                            <th class="tablehead3">정의</td>
                        </tr>
                        <tr>
                            <td rowspan="3">일반</td>
                            <td>노목(老木)</td>
                            <td>생장 활동이 활발하지 못한 늙은 나무</td>
                        </tr>
                        <tr>
                            <td>거목(巨木)</td>
                            <td>굵고 큰 나무</td>
                        </tr>
                        <tr>
                            <td>희귀목(稀貴木)</td>
                            <td>매우 드물고 귀한 나무</td>
                        </tr>
                        <tr>
                            <td rowspan="7">세부</td>
                            <td>명목(名木)</td>
                            <td>어떤 역사적인 고사나 전설 등의 유래가 있어 이름난 나무이거나 성현, 왕족, 위인들이 심은 것으로알려진 훌륭한 나무</td>
                        </tr>
                        <tr>
                            <td>보목(寶木)</td>
                            <td>역사적인 고사나 전설이 있는 보배로운 나무</td>
                        </tr>
                        <tr>
                            <td>당산목(堂山木)</td>
                            <td class="explain">제를 지내는 성황당, 산신당, 산수당에 있는 나무</td>
                        </tr>
                        <tr>
                            <td>정자목(亭子木)</td>
                            <td class="explain">향교, 서당, 서원, 사정, 별장, 정자 등에 심은 나무</td>
                        </tr>
                        <tr>
                            <td>호안목(護岸木)</td>
                            <td class="explain">해안, 강안, 제방을 보호할 목족으로 심은 나무</td>
                        </tr>
                        <tr>
                            <td>기형목(畸型木)</td>
                            <td class="explain">나무의 모양이 정상이 아닌 기괴한 형상의 관상가치가 있는 나무</td>
                        </tr>
                        <tr>
                            <td>풍치목(風致木)</td>
                            <td class="explain">풍치, 방풍, 방호의 효과 및 명승고적의 정취 또는 경관유지에 필요한 나무</td>
                        </tr>
                    </table>
                </div>

                <p class="title">수종별 지정현황 (2022년 말 기준)</p>

                <div class="table_guide">
                    <div class="guide">
                        좌우로 드래그 해주세요.
                    </div>
                </div>
                
                <div class="table">
                    <table class="table2">
                        <tr class="tablehead4">
                            <td>구분</td>
                            <td>합계</td>
                            <td>느티나무</td>
                            <td>소나무</td>
                            <td>팽나무</td>
                            <td>은행나무</td>
                            <td>버드나무</td>
                            <td>회화나무</td>
                            <td>향나무</td>
                            <td>기타</td>
                        </tr>
                        <tr>
                            <td>합계</td>
                            <td>13,868</td>
                            <td>7,249</td>
                            <td>1,756</td>
                            <td>1,338</td>
                            <td>768</td>
                            <td>574</td>
                            <td>363</td>
                            <td>235</td>
                            <td>1,576</td>
                        </tr>
                        <tr>
                            <td>산림청</td>
                            <td>22</td>
                            <td>-</td>
                            <td>13</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>1</td>
                            <td>8</td>
                        </tr>

                        <tr>
                            <td>산림청</td>
                            <td>22</td>
                            <td>-</td>
                            <td>13</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td>1</td>
                            <td>8</td>
                        </tr>

                        <tr>
                            <td>시도</td>
                            <td>13,846</td>
                            <td>7,249</td>
                            <td>1,752</td>
                            <td>1,318</td>
                            <td>768</td>
                            <td>574</td>
                            <td>363</td>
                            <td>234</td>
                            <td>1,568</td>
                        </tr>
                    </table>
                </div>
                <span>[단위:그루]</span>

            </div>
        	
        	
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