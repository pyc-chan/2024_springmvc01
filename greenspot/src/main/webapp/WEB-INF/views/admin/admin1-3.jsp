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
  <link rel="stylesheet" href="resources/css/admin1-3.css">
  <title>관리자 페이지</title>
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
        <!-- 메인컨텐츠 -->
        <div class="popuplayer">
            <p style="font-size : 26px; border-bottom: 2px solid #000; font-weight: 500;">팝업레이어</p>
            <p style="background-color: #eee !important;">초기화면 접속 시 자동으로 뜰 팝업레이어를 설정합니다.</p>
            <table class="popuptable">
                <tr>
                    <td>구분</td>
                    <td>커뮤니티에 표시될 것인지, 오느 곳에 표시할 것인지를 설정합니다.
                        <select name="category" class="pop_sel">
                        	<option value=""></option>
                        	<option value=""></option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>시간 일시</td>
                    <td><input type="text">
                        </td>
                </tr>
                <tr>
                    <td>종료 일시</td>
                    <td><input type="text">
                        <input type="checkbox">
                        <span>종료일시를 오늘로부터 7일 후로</span></td>
                </tr>
                <tr>
                    <td>팝업레이어 좌측 위치</td>
                    <td><input type="text" name="" placeholder="10px"></td>
                </tr>
                <tr>
                    <td>팝업 레이어 넓이</td>
                    <td><input type="text" name="" placeholder="10px"></td>
                </tr>
                <tr>
                    <td>팝업 레이어 높이</td>
                    <td><input type="text" name="" placeholder="10px"></td>
                </tr>
                <tr>
                    <td>팝업 레이어 제목</td>
                    <td><input type="text" name="" placeholder="제목을 입력해주세요"></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                        <textarea class="textarea" name="" id="" placeholder="내용을 입력하세요"></textarea>
                    </td>
                </tr>
            </table>
            <div class="btns">
                <button type="submit">저장</button>
                <button type="reset">취소</button>
            </div>
        </div>
        <!-- container div -->
    </div>
    <script>
        const btns = document.querySelectorAll(".topmenu, .menubtn");
        function removeActiveClasses() {
            btns.forEach((btn) => {
                btn
                    .parentElement
                    .classList
                    .remove("active");
            });
        }
        btns.forEach((btn) => {
            btn.addEventListener("click", () => {
                const menuitem = btn.parentNode;
                const isActive = menuitem
                    .classList
                    .contains("active");
                removeActiveClasses();
                if (!isActive) {
                    menuitem
                        .classList
                        .add("active");
                }
            })
        });
    </script>
</body>
</html>
