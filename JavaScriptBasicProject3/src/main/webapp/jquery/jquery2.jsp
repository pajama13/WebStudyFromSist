<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
img{
	width:150px;
	height:220px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*
	
	1. 선택자(태그)
	2. 이벤트 발생 => 버튼 크릭, 이미지 선택, 키보드 입력
	3. 이벤트에 처리 = 일반 자바스크립트 이용
	
	=> 태그
	1) 태그명 $('태그명')
	2) id명 $('#아이디명')
	3) class명 $('.클래스명')
	4) 후손 $('태그명 태그명')
	5) 자손 $('태그명>태그명')
	6) 인접 $('태그명+태그명') $('태그명~태그명')
	7) 가상선택자
	
	
*/
$(function(){
	//img 7개 선택 => this = hover된 이미지 
	$('img').hover(function(){ //이벤트 처리
		$(this).css('opacity',1.0) // 0.0~1.0 if
	},function(){
		$(this).css('opacity',0.2) //else
	})
})
</script>
</head>
<body>
	<img src="1.jpg">
	<img src="2.jpg">
	<img src="3.jpg">
	<img src="4.jpg">
	<img src="5.jpg">
	<img src="6.jpg">
	<img src="7.jpg">
</body>
</html>