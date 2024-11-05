<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE HTML>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style type="text/css">
#bbs table {
	width:580px;
	margin:0 auto;
	margin-top:20px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 14px;
}

#bbs table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#bbs table th, #bbs table td {
	text-align: center;
	border: 1px solid black;
	padding: 4px 10px;
}

.no { width: 15% }
.subject { 	width: 30% }
.writer {	width: 20% }
.reg {	width: 20% }
.hit {	width: 15% }
.title {	background: lightsteelblue }
.odd {	background: silver }

/* paging */
table tfoot ol.paging {
	list-style: none;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
}

table tfoot ol.paging li a {
	display: block;
	padding: 3px 7px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	padding: 3px 7px;
	border: 1px solid silver;
	color: silver;
}

.now {
	padding: 3px 7px;
	border: 1px solid #ff4aa5;
	background: #ff4aa5;
	color: white;
	font-weight: bold;
}
</style>
<script type="text/javascript">
	function bbs_write() {
		location.href = "/bbs_write";
	}
</script>
</head>
<body>
	<div id="bbs" align="center">
		<table summary="게시판 목록">
			<caption>게시판 목록</caption>
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list}">
						<tr><td colspan="5"><h3>게시물이 존재하지 않습니다</h3></td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${list}" varStatus="c">
						<tr>
						  <td>${paging.totalRecord - ((paging.nowPage-1)*paging.numPerPage + c.index)}</td>
						  
						  <c:choose>
						    <c:when test="${k.active == 1 }">
								<td><span style="color: lightgray">삭제된 게시물 입니다</span></td>							    
						    </c:when>
						  	<c:otherwise>
							  <td><a href="/bbs_detail?b_idx=${k.b_idx }&cPage=${paging.nowPage}">${k.subject}</a></td>	
						  	</c:otherwise>
						  	
						  </c:choose>	
						  
						  <td>${k.writer}</td>	
						  <td>${k.write_date}</td>	
						  <td>${k.hit}</td>	
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			
			<!-- 페이지기법 -->
			<tfoot>
				<tr>
					<td colspan="4">
						<ol class="paging">
						   <!-- 이전 -->
						   <c:choose>
						   		<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
						   		    <li class="disable">이전으로</li>
						   		</c:when>
						   		<c:otherwise>
						   			<li><a href="/bbs?cPage=${paging.beginBlock - paging.pagePerBlock}">이전으로</a></li>
						   		</c:otherwise>
						    </c:choose>
						    <!-- 블록안에 들어간 페이지번호들 -->
						    <c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
						    	
						    	<%-- 현재페이지 (링크X)와 현재 페이지가 아닌 것을 구분하자. --%>
						    	<c:if test="${k == paging.nowPage }">
						    		<li class="now">${k}</li>
						    	</c:if>
						    	<c:if test="${k != paging.nowPage }">
						    		<li><a href="/bbs?cPage=${k}">${k}</a></li>
						    	</c:if>
						    </c:forEach>
							<!-- 다음 -->
							<c:choose>
						   		<c:when test="${paging.endBlock >= paging.totalPage }">
						   		    <li class="disable">다음으로</li>
						   		</c:when>
						   		<c:otherwise>
						   			<li><a href="/bbs?cPage=${paging.beginBlock + paging.pagePerBlock}">다음으로</a></li>
						   		</c:otherwise>
						    </c:choose>
						</ol>
					</td>
					<td>
						<input type="button" value="글쓰기" onclick="bbs_write()" />
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>
