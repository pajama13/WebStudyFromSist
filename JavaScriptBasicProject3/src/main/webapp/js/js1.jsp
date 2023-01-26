<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*
	자바스크립트 : 동적 (태그제어) => 클릭, 변경, 마우스, 키보드
	                       => 데이터를 변경하기 위해서는 어느 태그에 값을 첨부, 스타일
	
	  1) 태그를 가지고 오는 방법 (문서객체 모델 : 335p)
	     태그 1개
	     => document.getElementById("아이디명") => 아이디 중복없는 속성
	       => Element(태그), Attribute(속성)
	          태그 <a href=""> => a는 클래스, href는 멤버변수 => object
	          모든 태그명은 클래스로 인식, 속성 멤버로 인식
	          let a=document.getElementById("aaa");
	          a.href="" a.target
	       => document.querySelector('#아이디명')
	     
	     태그 여러 개
	     => document.getElementByName("이름") => <input type=text name="">
	     => document.getElementsByClassName("클래스명")
	     => document.querySelectorAll(선택자)
	     
	     => jquery ($()), vue => v-model, react => $ref
	                      ----            -----
	                      양방향            단방향
*/
window.onload=function(){
	document.querySelector("h1").style.color='red';
	document.querySelector("h1").style.background='yellow';
	document.querySelector("h2").style.color='blue';
	document.querySelector("#id").value="admin";
	document.getElementById("id").value="hello";
}
</script>
</head>
<body>
	<h1 style="">안녕</h1>
	<h2>자바스크립트</h2>
	<input type=text id="id" size=20>
</body>
</html>