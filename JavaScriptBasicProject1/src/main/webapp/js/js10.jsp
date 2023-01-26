<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	//const => 상수형 변수 => 값 변경 불가 (자바에서 값 받아왔을 때)
	let a=10;
	console.log("a="+a)
	a="AAA"
	console.log("a="+a)
	a=[1,2,3,"홍길동"]
	console.log("a="+a)
	a={name:"홍길동",age:20} //Object{} 객체
	console.log("이름="+a.name+" 나이="+a.age)
}
</script>
</head>
<body>

</body>
</html>