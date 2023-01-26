<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
<%-- 주의점 : 제이쿼리 버전 충돌되면 실행 안 됨, script는 main.jsp에 가져다 두기 --%>
/*
	jquery : 자바스크립트 라이브러리 => 표준화 : 개발자가 공통으로 사용
	--------------------------- 태그 제어 : css 적용, 화면 출력, 자바연동(Ajax) => 연산자, 제어문, 변수는 자바스크립트 이용
	jquery 핵심 : selector 태그 선택자
	             document.querySelector("선택자") => $("선택자")
	             window.onload=function(){} => $(function(){})
	             
	
	태그제어
	  val() => <input>,<select>의 값 가져올 때 (getter) setter(val(값))
	  text() => <a href="">값</a> => innerText => text(값)
	  attr() => <img src="값"> => attr("src") => attr("src","값")
	  html() => JSON
	  append() => 태그를 첨부할 때
	
	이벤트 처리
	  click(function(){})
	  on("click",function(){})
	  change(function(){})
	  hover(function(){})
	  mousedown(function(){})
	
	디자인
	  css("속성","값")
	  css({"속성":값,"속성":값...})
	  
	
	**표준화
	자바스크립트 : 제이쿼리, 뷰, 리액트 => 변수, 제어문, 내장객체, 연산자
	MVC(JSP) : 스프링
	DAO : MyBatis
	
	
*/
$(function(){ //window.onload=function(){}(일반 자바스크립트), mounted=function(){}(VueJS) componentDidMount()(react class) 
	//selector => 371p $("선택자").이벤트처리, $("선택자").값읽기/값설정, $("선택자").css설정
	//$.ajax(), $getJson(), $eval(), $JSON.parse()
	$('.a').css("color","green")
	$('#b').css("color","blue")
	//$('#b').css({"color":"red","backgroundColor":"yellow"})
	
	//DOMScript
})
</script>
<body>
  <h1 class="c">안녕 제이쿼리</h1>
  <h1 class="a">안녕 제이쿼리</h1>
  <h1>안녕 제이쿼리</h1>
  <h1 class="a">안녕 제이쿼리</h1>
  <h1 id="b">안녕 제이쿼리</h1>
  <h1 class="a">안녕 제이쿼리</h1>
</body>
</html>