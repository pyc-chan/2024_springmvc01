<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="../css/sub5-4.css">
    <title>Document</title>


</head>

<body>
    <div class="header"></div>


    <div class="body">
        <ul class="contents_box">
            <li class="textcenter"> <!-- textLeft : 제목 왼쪽 정렬 | textCenter : 제목 가운데 정렬 -->
                  <h2 class="great_title">지역별 보호수 찾기</h2>
                  <p class="subheading_title">우리 생활속 보호수의 위치를 찾아보세요</p>
            </li>
        </ul>
        <div class="search-bar">
            <p>전체 19건</p>
            <div class="search-text">
                <input type="text" name="" value="" placeholder="검색어를 입력해주세요">
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </div>p
        </div>

        <div class="container">
            <div class="faq active">
                <div class="faq_question">
                    <div class="subtitle"><span>공원</span></div>
                    <div class="subject"><p class="question">도심 공원의 이용시간은 어떻게 되나요?</p>
                    <p class="day">2024.10.01</p></div>
                </div>

                <div class="faq_answer">
                    <p>일반 도심공원은 24시간 개방, 시설형 도심공원은 오전 6시부터 밤 10시까지 운영됩니다.</p>
                    <p class="day">2024.10.01</p>
                </div>
                <button class="faq_btn"></button>
            </div>

            <div class="faq">
                <div class="faq_question">
                    <div class="subtitle"><span>공원</span></div>
                    <div class="subject"><p class="question">공원 부대시설의 불편사항은 어디에 신고하나요?</p>
                    <p class="day">2024.09.26</p></div>
                </div>

                <div class="faq_answer">
                    <p>일반 도심공원은 24시간 개방, 시설형 도심공원은 오전 6시부터 밤 10시까지 운영됩니다.</p>
                    <p class="day">2024.10.01</p>
                </div>
                <button class="faq_btn"></button>
            </div>

            <div class="faq">
                <div class="faq_question">
                    <div class="subtitle"><span>공원</span></div>
                    <div class="subject"><p class="question">가로수길의 위생관련 신고는 어디에 하나요?</p>
                    <p class="day">2024.08.03</p></div>
                </div>

                <div class="faq_answer">
                    <p>일반 도심공원은 24시간 개방, 시설형 도심공원은 오전 6시부터 밤 10시까지 운영됩니다.</p>
                    <p class="day">2024.10.01</p>
                </div>
                <button class="faq_btn"></button>
            </div>

            <div class="faq">
                <div class="faq_question">
                   <div cLass="subtitle"><span>공원</span></div>
                    <div class="subject"><p class="question">가로수길에서 발견된 보행 불편물은 개인이 처리해도 되나요?</p>
                    <p class="day">2024.08.01</p></div>
                </div>

                <div class="faq_answer">
                    <p>일반 도심공원은 24시간 개방, 시설형 도심공원은 오전 6시부터 밤 10시까지 운영됩니다.</p>
                    <p class="day">2024.10.01</p>
                </div>
                <button class="faq_btn"></button>
            </div>

            <div class="faq">
                <div class="faq_question">
                    <div class="subtitle"><span>공원</span></div>
                    <div class="subject"><p class="question">보호수 신청은 어떻게 하나요?</p>
                    <p class="day">2024.07.25</p></div>
                </div>
                <div class="faq_answer">
                    <p>일반 도심공원은 24시간 개방, 시설형 도심공원은 오전 6시부터 밤 10시까지 운영됩니다.</p>
                    <p class="day">2024.10.01</p>
                </div>
                <button class="faq_btn"></button>
            </div>

        </div>

        <div class="pagination">
            <a href="#">&laquo;</a>
            <a href="#">&lt;</a>
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">4</a>
            <a href="#">5</a>
            <a href="#">&#62;</a>
            <a href="#">&raquo;</a>
        </div>

    </div>


    <div class="footer"></div>








    <script>
        const btns = document.querySelectorAll(".faq_question");
    
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
        </script>


  
</body>

</html>