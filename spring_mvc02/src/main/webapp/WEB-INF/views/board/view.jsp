<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr {
		
	    text-align:center;
	    padding:4px 10px;
	    background-color: #F6F6F6;
	}
	
th {
		width:120px;
	    text-align:center;
	    padding:4px 10px;
	    background-color: #B2CCFF;
	}
</style>
</head>
<body>
	<form method="post">
		<table width="700px">
			<tbody>
				<tr>
					<th bgcolor="#B2EBF4">작성자</th>
					<td>${bovo.writer}</td>
				</tr>
				
				<tr>
					<th bgcolor="#B2EBF4">제목</th>
					<td>${bovo.title}</td>
				</tr>
				<tr>
					<th bgcolor="#B2EBF4">날짜</th>
					<td>${bovo.regdate}</td>
				</tr>
				<tr>
					<th bgcolor="#B2EBF4">내용</th>
					<td><pre>${bovo.content}</pre></td>
				</tr>
				<tr>
					<th bgcolor="#B2EBF4">첨부파일</th>
					<c:choose>
						<c:when test="${empty bovo.f_name}">
							<td><b>첨부파일없음</b></td>
						</c:when>
						<c:otherwise>
							<td><a href="/board_down?f_name=${bovo.f_name }">
								<img src="/resources/upload/${bovo.f_name}" style="width: 80px"></a><br>${bovo.f_name}
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</tbody>
			<tfoot>
				<tr>
			     <td colspan="2">
			     	<input type="hidden" name="idx" value="${bovo.idx }" >
			     	<input type="hidden" name="cPage" value="${cPage}" >
			        <input type="button" value="목록" onclick="board_list(this.form)" />
			        <input type="button" value="답글" onclick="ans_write(this.form)" />
			        <input type="button" value="수정" onclick="board_update(this.form)" />
			        <input type="button" value="삭제" onclick="board_delete(this.form)" />
			     </td>
				</tr>
			</tfoot>
		</table>
	</form>
	
	<script type="text/javascript">
		function board_list(f){
			f.action = "/board_list";
			f.submit();
		}
		function ans_write(f){
			f.action = "/ans_write";
			f.submit();
		}
		function board_update(f){
			f.action = "/board_update";
			f.submit();
		}
		function board_delete(f){
			f.action = "/board_delete";
			f.submit();
		}
	</script>
	
</body>
</html>




