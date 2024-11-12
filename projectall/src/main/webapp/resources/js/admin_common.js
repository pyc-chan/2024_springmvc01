function getAdminGo() {
	location.href = "/admin_go";
}

// 공지사항 리스트
function notice_list() {
	location.href = "/admin/noticelist";
}

// 공지사항 글쓰기
function notice_write() {
	location.href = "/admin/noticeinsert";
}

function notice_write_ok(f) {
	alert("공지사항 글쓰기");
	f.action = "/admin/noticeinsertok";
	f.submit();
}


// 공지사항 상세보기
function notice_detail(idxn_idx, cPage) {
	// alert("idxn_idx : " + idxn_idx);
	// alert("cPage : " + cPage);
	location.href = "/notice_detail?idxn_idx=" + idxn_idx + "&cPage=" + cPage;
}

function notice_down(f_name) {
	location.href = "/notice_down?f_name=" + f_name;
}

function comment_delete(f) {
	f.action = "/comment_delete";
	f.submit();
}

// 공지사항 수정하기
function move_notice_update(f) {
	f.action = "/notice_update";
	f.submit();
}

function notice_update_ok(f) {
	f.action = "/notice_update_ok";
	f.submit();
}

// 공지사항 삭제하기
function notice_delete(f) {
	f.action = "/notice_delete";
	f.submit();
}

function notice_delete_ok(f) {
	f.action = "/notice_delete_ok";
	f.submit();
}

// 1:1 문의 리스트
function qna_list() {
	location.href = "/admin/qnalist";
}

// 신고 및 불편사항
function inquery_list() {
	location.href = "/admin/inquerylist";
}

// 자주하는 질문 리스트
function fna_list() {
	location.href = "/admin/fnalist";
}

// 녹지 행사 관리
function event_list() {
	location.href = "/admin/eventlist";
}

// 게시판 댓글 관리
function comment_list() {
	location.href = "/admin/commentlist";
}

// 리뷰 관리
function review_list() {
	location.href = "/admin/reviewlist";
}

// 팝업 관리
function popup_list() {
	location.href = "/admin/popuplist";
}
