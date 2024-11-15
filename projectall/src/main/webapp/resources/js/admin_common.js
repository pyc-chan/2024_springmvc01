// 메인
function move_main() {
	location.href = "/mainGo";
}

// 관리자 메인
function getAdminGo() {
	location.href = "/admin_go";
}

// 공지사항 리스트
function notice_list() {
	location.href = "/admin/noticelist";
}

function notice_detail() {
	location.href = "/admin/noticedetail";
}

// 공지사항 글쓰기
function notice_write() {
	location.href = "/admin/noticeinsert";
}

function notice_write_ok(f) {
	f.action = "/admin/noticeinsertok";
	f.submit();
}


function notice_down(f_name) {
	location.href = "/notice_down?f_name=" + f_name;
}

// 공지사항 수정하기
function notice_update(f) {
	f.action = "/admin/noticeupdate";
	f.submit();
}

function notice_update_ok(f) {
	f.action = "/admin/noticeupdateok";
	f.submit();
}

// 공지사항 삭제하기
function notice_delete(f) {
	f.action = "/admin/noticedelete";
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

function qna_detail() {
	location.href = "/admin/qnadetail";
}

// 1:1 문의 글쓰기
function qna_write() {
	location.href = "/admin/qnainsert";
}

function qna_write_ok(f) {
	f.action = "/admin/qnainsertok";
	f.submit();
}


function qna_down(f_name) {
	location.href = "/qna_down?f_name=" + f_name;
}

// 1:1 문의 수정하기
function qna_update(f) {
	f.action = "/admin/qnaupdate";
	f.submit();
}

function qna_update_ok(f) {
	f.action = "/admin/qnaupdateok";
	f.submit();
}

// 1:1 문의 삭제하기
function qna_delete(f) {
	f.action = "/admin/qnadelete";
	f.submit();
}

function qna_delete_ok(f) {
	f.action = "/qna_delete_ok";
	f.submit();
}

// 고객의 소리
function inquery_list() {
	location.href = "/inquery/list";
}

function inquery_detail() {
	location.href = "/inquery/detail";
}

// 고객의 소리 글쓰기
function inquery_write() {
	location.href = "/inquery/insert";
}

function inquery_write_ok(f) {
	f.action = "/inquery/insertok";
	f.submit();
}


function inquery_down(f_name) {
	location.href = "/inquery_down?f_name=" + f_name;
}

// 고객의 소리 수정하기
function inquery_update(f) {
	f.action = "/inquery/update";
	f.submit();
}

function inquery_update_ok(f) {
	f.action = "/inquery/updateok";
	f.submit();
}

// 고객의 소리 삭제하기
function inquery_delete(f) {
	f.action = "/inquery/delete";
	f.submit();
}

function inquery_delete_ok(f) {
	f.action = "/inquery/deleteok";
	f.submit();
}

// 자주하는 질문 리스트
function fna_list() {
	location.href = "/admin/fnalist";
}

function admin_inquery_list(f) {
	f.action = "/admin/inquerylist";
	f.submit();
}

function admin_inquery_delete(f){
	f.action = "/admin/inquerydelete";
	f.submit();
}

function fna_detail() {
	location.href = "/admin/fnadetail";
}

// 자주하는 질문 글쓰기
function fna_write() {
	location.href = "/admin/fnainsert";
}

function fna_write_ok(f) {
	f.action = "/admin/fnainsertok";
	f.submit();
}


function fna_down(f_name) {
	location.href = "/admin/fna_down?f_name=" + f_name;
}

// 자주하는 질문 수정하기
function fna_update(f) {
	f.action = "/admin/fnaupdate";
	f.submit();
}

function fna_update_ok(f) {
	f.action = "/admin/fnaupdateok";
	f.submit();
}

// 회원관리 리스트
function user_list() {
	location.href = "/admin/userlist";
}

function user_detail() {
	location.href = "/admin/userdetail";
}

// 회원관리 글쓰기
function user_write() {
	location.href = "/admin/userinsert";
}

function user_write_ok(f) {
	f.action = "/admin/userinsertok";
	f.submit();
}


function user_down(f_name) {
	location.href = "/admin/user_down?f_name=" + f_name;
}

// 회원관리 수정하기
function user_update(f) {
	f.action = "/admin/userupdate";
	f.submit();
}

function user_update_ok(f) {
	f.action = "/admin/userupdateok";
	f.submit();
}


// 회원관리 삭제하기
function user_delete(f) {
	f.action = "/admin/userdelete";
	f.submit();
}

function user_delete_ok(f) {
	f.action = "/admin/userdeleteok";
	f.submit();
}

// 관리자 리스트
function admin_list() {
	location.href = "/admin/adminlist";
}

function admin_detail() {
	location.href = "/admin/admindetail";
}

// 관리자 글쓰기
function admin_write() {
	location.href = "/admin/admininsert";
}

function admin_write_ok(f) {
	f.action = "/admin/admininsertok";
	f.submit();
}


function admin_down(f_name) {
	location.href = "/admin/admin_down?f_name=" + f_name;
}

// 관리자 수정하기
function admin_update(f) {
	f.action = "/admin/adminupdate";
	f.submit();
}

function admin_update_ok(f) {
	f.action = "/admin/admindetail";
	f.submit();
}


// 관리자 삭제하기
function admin_delete(f) {
	f.action = "/admin/admindelete";
	f.submit();
}

function admin_delete_ok(f) {
	f.action = "/admin/admindeleteok";
	f.submit();
}



// 녹지 행사 관리
function event_list() {
	location.href = "/ev/list";
}

function event_detail() {
	location.href = "/ev/detail";
}

// 녹지 행사 관리 글쓰기
function event_write() {
	location.href = "/ev/insert";
}

function event_write_ok(f) {
	f.action = "/ev/insertok";
	f.submit();
}


function event_down(f_name) {
	location.href = "/ev/event_down?f_name=" + f_name;
}

// 녹지 행사 관리 수정하기
function event_update(f) {
	f.action = "/ev/update";
	f.submit();
}

function event_update_ok(f) {
	f.action = "/ev/updateok";
	f.submit();
}

// 녹지 행사 관리 삭제하기
function event_delete(f) {
	f.action = "/ev/delete";
	f.submit();
}

function event_delete_ok(f) {
	f.action = "/ev/deleteok";
	f.submit();
}



// 게시판 댓글 관리
function comment_list() {
	location.href = "/comment/list";
}

function comment_delete() {
	location.href = "/comment/delete";
}

// 리뷰 관리
function review_list() {
	location.href = "/admin/reviewlist";
}

function review_detail() {
	location.href = "/admin/reviewdetail";
}

// 리뷰 관리 글쓰기
function review_write() {
	location.href = "/admin/reviewinsert";
}

function review_write_ok(f) {
	f.action = "/admin/reviewinsertok";
	f.submit();
}


function review_down(f_name) {
	location.href = "/admin/review_down?f_name=" + f_name;
}

// 리뷰 관리 수정하기
function review_update(f) {
	f.action = "/admin/reviewupdate";
	f.submit();
}

function review_update_ok(f) {
	f.action = "/admin/reviewupdateok";
	f.submit();
}

// 리뷰 관리 삭제하기
function review_delete(f) {
	f.action = "/admin/reviewdelete";
	f.submit();
}

function review_delete_ok(f) {
	f.action = "/admin/reviewdeleteok";
	f.submit();
}



// 팝업 관리
function popup_list() {
	location.href = "/pop/list";
}

function popup_detail() {
	location.href = "/pop/detail";
}

// 팝업 관리 글쓰기
function popup_write() {
	location.href = "/pop/insert";
}

function popup_write_ok(f) {
	f.action = "/pop/insertok";
	f.submit();
}


function popup_down(f_name) {
	location.href = "/popup_down?f_name=" + f_name;
}

// 팝업 관리 수정하기
function popup_update(f) {
	f.action = "/pop/update";
	f.submit();
}

function popup_update_ok(f) {
	f.action = "/pop/updateok";
	f.submit();
}

// 팝업 관리 삭제하기
function popup_delete(f) {
	f.action = "/pop/delete";
	f.submit();
}

function popup_delete_ok(f) {
	f.action = "/pop/deleteok";
	f.submit();
}
