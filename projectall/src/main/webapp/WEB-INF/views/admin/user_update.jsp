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
			<p class="write_title">회원관리 수정</p>

			<form method="post" encType="multipart/form-data">
				<table class="popuptable">
					
					<tr>
						<td>아이디</td>
						<td>
				            <input type="text" name="u_id" value="${nvo.u_id}" class="in_title" required>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
				            <input type="text" name="u_pw" value="${nvo.u_pw}" class="in_title" required>
						</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>
				            <input type="text" name="u_na" value="${nvo.u_na}" class="in_title" required>
						</td>
					</tr>
					<tr>
						<td>프로필 이미지</td>
						<td>
							<!-- 여기가 첨부파일 입니다. -->
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
							<!-- 여기가 첨부파일 입니다. -->
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>
				            <input type="text" name="u_pho" value="${nvo.u_pho}" class="in_title" required>
						</td>
					</tr>
					<tr>
						<td>성별</td>
						<td>
							<select name="u_gen" id="gen">
								<option value="male">남성</option>
								<option value="female">여성</option>
							</select>
							<div class="choose_category"><span>현재 카테고리 :</span> ${nvo.u_gen}</div>
						</td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td>
							<input type="date" name="u_bir" value="${nvo.u_bir}">
						</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" name="u_em" value="${nvo.u_em}">
						</td>
					</tr>
					<tr>
						<td>생성일자</td>
						<td>
							<input type="date" name="u_reg" value="${nvo.u_reg}">
						</td>
					</tr>
					<tr>
						<td>탈퇴일자</td>
						<td>
							<input type="date" name="u_out" value="${nvo.u_out}">
						</td>
					</tr>
					<tr>
						<td>탈퇴담당자</td>
						<td>
							<!-- 
								수정한 사람 정보가 자동으로 나오게 해주세요. 
								탈퇴 담당자는 누가 수정을 할 수가 없습니다.
							-->
							<input type="text" name="a_idx" value="${nvo.a_idx}" readonly>
						</td>
					</tr>
					<tr>
						<td>탈퇴사유</td>
						<td>
							<textarea name="n_con" class="textarea" rows="20" placeholder="탈퇴사유를 적어주세요"></textarea>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea id="content" name="u_etc" rows="20"></textarea>
						</td>
					</tr>
				</table>
				<div class="btns">
					<input type="hidden" name="admin_idx" value="${fvo.admin_idx }">
					<button onclick="user_update_ok(this.form)">수정완료</button>
					<button onclick="user_list()">목록</button>
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