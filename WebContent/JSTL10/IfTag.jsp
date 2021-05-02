<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IfTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>if태그</legend>
		<c:set value="99" var="numvar"/>
		<c:set value="JSTL" var="strvar"/>
		<!--if태그는 시작 태그와 종료 태그를 
	                사용해서 판단해라.		      
	        else문이 없다. -->
	    <c:if test="${numvar mod 2 eq 0 }" var="result">
	    	 ${numvar }는 짝수<br/>   
	    </c:if>
	    <c:if test="${not result }">
			 ${numvar }는 홀수<br/>   
		</c:if>
		\${result } : ${result }<br/>
		<c:if test="${numvar mod 2 ne 0 }" var="result">
	    	 ${numvar }는 홀수<br/>   
	    </c:if>
		\${result } : ${result }<br/>
		<h2>위의 if문(JSTL)을 EL의 삼항 연산자로 변경</h2>
		${numvar}는 ${numvar % 2 ==0 ?"짝수":"홀수" }
		<h2>문자열 비교</h2>
		<c:if test="${strvar =='제이에스티엘' }">
			${strvar }는 제이에스티엘		
		</c:if>
		<c:if test="${strvar =='jstl' }">
			${strvar }는 jstl		
		</c:if>
		<c:if test="${strvar =='JSTL' }">
			${strvar }는 JSTL<br/>	
		</c:if>
		<c:if test="${  true      }">
			항상 출력되는 HTML
		</c:if>
		<c:if test="${false}">
			절대 출력 안되는 HTML
		</c:if>
		<!-- 
	 	※test속성에 EL식이 아닌 일반 값을
	 	넣으면 무조건 거짓
	 	단,일반 값이라도 TRUE(true)인(대소문자 상관없이) 경우는 true로 판단
	 	또한 EL식이더라도 \${}양쪽에 빈 공백이
	 	들어가면 무조건 거짓	 	
	  	-->
	  	<h2>test속성에 일반 값으로 조건 설정</h2>
	  	<c:if test="100" var="result">
	  		100는 참이다
	  	</c:if>
	  	\${result } : ${result }<br/>
	  	
	  	<c:if test="tRuE" var="result"><!-- 빈 공백이 역시 없어야 한다 -->
	  		tRuE는 참이다<br/>
	  	</c:if>
	  	\${result } : ${result }<br/>
	  	
	  	<c:if test="false" var="result">
	  		false는 참이다<br/>
	  	</c:if>
	  	\${result } : ${result }<br/>
	  	
	  	<c:if test="100 > 10" var="result">
	  		100 > 10는 참이다<br/>
	  	</c:if>
	  	\${result } : ${result }<br/>
	  	<h2>EL로 조건 설정시 \${}바깥 양쪽에 공백이 있으면 조건이 참이더라도 무조건 거짓</h2>
	  	<c:if test="${100 > 10 }" var="result">
	  		100 > 10는 참이다<br/>	  	
	  	</c:if>
	  	\${result } : ${result }<br/>
	  	<h2>if 태그 연습</h2>
	  	<!-- 
		   문]파라미터로 아이디(user)와 비밀번호(pass)를
		   받아서
		   아이디가 "KIM"이고 비밀번호가 "1234"인 경우
		   회원이라고 가정하자.
		   회원인 경우 "\${EL로 출력} 님 즐감하세요" 출력
		   비회원인 경우 "아뒤와 비번이 틀려요" 출력
		   단,EL과 JSTL만 사용해서 구현해라-->
		   
		   <c:if test="${! empty param.user && ! empty param.pass }">
			   <c:if test="${param.user=='KIM' and param.pass=='1234' }" var="result">
			   		${param.user} 님 즐감하세요
			   </c:if>
			   <c:if test="${not result }">
			   		아뒤와 비번이 틀려요
			   </c:if>
		   </c:if>
		   
	</fieldset>
</body>
</html>