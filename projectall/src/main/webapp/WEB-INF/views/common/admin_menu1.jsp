<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 사이드 바 -->
<div class="side-bar">
	<div class="icon-bar"></div>
	<div class="search-menu">
		<div class="profile" onclick="getAdminGo()">
			<img src="/resources/images/logo_w.png" alt="logo">
		</div>

		<div class="controller">
			<div class="menu active">
				<div class="topmenu">
					<i class="fa-solid fa-user"></i>
					<p>고객센터</p>
				</div>
				<div>
					<div class="submenu" onclick="notice_list()">
						공지사항 게시판
					</div>
					<div class="submenu" onclick="qna_list()">
						1:1 문의
					</div>
					<div class="submenu" onclick="inquery_list()">
						고객의 소리
					</div>
					<div class="submenu" onclick="fna_list()">
						자주하는 질문
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
					<p>회원 관리</p>
				</div>
				<div>
					<div class="submenu" onclick="user_list()">회원 관리</div>
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
					<div class="submenu" onclick="event_list()">녹지 행사 관리</div>
					<div class="submenu" onclick="comment_list()">게시판 댓글 관리</div>
					<div class="submenu" onclick="review_list()">리뷰 관리</div>
					<div class="submenu" onclick="popup_list()">팝업 관리</div>
					<button class="menubtn">
						<i class="fa-solid fa-chevron-up icon open"></i> 
						<i class="fa-solid fa-chevron-down icon close"></i>
					</button>
				</div>
			</div>
		</div>
		<div class="menu_btn_cont">
			<ul>
				<li class="admin_account" onclick="admin_list()">
					<i class="fa-solid fa-gear"></i> 관리자 계정
				</li>
				<li class="logout">
					<i class="fa-solid fa-arrow-right"></i> 로그아웃
				</li>
			</ul>
		</div>
	</div>
</div>