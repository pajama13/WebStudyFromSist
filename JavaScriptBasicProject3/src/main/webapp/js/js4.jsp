<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
   margin-top: 30px;
}
.row{
   width: 800px;
   margin: 0px auto;
}

</style>
<script type="text/javascript">
/*
	객체지향(자바) = 매칭
	자바 SawonVO => {} (JSON)
	자바 ArrayList => [] => [{},{},{}...]
	
	React : class aaa extends Component
	        hooks => function aaa()
	
	1) Array 배열 []
	   push() : 배열에 값을 추가
	   pop() : 배열의 마지막 값을 제거
	   *** slice() : 원하는 위치까지 잘라서 새로운 배열을 만듬
	   indexOf() : 데이터 위치 확인
	   find() : 검색
	   delete() : 배열을 완전 삭제
	   length() : 저장된 갯수 읽기
	   slice(), 클로저
*/
window.onload=function(){
	//배열 선언
	let names=[
		{name:'홍길동'},
		{name:'심청이'},
		{name:'이순신'},
		{name:'강감찬'},
		{name:'박문수'},
	]
	//배열 출력
	console.log(names)
	//배열의 크기
	colsole.log("인원수:"+names.length)
	//인원 추가 => 마지막에 추가 push
	names.push({name:"을지문덕"})
	//배열 출력
	console.log(names)
	//배열 삭제 => 마지막에 추가된 데이터만 삭제
	names.pop();
	console.log(names)
}
</script>
</head>
<body>

</body>
</html>