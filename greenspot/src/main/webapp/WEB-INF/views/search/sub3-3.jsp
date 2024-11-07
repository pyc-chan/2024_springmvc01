<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.2/reset.min.css" rel="stylesheet">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" href="./css/common.css">
    <link rel="stylesheet" href="./css/sub3-3.css">
</head>
<body>
    <header>
        헤더
    </header>
    <div id="sub_container">
        <ul class="contents_box">
            <li class="textcenter">
                <h2 class="great_title">보호수 현황표</h2>
                <p class="subheading_title">대한민국의 보호수 현황을 확인해보세요</p>

                <!-- 검색바 -->
                <ul class="sub_search_container">
                    <li class="sub_search">
                        <div class="sub_search_div">
                            <form action="/Integrated Search.html">
                                <input type="text" name="" id="" placeholder="상세주소로 검색하기">
                                <span class="material-icons">search</span>
                            </form>
                        </div>
                    </li>
                </ul>
                <!-- 검색바 -->

                <div class="table_guide">
                    <div class="guide">
                        좌우로 드래그 해주세요.
                    </div>
                </div>
                
                <div>
                    <ul class="result_bar">
                        <li>전체 12890건</li>
                        <li>
                            <select name="" id="" class="search_category">
                                <option value="" selected>주소순</option>
                                <option value="">지정일순</option>
                                <option value="">수령순</option>
                            </select>
                        </li>
                    </ul>
                </div>
                <div class="table">
                    <table class="status_table">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>지정정보</th>
                                <th>수종명 (학명)</th>
                                <th>위치</th>
                                <th>지정일</th>
                                <th>수령</th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- list 가져온만큼 출력 -->
                          <c:forEach var="k" items="${list }" varStatus="c">
                            <tr>
                            	<!-- 페이징 기법 번호 -->
                                <td>${((paging.nowPage-1)*paging.numPerPage)+c+1}</td>
                                <!-- 노목 + 거목 -->
                                <td>${k.t_ty}</td>
                                <td>주목 (Taxus cuspidata)</td>
                                <td>흥천군 내면 창촌리 산3</td>
                                <td>2016.10.04</td>
                                <td>1140</td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- paging 영역 start -->
                <div>
                    <ul class="paging_num_ul">
                    	<c:choose>
                    		<!-- 이전 블럭으로 가는 버튼 비활성화 -->
                    		<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
		                        <li class="material-icons prev">
		                            keyboard_double_arrow_left
		                        </li>
		                        <li class="material-icons prev">
		                            chevron_left
		                        </li>
		                    </c:when>
		                    <!-- 활성화 -->
		                    <c:otherwise>
		                        <li class="material-icons prev">
		                            keyboard_double_arrow_left
		                        </li>
		                        <li class="material-icons prev">
		                            chevron_left
		                        </li>
		                    </c:otherwise>
                        </c:choose>
                        <c:forEach begin="${paging.beginBlock }" end="${paging.endBlock}" step="1" var="k">
                        	<!-- 현재페이지일때 클래스가 active 아니면 빈 문자열 -->
                        	<li class="${k == paging.nowPage ? 'active' : 'disable'}">
                        	 <c:choose>
                        	 	<!-- 현재페이지일때 a태그 제거 -->
					            <c:when test="${k == paging.nowPage}">
					                ${k}
					            </c:when>
					            <c:otherwise>
					            	<!-- 다른 페이지를 눌렀을때 cPage값 파라미터로 넘기기 -->
					                <a href="/treelist?cPage=${k }">
					                    ${k}
					                </a>
					            </c:otherwise>
					        </c:choose>
					        </li>
                        </c:forEach>
                        <li class="material-icons next">
                            chevron_right
                        </li>
                        <li class="material-icons next">
                            keyboard_double_arrow_right
                        </li>
                    </ul>
                </div>
                <!-- paging 영역 end -->


            </li>
        </ul>
    </div>
    <footer>
        푸터
    </footer>
</body>
</html>