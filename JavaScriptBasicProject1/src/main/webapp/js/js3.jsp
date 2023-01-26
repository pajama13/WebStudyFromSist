<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	이항연산자
	*산술연산자 (+,-,*,/,%)
	*비교연산자 (===,!==,<,>,<=,>=) : 결과값 boolean => 조건문
	         ==,
	
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	let a=5;
	let b=2;
	console.log("a+b="+(a+b));
	console.log("a-b="+(a-b));
	console.log("a*b="+(a*b));
	console.log("a/b="+(a/b)); //정수/정수=실수
	console.log("a%b="+(a%b));
	/*
		좌항이 -면 결과값-
		a%b 양수
		-a%b 음수
		a%-b 양수
		-a%-b 음수
	*/
	//문자열인 경우 => 산술처리(문자열 결합) => + 문자열 결합, 나머지연산자는 자동으로 숫자변환 후 연산 처리
	//+ => 문자열 결합, 산술처리
	let c="10";
	let d='20';
	//string형
	console.log("c+d="+(c+d)); //1020
	//자바와 다른 부분 : +외 연산자는 문자형 숫자는 자동으로 숫자형으로 변환됨
	console.log("c-d="+(c-d)); //-10
	console.log("c*d="+(c*d)); //200
	console.log("c/d="+(c/d)); //0.5
	console.log("c%d="+(c%d)); //10
	
	let e="10"
	let f=20;
	
	//자바와 다른 부분2 : 문자열+숫자=문자열
	console.log("e+f="+(e+f)) //1020
	
	//주의점
	let m='A';
	let n=10;
	console.log("m+n="+(m+n)) //A10
	console.log("m-n="+(m-n)) //연산결과값 없음 => NaN(Not-A-Number: 숫자가 아님)
	
	let k=10;
	let p=0;
	console.log("k/p="+(k/p)); //Infinity => 0으로 나눌 수 없음
	/*
		undefined => 변수의 초기화가 안 된 사앹, 변수선언이 없는 경우
		             let a
		             console.log(j)
		NaN(Not a Number) => 문자열+숫자 (연산처리가 안 된 상태)
		Infinity => 0으로 나눈 경우
		
		*숫자형으로 문자열인 경우
		"10", '100' => +는 문자열 결합, 나머지 산술연산자는 숫자로 변환 후 처리됨
		
		*숫자형 아닌 경우
		 'AB'+1 => NaN
		 
		=> 자바스크립트 자체에서 데이터를 읽지 못함 => 자바를 이용해서 전송
		   자바 => 자바스크립트로 전송
		          => VO, ArrayList() => {}, [] => JSON
		             --------------- 존재하지 않음
	*/
}

</script>
</head>
<body>

</body>
</html>
