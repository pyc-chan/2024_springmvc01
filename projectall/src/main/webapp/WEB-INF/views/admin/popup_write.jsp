<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>관리자 페이지</title>
	<link rel="icon" type="image/x-icon" href="resources/images/favicon.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined" rel="stylesheet" />
	
	<link rel="stylesheet" href="/resources/css/common.css">
	<link rel="stylesheet" href="/resources/css/admin1-3.css">
    
	<link rel="stylesheet" href="/resources/css/summernote-lite.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
	
	
</head>

<body>
	<div class="container">
        <jsp:include page="../common/admin_menu3.jsp"></jsp:include>
        
		<div class="popuplayer">
			<p class="write_title">팝업관리 글쓰기</p>
			
			<form method="post" encType="multipart/form-data">
				<table class="popuptable">
					<tr>
						<td>제목</td>
						<td>
				            <input type="text" name="pop_tle" class="in_title" placeholder="제목을 입력해주세요." required>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea id="content" name="pop_con" rows="20"></textarea>
						</td>
					</tr>
					<!-- 여기가 첨부파일 입니다. -->
					<tr>
						<td>팝업 이미지</td>
						<td>
                        	<div class="filebox">
							    <input class="upload-name" value="파일찾기를 클릭해서 첨부파일을 등록해주세요." placeholder="파일찾기를 클릭해서 첨부파일을 등록해주세요." readonly>
							    <label for="file">파일찾기</label> 
							    <input type="file" id="file" name="file_name">
							</div>
						</td>
					</tr>
					<!-- 여기가 첨부파일 입니다. -->
					<tr>
						<td>생성일</td>
						<td>
				            <input type="date" name="pop_rdat" class="in_title" required>
						</td>
					</tr>
					<tr>
						<td>삭제일</td>
						<td>
				            <input type="date" name="pop_odat" class="in_title" required>
						</td>
					</tr>
					<tr>
						<td>링크</td>
						<td>
				            <input type="text" name="pop_link" class="in_title" placeholder="ex) test@test.com" required>
						</td>
					</tr>
					<tr>
						<td>활성화 여부</td>
						<td>
							<label>
				            	<input type="radio" name="pop_act" class="in_title" value="활성"> 활성
							</label>
							<label>
				            	<input type="radio" name="pop_act" class="in_title" value="비활성" checked> 비활성
							</label>
						</td>
					</tr>
				</table>
				<div class="btns">
                	<input type="hidden" name="cPage" value="${cPage}" /> 
                	<input type="hidden" name="a_idx" value="admin" /> 
					<button onclick="popup_write_ok(this.form)">저장</button>
					<button onclick="popup_list()">목록</button>
				</div>
			</form>
		</div>
	</div>
	<!-- container div -->
	<jsp:include page="../common/admin_footer.jsp"></jsp:include>  
	
	<script src="/resources/js/admin_common.js"></script>
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
					
					console.log(path);
					console.log(fname);
					
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