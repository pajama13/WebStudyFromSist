<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*
	for
    1) 일반 for
	   for(초기값;조건식;증가식)
	   {
		   반복문
	   }
    2) forEach
	   for(let data of 배열) //배열에 실제값을 갖고 온다
	   {
		  
	   }
    3) forEach
       for(let data in 배열) //인덱스번호 => 0,1,2...
       {
    	   
       }
    4) map
       배열명.map(function(data){
    	   //data=> 실제 저장된 데이터를 가져옴
       })
       
       ***가장 많이 사용되는 형식
       배열명.map((data)=>{
    	   
       })
    5) forEach
*/
window.onload=function(){
	const names=["사과","배","멜론","수박","바나나"];
	
	document.write("<h1>일반 for문 사용법</h1>")
	for(let i=0; i<names.length;i++)
	{
		document.write(names[i]+"&nbsp;")
	}
	//for(String s:names)
	document.write("<h1>for of문 사용법</h1>")
	for(let f of names)
	{
		document.write(f+"&nbsp;")	
	}
	//for(String s:names)
	document.write("<h1>for in문 사용법</h1>")
	for(let f in names)
	{
		document.write(names[f]+"&nbsp;")	
	}
	
	//for(String s:names)
	document.write("<h1>map문 사용법(1)</h1>")
	names.map(function(f){
		document.write(f+"&nbsp;")	
	})
	
	//for(String s:names)
	document.write("<h1>map문 사용법(2)</h1>")
	names.map((f)=>{
		document.write(f+"&nbsp;")	
	})
	
	//for(String s:names)
	document.write("<h1>forEach문 사용법(1)</h1>")
	names.forEach(function(f){
		document.write(f+"&nbsp;")	
	})
	
	//for(String s:names)
	document.write("<h1>forEach문 사용법(2)</h1>")
	names.forEach((f)=>{
		document.write(f+"&nbsp;")	
	})
}
</script>
</head>
<body>

</body>
</html>