<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
input{
	margin : 5px;
	padding : 5px;
}
</style>
<script type="text/javascript">
	function sendData() {
		for (var i = 0; i < document.forms[0].elements.length; i++) {
			if (document.forms[0].elements[i].value == "") {
				if (i == 3)
					continue;
				alert(document.forms[0].elements[i].name + "를 입력하세요");
				document.forms[0].elements[i].focus();
				return;//수행 중단
			}
		}
		document.forms[0].submit();
	}
</script>
</head>
<body>
	
	<form method="post" enctype="multipart/form-data">
		<table width="700">
		<tbody>
			<tr>
				<th>작성자</th>
				<td align="left"><input type="text" name="writer"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td align="left"> <input type="text" name="title"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td align="left"><textarea rows="10" cols="60" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td align="left"><input type="file" name="filename"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td align="left"><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="입력" onclick="board_write_ok(this.form)" > 
				<input type="reset" value="취소" >
				<input type="reset" value="목록" onclick="bord_list(this.form)" >
				</td>
			</tr>
            </tbody>
		</table>
	</form>
	
	<script type="text/javascript">
		function board_write_ok(f) {
			for (let i = 0; i < f.elements.length; i++) {
				if(f.elements[i].value == ""){
					if(i==3)  continue ;
					alert(f.elements[i].name + "를 입력하세요");
					f.elements[i].focus();
					return;
				}
			}
			f.submit();
		}
	</script>
</body>
</html>