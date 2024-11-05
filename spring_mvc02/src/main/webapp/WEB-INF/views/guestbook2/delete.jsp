<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 방 명 록 </title>
<style type="text/css">
	a { text-decoration: none;}
	table{width: 600px; border-collapse:collapse; text-align: center;}
	table,th,td{border: 1px solid black; padding: 3px}
	div{width: 600px; margin:auto; text-align: center;}
</style>

</head>
<body>
	<div>
		<h2>방명록 : 삭제화면</h2>
		<hr>
		<p><a href="${pageContext.request.contextPath}/GuestBook2Controller?cmd=g_list">[목록으로 이동]</a></p>
		<form method="post">
			<table>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="gb2_pw" size ="20"></td>
				</tr>
				
				
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="hidden" name="gb2_idx" value="${gb2_idx}">
							<input type="hidden" name="cmd" value="g_delete_ok">
							<input type="button" value="삭제" onclick="delete_ok(this.form)">
							<input type="reset" value="취소">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		function delete_ok(f){
			const pwd = "${gb2_pw}"; // command에서 가져온 비밀번호
			const pwd2 = f.gb2_pw.value;
			
			
			if(pwd == pwd2){
				const conf = confirm("정말 삭제할까요?");
				if(conf){
					f.action="${pageContext.request.contextPath}/GuestBook2Controller";
					f.submit();
				}else{
					// 이전화면으로 이동
					history.go(-1);
				}
			}else{
				alert("비밀번호가 틀림");
				f.gb2_pw.value="";
				f.gb2_pw.focus();
				return;
			}
			
		}
	</script>
	
</body>
</html>