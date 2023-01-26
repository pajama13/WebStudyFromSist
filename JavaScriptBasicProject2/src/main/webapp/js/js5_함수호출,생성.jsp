<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*316p 함수

	1. 함수 : 기능 처리(이벤트 : 사용자의 행위가 있을 때 => 사용자 요청에 대한 처리 => 브라우저 안에서만 작동)
	   버튼 클릭, 마우스 오버, 마우스 아웃, 변경, 키보드 누를 경우, 키보드 종료...
	   
	   호출 시 이벤트
	   onclick, onmouseover, onmouserout, onchange, onkeydown, onkeyup
	2. 함수 생성 방법
	   익명의 함수 : function(){} => callback(시스템에 의해서 자동 호출)
	              예) map(function(){})
	   선언적 함수 : function 함수명(){}
	              let func=function(){}
	              let func=()=>{}
	3. 함수의 속성
	   -------- 리턴형 / 매개변수
	   
	   ---------------------------
	   리턴형  매개변수
	   ---------------------------
	     O     O
	     			예)  function 함수명(id,pwd)
	     				{
	     					return 값;  //리턴형을 별도 서술하지 않음, 매개변수는 변수명만 사용
	     				}
	   ---------------------------
	     O     X
	     			예)  function 함수명()
	     				{
	     					return 값;
	     				}
	   ---------------------------
	     X     O	   
	     			예)  function 함수명(name)  => void
	     				{
	     				
	     				}
	   ---------------------------
	     X     X	   
	     			예)  function 함수명()  => void
	     				{
	     					
	     				}
	   ---------------------------
	   구성요소
	   function 함수명()  //선언부
	   {
		   //구현부
	   }
	   
	   => ES6버전
	   //람다식(화살표 함수) : function 생략(매개변수 괄호 뒤에 화살표 => 넣기), return 생략
	   
	   let 함수명=function(){}
	   let 함수명=()=>{} //권장사항
	   
	   
	   let 함수명=function(매개변수){}
	   let 함수명=(매개변수)=>{}  //권장사항
	   

*/
//window.onload => 브라우저에 화면이 떴을 때
window.onload=function(){
	func1(); //함수 호출방법
	func2("홍길동");
	let msg=func3();
	document.write(msg+"<br>")
	let name=func4("이순신");
	document.write(name+"님 로그아웃합니다.");
}
let func1=function(){
	document.write("func1 Call...<br>");
}
let func2=(name)=>{
	document.write(name+"님 환영합니다!<br>");
}
let func3=()=>{
	return "안녕, 자바스크립트!";
}
let func4=(name)=>{
	return name;	
}
/* function func1(){
	document.write("func1 Call...<br>");
}
function func2(name){
	document.write(name+"님 환영합니다!<br>");
}
function func3(){
	return "안녕, 자바스크립트!";
}
function func4(name){
	return name;
} */
</script>
</head>
<body>

</body>
</html>