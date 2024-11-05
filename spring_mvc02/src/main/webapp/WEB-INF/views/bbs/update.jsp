<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
</style>

<script type="text/javascript">
  <c:if test="${pwdchk == 'fail'}">
 	 alert("비밀번호 틀림");
 	 return ;
  </c:if>
</script>

</head>
<body>
	<div id="bbs">
	<form method="post" encType="multipart/form-data" action="/bbs_update_ok">
		<table summary="게시판 수정">
			<caption>게시판 수정</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" name="subject" size="45" value="${bvo.subject}"></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input type="text" name="writer" size="12" value="${bvo.writer}"></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea name="content" id="content" cols="50" rows="8"> ${bvo.content} </textarea></td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<c:choose>
						<c:when test="${empty bvo.f_name}">
							<td>
								<input type="file" name="file_name"><b>이전 파일 없음</b>
								<input type="hidden" name="old_f_name" value="">
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<input type="file" name="file_name"><b><br>(${bvo.f_name})</b>
								<input type="hidden" name="old_f_name" value="${bvo.f_name}">
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" name="pwd" size="12"></td>
				</tr>
				<tr>
					<td colspan="2">
					    <input type="hidden" name="cPage" value="${cPage }">
					    <input type="hidden" name="b_idx" value="${bvo.b_idx}">
						<input type="submit" value="수정완료" >
						<input type="button" value="목록" onclick="bbs_list(this.form)">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js" ></script>
	<script src="resources/js/lang/summernote-ko-KR.js" ></script>
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
			// FormData 객체를 전송할 때 , jQuery가 설정
		  let frm = new FormData();
		  frm.append("s_file", file);
		  $.ajax({
			  url : "/saveImg",
			  data : frm,
			  method : "post",
			  contentType : false,
			  processData : false,
			  cache : false,
			  dataType : "json",
			  success : function(data) {
				 const path = data.path;
				 const fname = data.fname ;
				 console.log(path, fname);
				 $("#content").summernote("editor.insertImage", path+"/"+fname);
			  },
			  error : function() {
				alert("읽기실패");
			}
		  });
		}
	</script>
	<script type="text/javascript">
		function bbs_write_ok(f) {
			f.action = "/bbs_write_ok";
			f.submit();
		}
		function bbs_list(f) {
			f.action = "/bbs";
			f.submit();
		}
	</script>
	
</body>
</html>

