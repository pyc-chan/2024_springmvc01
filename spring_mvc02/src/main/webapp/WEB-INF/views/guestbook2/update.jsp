<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 명 록</title>
<style type="text/css">
a {
	text-decoration: none;
}

table {
	width: 600px;
	border-collapse: collapse;
	text-align: center;
}

table, th, td {
	border: 1px solid black;
	padding: 3px
}

div {
	width: 600px;
	margin: auto;
	text-align: center;
}
</style>

</head>
<body>
	<div>
		<h2>방명록 : 수정화면</h2>
		<hr>
		<form action="${pageContext.request.contextPath }/GuestBook2Controller"
			method="post">
			<input type="submit" value="[목록으로 이동]"> <input type="hidden"
				name="cmd" value="g_list">
		</form>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td><input type="text" name="gb2_name" size="20"
						value="${gvo.gb2_name}"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제 목</td>
					<td><input type="text" name="gb2_subject" size="20"
						value="${gvo.gb2_subject}"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td><input type="text" name="gb2_email" size="20"
						value="${gvo.gb2_email}"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">첨부파일</td>
					<c:choose>
						<c:when test="${empty gvo.gb2_f_name }">
							<td>
								<input type="file" name="gb2_f_name"><b>이전파일 없음</b>
								<input type="hidden" name="old_f_name" value="">
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<input type="file" name="gb2_f_name"><b>이전파일 (${gvo.gb2_f_name })</b>
								<input type="hidden" name="old_f_name" value="${gvo.gb2_f_name }">
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="gb2_pwd" size="20"></td>
				</tr>
				<tr align="center">
					<td colspan="2"><textarea rows="7" cols="60" name="gb2_content">${gvo.gb2_content}</textarea>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
						<input type="hidden" name="gb2_idx" value="${gvo.gb2_idx }">
						<input type="hidden" name="cmd" value="g_update_ok">
						<input type="button" value="수정" onclick="update_go(this.form)"> 
						<input type="reset" value="취소">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
	function update_go(f){
		const pwd = "${gvo.gb2_pw}";
		const pwd2 = f.gb2_pw.value ;
	   	if(pwd == pwd2){
		   const conf = confirm("정말 삭제할까요?");
			if(conf){
		   		f.action="${pageContext.request.contextPath}/GuestBook2Controller";
		   		f.submit();
			}
	   } else{
		   f.gb2_pw.value="";
		   f.gb2_pw.focus();
		   return;
	   }
	}

</script>
	
</body>
</html>