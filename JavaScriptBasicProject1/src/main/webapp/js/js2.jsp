<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	연산자
	1. 단항연산자 (++, --, !)
	2. 형변환 연산자
	   Number(), parseInt(), String, Boolean
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//292p
window.onload=function(){
	//단항연산자 (++,--,!)
	let a=10;
	let b=a++; //후치연산자 => 대입 먼저, 이후 값 증가
	console.log("a="+a+" b="+b); //a=10, b=a, a=a+1 ==> a=11, a=10
	
	a=10;
	b=++a; //전치연산자 => 증가 먼저, 이후 대입
	console.log("a="+a+" b="+b); //a=10, a=a+1, b=a => a=11, b=11
	
	let c=false;
	c=!c
	console.log("c="+c) //true
	
	//주의점
	let d=1;
	d=!d;
	console.log("d="+d) //false => 0이나 0.0이 아닌 수는 모두 true
	
	//형변환 연산자**
	let e="10";
	console.log("e="+ typeof e) //데이터형 : string
	console.log("e="+ typeof Number(e)) //숫자형으로 변환
	console.log("e="+ typeof parseInt(2)) //숫자형으로 변환
	
	console.log("e="+ typeof Boolean(e)+","+Boolean(e)); //boolean, true
	
	
}
</script>
</head>
<body>

</body>
</html>