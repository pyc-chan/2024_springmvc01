<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- css 초기화 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
    <!-- css 불러오기 -->
    <link rel="stylesheet" href="resources/css/admin1-2.css">
    <!-- fontawsome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Material icon -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
 

    <div class="container">

        <!-- 사이드 바 -->
        <div class="side-bar">
          <div class="icon-bar"></div>
          <div class="search-menu">
              <div class="profile">
                  <img src="" alt="">
                  <p>계정 이름</p>
              </div>
              <div class="controller">
                  <div class="menu active">
                      <div class="topmenu">
                          <i class="fa-solid fa-user"></i>
                          <p>회원관리</p>
                      </div>
                      <div>
                          <div class="submenu">
                              <a href="">회원 목록 조회</a>
                          </div>
                          <div class="submenu">
                              <a href="">회원 관리</a>
                          </div>
                          <div class="submenu">
                              <a href="">회원 휴몇 및 삭제 관리</a>
                          </div>
                      </div>
                      <button class="menubtn">
                          <i class="fa-solid fa-chevron-up icon open"></i>
                          <i class="fa-solid fa-chevron-down icon close"></i>
                      </button>
                  </div>
                  <div class="menu">
                      <div class="topmenu">
                          <i class="fa-solid fa-comment"></i>
                          <p>고객센터</p>
                      </div>
                      <div>
                          <div class="submenu">회원 목록 조회</div>
                          <div class="submenu">회원 관리</div>
                          <div class="submenu">회원 휴몇 및 삭제 관리</div>
                          <button class="menubtn">
                              <i class="fa-solid fa-chevron-up icon open"></i>
                              <i class="fa-solid fa-chevron-down icon close"></i>
                          </button>
                      </div>
                  </div>
                  <div class="menu">
                      <div class="topmenu">
                          <i class="fa-solid fa-clipboard-list"></i>
                          <p>게시판 관리</p>
                      </div>
                      <div>
                          <div class="submenu">회원 목록 조회</div>
                          <div class="submenu">회원 관리</div>
                          <div class="submenu">회원 휴몇 및 삭제 관리</div>
                          <button class="menubtn">
                              <i class="fa-solid fa-chevron-up icon open"></i>
                              <i class="fa-solid fa-chevron-down icon close"></i>
                          </button>
                      </div>
                  </div>
              </div>
              <div class="logout">
                  <i class="fa-solid fa-arrow-right"></i>
                  <a href="">로그아웃</a>
              </div>
          </div>
      </div>
      
      
      
          <!-- 메인 컨텐트 -->
          <div class="main-content">
            <div class="usertable">
              <p>회원목록</p>
              <div class="search-bar">
                <i class="fa fa-search search-icon"></i>
                <input type="text" placeholder="Search">
            </div>
              <table>
                <tr>
                  <th><input type="checkbox"></th>
                  <th>아이디</th>
                  <th>이름</th>
                  <th>이메일</th>
                  <th>등급</th>
                  <th>최초 가입일</th>
                  <th>최종 접속일</th>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
                  <td><input type="checkbox"></td>
                  <td>hong</td>
                  <td>홍길동</td>
                  <td>admin@naver.com</td>
                  <td>1</td>
                  <td>2024.00.00</td>
                  <td>2024.00.00</td>
                </tr>
                <tr>
               
      
              </table>
            </div>
           
      
            </div>
          </div>
      
      
          <!-- 차트 -->
          <div class="chart">
            <div class="linegraph"></div>
            <div class="circlegraph"></div>
      
      
          </div>
      
        </div>
      



  <script>
    const btns = document.querySelectorAll(".topmenu");

    function removeActiveClasses() {
      btns.forEach((btn) => {
        btn.parentElement.classList.remove("active");
      });
    }



    btns.forEach((btn) => {
      btn.addEventListener("click", () => {
        const menuitem = btn.parentNode;
        const isActive = menuitem.classList.contains("active");

        removeActiveClasses();

        if (!isActive) {
          menuitem.classList.add("active");
        }

      })
    });
  </script>

</body>

</html>
