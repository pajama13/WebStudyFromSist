<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	
	자바스크립트 역할
	*브라우저에서 이벤트 기능 처리 (동적)
	  1) 브라우저에서 이벤트 처리 : 자바스크립트
	  2) 브라우저에서 출력 : html/css
	  3) 데이터 관리 : 자바
	     자바스크립트에서 오라클 연결 X => 단, 서버사이드 NodeJS(<=>스프링)는 연결 가능
	
	  => 브라우저 (html, js) <===> 프로그램 언어 (자바,C#, 파이썬)
	     
	     자바 <=====> 오라클 연결 가능
	     => 자바 : 자바스크립트 매칭
	        ------------------
	        ~VO => {} => Object
	        ~List => [{},{},{}...] => Array
	                 ------------- JSON(자바스크립트 객체 표현법)
	 
	 => 브라우저 안에서 자바에서 전송된 데이터를 받아서 동적으로 변환
	               ----------------
	*자바스크립트 사용법
	  1) 내부 스크립트 : 1개의 파일에서만 사용 가능
	     <head>
	       <script>
	       </script>
	     </head>
	  2) 외부 스크립트 : 여러 개 파일에서 사용 가능 => 라이브러리
	     .js(확장자)
	     원격 <script src="원격(url)"> => import처리 필요
	     내부 <script src="경로명">
	  3) 인라인 스크립트 : 1개의 태그에서만 제어
	  
	*자바스크립트 버전 (ES6)
	  ES5 : var (변수 => 자동 지정 변수) var i=10; => i:Number, var i="aaa" => i:String
	  		=> 단점 : 스코프가 명확하지 않다
	  		        ------ 사용범위
	  		        function a()
	  		        {
	  		          if()
	  		          {
	  		            var i=10;
	  		          }
	  		          사용 가능
	  		        }
	  ES6 : let => 블록 종료되면 사라짐
	  		const => 상수형 변수 (final 같은)
	  		람다식 (화살표 함수)
	  		  function display(){}
	  		  let display=function(){}
	  		  let display=()=>{} : =>는 function 생략, return 생략
	  		  ------------------
	  		  
	  		  같다(===), 같지 않다(!==)
	  		  문장끝 세미콜론 ; 생략 가능
	  		  
	*자바스크립트 출력 
	  1. alert() => Modal
	  2. colsole.log() : 연습용, 디버깅용
	  3. document.write : 브라우저 화면에 출력 시
	  4. 태그.innerHTML="" => Ajax, VueJS, ReactJS  
	  ---------------------------------------------- 문자열 (비교연산자)
	  
	  => 자바스크립트 문법
	     1) 변수 선언 (변수의 데이터형이 없음) => 값에 따라서 데이터형 바뀜
			let i=10;
			
		    변수 식별자
		    -키워드는 사용할 수 없음 (if, let...)
	        -특수문자 사용가능
		    -숫자로 시작 불가
		    -공백 있으면 안 됨
		    -대소문자 구분함
		    -문자 길이 상관없음 (3~10)
			
		    규칙
		    -생성자는 대문자
		    -변수/메소드/함수는 소문자
		    -단어가 여러 개인 경우, 헝가리안식 또는 _로 구분
		 
		 2) 데이터형
		    let i=10 => int
		    let i=10.5 => double
		    ---------------------- i : Number => '10' => 형변환 Number('10'), parseInt('10') 
		    let i='A' => char
		    let i="A" => string
		    ---------------------- i : string => String(10) => "10"
		    let i=true => boolean
		    ---------------------- Boolean(1) => true, Boolean(0) => false
		    
		    let i={} => 객체 => i:object
		    let i={name:'홍길동',age:30}
		           ----        ---      => 멤버변수
		           i.name      i.age
		    let i=[] 배열 => i:Array
		    let i=function(){} => i:function
		    ------------------------------------ 연산자, 제어문처리, 함수, 클래스(객체지향), 프로토타입 => 라이브러리

		
		3) 함수
		
		   main 함수 => 시작과 동시에 자동호출되는 함수
		   -일반 자바스크립트
		    window.onload=function()
		    {
		    {
		   -Jquery
		    $(function(){
		    })
		   --------------------------------------
		   -VueJS
		    mounted(){}
		   -ReactJS
		    componentDidMount(){} => 15버전 이전
		    => Hooks => 현재 18버전
		       Effect()
		   -------------------------------------- MVC 구조		     
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 한줄주석
/* 여러줄주석 */
window.onload=function(){
	//변수 선언
	let a=10;
	let b=10.5;
	let c='ABC';
	let d="ABC";
	let e=[1,2,3,4,5,"홍길동"]; //Array배열 (Object이기 때문에 다른 데이터형 첨부 가능)
	let f={name:"홍길동",sex:"남자",age:20};
	//;은 생략 가능, 대소문자 구분
	//출력
	console.log("a="+a); //System.out.println()
	console.log("b="+b);
	console.log("c="+c);
	console.log("d="+d);
	console.log("e="+e);
	console.log("f="+f);
	//출력 => 브라우저에 출력
	document.write("a="+a+"<br>");
	document.write("b="+b+"<br>");
	document.write("c="+c+"<br>");
	document.write("d="+d+"<br>");
	document.write("e="+e+"<br>");
	document.write("f="+f+"<br>");
	document.write("<hr>");
	
	/*
		자바스크립트에서 지원하는 데이터형
		1. number : 정수, 실수
		2. string : 문자(''), 문자열("")
		3. object : 배열([]), 객체 ({})
		4. boolean : true/false => Boolean(1) => true, Boolean(0) => false
		5. null : 값이 없는 경우
		6. undefined : 선언 안 된 경우
	
		
	*/
	document.write("a="+typeof a+"<br>")
	document.write("b="+typeof b+"<br>")
	document.write("c="+typeof c+"<br>")
	document.write("d="+typeof d+"<br>")
	document.write("e="+typeof e+"<br>")
	document.write("f="+typeof f+"<br>")
	let i //undefined 선언 X => 값 X
	document.write("i="+typeof i+"<br>") //undefined
	document.write("j="+typeof j+"<br>") //undefined
	let k=''; //공백문자 (값 있는 상태)
	document.write("k="+typeof k+"<br>")
	let o=10
	document.write("o="+typeof o+"<br>")
	o='ABC';
	document.write("o="+typeof o+"<br>")
	o={name:"홍길동"}
	document.write("o="+typeof o+"<br>")
}
</script>
</head>
<body>

</body>
</html>