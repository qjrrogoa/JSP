<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ForEachTagGeneral.jsp</title>
</head>
<body>
	<fieldset>
		<legend>일반 for문 형태의 forEach태그</legend>
		<!-- 
		필수 속성: begin 및 end 그리고  var속성
	            step은 생략가능(생략시 1씩증가)	
	            step에는 0보다 큰 정수값만 가능             
	 	-->
	 	<h2>자바코드로 Hn태그 출력</h2>
	 	<% for(int i=1;i<=6;i++){ %>
	 	<h<%=i %>>제목<%=i %></h<%=i %>>
	 	<%} %>
	 	<h2>EL과 JSTL로 Hn태그 출력</h2>
	 	<c:forEach begin="1" end="6" var="i" >
	 		<h${i }>제목${i }</h${i }>	 	
	 	</c:forEach>
	 	<h2>varStatus속성</h2>
	 	<!-- varStatus속성에 지정한 변수에는 
                          반복과 관련된 정보를 추상화한 클래스인
             LoopTagStatus객체가 저장됨
     	-->
     	<c:forEach begin="3" end="5" var="i" varStatus="loop">
     		<h4>${loop.count}번째 반복</h4>
     		<ul>
     			<li>\${loop.index } : ${loop.index }</li>
     			<li>\${loop.first } : ${loop.first }</li>
     			<li>\${loop.last } : ${loop.last }</li>
     			<li>\${loop.current } : ${loop.current }</li>
     		</ul>
     	</c:forEach>
     	<h2>varStatus속성을 이용한 스타일 변경</h2>
     	<!--문]반복이 짝수번째일때는 글자색을 
              RED로 홀수번째일때는 글자색을 GREEN으로  
                            단, 첫번째 반복이라면 글자색을 BLUE로 
                            마지막 반복이면 CYAN  -->
     	<c:forEach begin="1" end="6" var="i" varStatus="loop">
     		<c:choose>
     			<c:when test="${loop.first }">
     				<c:set var="color" value="blue"/>
     			</c:when>
     			<c:when test="${loop.last }">
     				<c:set var="color" value="cyan"/>
     			</c:when>
     			<c:when test="${loop.count % 2==0 }">
     				<c:set var="color" value="#ff0000"/>
     			</c:when>
     			<c:otherwise>
     				<c:set var="color" value="green"/>
     			</c:otherwise>     		
     		</c:choose> 
	 		<h${i } style="color:${color}">제목${i }</h${i }>	
	 	</c:forEach>
	 	<h2>1부터 100까지 홀수의 합(EL및 JSTL사용)</h2>
	 	<c:forEach begin="1" end="100" var="i">
	 		<c:if test="${i % 2 !=0 }">
	 			<c:set var="sum" value="${sum+i }"/>
	 		</c:if>	 	
	 	</c:forEach>
	 	${sum }
	 	<h2>for문안의 for문(중첩 for문)</h2>
	 	<!-- 
		  1 0 0 0 0
		  0 1 0 0 0
		  0 0 1 0 0
		  0 0 0 1 0
		  0 0 0 0 1	출력
		-->
		<c:forEach begin="1" end="5" var="k">
			<c:forEach begin="1" end="5" var="j">
				<c:if test="${k==j }" var="result">
					1&nbsp;&nbsp;
				</c:if>
				<c:if test="${not result }">
					0&nbsp;&nbsp;
				</c:if>
			</c:forEach>
			<br/>		
		</c:forEach>
	 	<h2>구구단 출력</h2>
	 	<!-- 
  		문]  짝수행에 마우스 오버시 빨강
  	   		홀수행에 마우스 오버시 노랑
  	   		마우스 아웃시는 흰색 그리고 table태그를 사용해서 출력하여라
   		-->
   		<table style="border-spacing:1px;background-color:black;width:700px">
   			<c:forEach begin="1" end="9" var="i" varStatus="loop">
   				<c:choose>
   					<c:when test="${loop.count % 2==0 }">
     					<c:set var="color" value="#ff0000"/>
     				</c:when>
     				<c:otherwise>
     					<c:set var="color" value="yellow"/>
     				</c:otherwise>   				
   				</c:choose>
	   			<tr style="background-color:white" onmouseover="this.style.backgroundColor='${color}';" onmouseout="this.style.backgroundColor='white';">
	   				<c:forEach begin="2" end="9" var="k">
	   					<td>${k } * ${i } = ${i*k }</td>
	   				</c:forEach>
	   			</tr>
   			</c:forEach>
   		</table>
	</fieldset>
</body>
</html>