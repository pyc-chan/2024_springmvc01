<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 800px;
	border-collapse: collapse;
	font-size: 12pt;
	border-color: navy;
}

table, th, td {
	border: 1px solid black;
	padding: 10px;
	text-align: center;
}

div{width: 800px; margin: 0px auto;}
input { padding: 5px; margin: 5px;}
h2{text-align: center;}
</style>
</head>
<body>
	<div>
		<h2> 상품 등록 페이지 </h2>
		<form action="/shop_product_insert_ok" method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<th>분류</th>
						<td>
							<input type="radio" name="category" value="com001" required>컴퓨터
							<input type="radio" name="category" value="ele002">가전제품
							<input type="radio" name="category" value="sp003">스포츠
						</td>
					</tr>
					<tr>
						<th>제품번호</th>
						<td><input type="text" name="p_num" required> </td>
					</tr>
					<tr>
						<th>제품명</th>
						<td><input type="text" name="p_name" required></td>
					</tr>
					<tr>
						<th>판매사</th>
						<td><input type="text" name="p_company" required></td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td><input type="number" name="p_price" required></td>
					</tr>
					<tr>
						<th>할인가격</th>
						<td><input type="number" name="p_saleprice" required></td>
					</tr>
					<tr>
						<th>상품이미지-S</th>
						<td><input type="file" name="file_s" required></td>
					</tr>
					<tr>
						<th>상품이미지-L</th>
						<td><input type="file" name="file_l" required></td>
					</tr>
					<tr>
						<th colspan="2">상품내용</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="10" cols="50" name="p_content"></textarea>
						</td>
					</tr>
				</tbody>
				<tfoot>
					<tr><td colspan="2"><input type="submit" value="상품등록"></td></tr> 
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>