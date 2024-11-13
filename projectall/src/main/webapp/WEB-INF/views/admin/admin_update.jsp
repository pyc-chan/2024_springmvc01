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
        <jsp:include page="../common/admin_menu2.jsp"></jsp:include>
        
        
		<div class="popuplayer">
			<p class="write_title">관리자 계정 수정</p>

			<form method="post" encType="multipart/form-data">
				<table class="popuptable">
					<tr>
						<td>이름</td>
						<td>
							<input type="text" name="a_na" value="${avo.a_na}">
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
							<input type="text" name="a_pho" value="${avo.a_pho}">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" name="a_em" value="${avo.a_em}">
						</td>
					</tr>
					<tr>
						<td>활동여부</td>
						<td>
							<input type="text" name="a_stat" value="${avo.a_stat}">
						</td>
					</tr>
				</table>
				<div class="btns">
					<input type="hidden" name="a_idx" value="${avo.a_idx }">
					<button onclick="admin_update_ok(this.form)">수정완료</button>
					<button onclick="admin_list()">목록</button>
				</div>
			</form>
		</div>
		<!-- container div -->
	</div>
	<!-- container div -->
	<jsp:include page="../common/admin_footer.jsp"></jsp:include>
    
	
	<script src="/resources/js/common.js"></script>
	<script src="/resources/js/summernote-lite.js" ></script>
	<script src="/resources/js/lang/summernote-ko-KR.js" ></script>
	
	<script type="text/javascript">
	function admin_list(){
		document.location.href("/");
	}
	
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
					const adminme = data.adminme;
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