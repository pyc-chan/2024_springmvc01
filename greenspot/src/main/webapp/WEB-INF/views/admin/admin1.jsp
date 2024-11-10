<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="resources/css/admin1.css">
  <title>관리자 페이지</title>
</head>

<body>

  <div class="container">

  <!-- 사이드 바 -->
   <jsp:include page="adminsidebar.jsp" />


    <!-- 메인 컨텐트 -->
    <div class="main-content">
      <div class="usertable">
        <p>회원관리</p>
        <a href="#">더보기</a>
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

        </table>
      </div>
      <div class="inquirytable">
        <p>1:1 문의</p>
        <a href="#">더보기</a>
        <table>
          <tr>
            <th class="chk"><input type="checkbox"></th>
            <th class="id">아이디</th>
            <th class="name">이름</th>
            <th class="email">이메일</th>
            <th class="grade">등급</th>
            <th class="first">최초 가입일</th>
            <th class="last">최종 접속일</th>
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

        </table>
      </div>

      <div class="servicetable">
        <p>공지사항</p>
        <a href="#">더보기</a>
        <table>
          <tr>
            <th class="chk"><input type="checkbox"></th>
            <th class="id">아이디</th>
            <th class="name">이름</th>
            <th class="title">제목</th>
            <th class="first">최초 가입일</th>
            <th class="last">최종 접속일</th>
            <th class="reply">답변하기</th>
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

        </table>
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
    btn.addEventListener("click", () =>{
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