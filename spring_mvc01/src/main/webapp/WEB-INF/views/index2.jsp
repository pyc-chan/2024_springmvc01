<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Non-Annotation</h1>
	<h2><a href="/start1">start1</a></h2>
	<h2><a href="/start2">start2</a></h2>
	<hr>
	
	<h1>Annotation</h1>
	<h2><a href="/start3">start3</a></h2>
	<form method="post" action="/start4"> 
		<button type="submit">전송하기2</button>
		<input type="submit" value="전송하기1">
	</form>
	<h2><a href="/start5">start5</a></h2>
	<h2><a href="/start6">start6</a></h2>
	<h2><a href="/start7">start7</a></h2>
	<hr>
	
	    <h2>HTML을 활용한 서버에게 정보 보내기</h2>
    <form action="/start8" method="get" autocomplete="on">
        <p>
           <label> 이름 : <input type="text" name="username" placeholder="이름 입력" required> </label>
        </p>
        <p>   
            <label> 나이 : <input type="number" name="userage" placeholder="나이 입력" required> </label>
        </p>
        <input type="submit" value="서버에게 보내기">
        <input type="reset" value="취소">
    </form>
    <br>
    <hr>
    
    <form action="/calc" method="post">
    	<p> 수1 : <input type="number" size="15" name="s1" required>  </p>
    	<p> 수2 : <input type="number" size="15" name="s2" required>  </p>
    	<p>연산자 : 
    		 <input type="radio" name="op" value="+" checked> +
    		 <input type="radio" name="op" value="-"> -
    		 <input type="radio" name="op" value="*"> *
    		 <input type="radio" name="op" value="/"> /
    	</p>
    	<p>취미 :  
    		 <input type="checkbox" name="hobby" value="축구"> 축구
    		 <input type="checkbox" name="hobby" value="야구"> 야구
    		 <input type="checkbox" name="hobby" value="농구"> 농구
    		 <input type="checkbox" name="hobby" value="배구"> 배구
    	</p>
    	<input type="hidden" name="cPage" value="2">
    	<input type="submit" value="보내기">
    </form>
    
    <form action="/calc2" method="post">
    	<p> 수1 : <input type="number" size="15" name="s1" required>  </p>
    	<p> 수2 : <input type="number" size="15" name="s2" required>  </p>
    	<p>연산자 : 
    		 <input type="radio" name="op" value="+" checked> +
    		 <input type="radio" name="op" value="-"> -
    		 <input type="radio" name="op" value="*"> *
    		 <input type="radio" name="op" value="/"> /
    	</p>
    	<p>취미 :  
    		 <input type="checkbox" name="hobby" value="축구"> 축구
    		 <input type="checkbox" name="hobby" value="야구"> 야구
    		 <input type="checkbox" name="hobby" value="농구"> 농구
    		 <input type="checkbox" name="hobby" value="배구"> 배구
    	</p>
    	<input type="hidden" name="cPage" value="2">
    	<input type="submit" value="보내기">
    </form>
</body>
</html>