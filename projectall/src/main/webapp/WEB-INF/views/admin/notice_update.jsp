<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<title>관리자 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" type="image/x-icon" href="/resources/images/favicon.png">
	<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css"
		rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
		integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/common.css">
	<link rel="stylesheet" href="/resources/css/admin1-3.css">
	<link rel="stylesheet" href="/resources/css/summernote-lite.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>

<body>
	<div class="container">
        <jsp:include page="../common/admin_menu1.jsp"></jsp:include>
        
        
		<div class="popuplayer">
			<p class="write_title">공지사항 게시판 수정</p>

			<form method="post" encType="multipart/form-data">
				<table class="popuptable">
					<tr>
						<td>옵션</td>
						<td>
	                        <c:choose>
	                        	<c:when test="${gvo.n_chk == 'check'}">
		                        	<label>
		                        		<input type="checkbox" name="n_chk" value="check" checked> 공지
		                        	</label>
	                        	</c:when>
	                        	<c:otherwise>
		                        	<label>
		                        		<input type="checkbox" name="n_chk" value="check"> 공지
		                        	</label>
	                        	</c:otherwise>
	                        </c:choose>
						</td>
					</tr>
					<tr>
						<td>카테고리</td>
						<td>
                        	<select name="n_opt" class="board_select" required>
                        		<option value="공원">공원</option>
                        		<option value="가로수길">가로수길</option>
                        		<option value="보호수">보호수</option>
                        		<option value="녹지행사">녹지행사</option>
                        	</select>
                        	<div class="choose_category"><span>현재 카테고리 :</span> ${gvo.n_opt}</div>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>
				        	<input type="text" name="n_tle" class="in_title" value="${gvo.n_tle}" placeholder="제목을 입력해주세요." required>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
                        	<textarea id="content" name="n_con" rows="20" placeholder="내용을 입력해주세요.">
                        		${gvo.n_con}
                        	</textarea>
						</td>
					</tr>
					<!-- 여기가 첨부파일 입니다. -->
					<tr>
						<td>첨부파일</td>
						<td>
							<c:choose>
								<c:when test="${empty gvo.f_name}">
									<div class="filebox">
									    <input class="upload-name" value="파일찾기를 클릭해서 첨부파일을 등록해주세요." placeholder="파일찾기를 클릭해서 첨부파일을 등록해주세요.">
									    <label for="file">파일찾기</label> 
									    <input type="file" id="file" name="file_name">
									    <b>이전 파일 없음</b>
										<input type="hidden" name="old_file_name" value="">
									</div>
								</c:when>
								<c:otherwise>
									<div class="filebox">
									    <input class="upload-name" value="${gvo.f_name}" placeholder="파일찾기를 클릭해서 첨부파일을 등록해주세요.">
									    <label for="file">파일찾기</label> 
									    <input type="file" id="file" name="file_name">
									</div>
							
		                            <div class="file_lst">
		                                <label><span>다운로드 : </span> <a href="">${gvo.f_name}</a></label>
		                            </div>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<!-- 여기가 첨부파일 입니다. -->
				</table>
				<div class="btns">
					<input type="hidden" name="fna_idx" value="${fvo.fna_idx }">
					<button onclick="notice_update_ok(this.form)">수정완료</button>
					<button onclick="notice_list()">목록</button>
				</div>
			</form>
		</div>
		<!-- container div -->
	</div>
	<!-- container div -->
	<jsp:include page="../common/admin_footer.jsp"></jsp:include>
    
	<script src="/resources/js/summernote-lite.js" ></script>
	<script src="/resources/js/lang/summernote-ko-KR.js" ></script>
	
	<script type="text/javascript">
		$(function() {
			$("#content").summernote({
				lang : 'ko-KR',
				height : 300,
				focus : true,
				placeholder : "최대 3000자까지 쓸 수 있습니다.",
				callbacks : {
		        	onImageUpload : function(files, editor) {
						for (let i = 0; i < files.length; i++) {
							sendImage(files[i], editor);
						}
					}
		        }
			});
		});
		
		function sendImage(file, editor) {
			// FormData 객체를 전송할 때 , JQuery 가 설정
			let frm = new FormData();
			frm.append("s_file", file);
			$.ajax({
				url : "/saveImg",
				data: frm,
				method: "post",
			  	contentType : false,
			  	processData : false,
				cache : false,
				dataType : "json",
				success : function(data) {
					const path = data.path;
					const fname = data.fname;
					$("#content").summernote("editor.insertImage", path+"/"+fname);
				},
				error : function() {
					alert("읽기 실패");
				}
			});	
		}
	</script>
</body>
</html>