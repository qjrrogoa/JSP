<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IfTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend> if태그 </legend>
		<c:set var="numvar" value="99"/>
		<c:set var="strvar" value="JSTL"/>
		
		<!-- if태그는 시작태그와 종료 태그를 사용해서 판단해라. -->
		<c:if test ="${numvar mod 2 eq 0}" var="result">
			${numvar }는 짝수<br/>
		</c:if>
		
		<c:if test="${not result}">
			${numvar }는 홀수<br/>
		</c:if>
		\${result } : ${result }<br/>
		
		<c:if test ="${numvar mod 2 ne 0}" var="result">
			${numvar }는 홀수<br/>
		</c:if>
		\${result } : ${result }<br/>
		

		<h2>위의 if문(JSTL)을 EL의 삼항 연산자로 변경</h2>
		${numvar}는 ${numvar % 2 == 0 ? "짝수" : "홀수"}
		
		<h2>문자열 비교</h2>
		<c:if test="${strvar == '제이에스티엘'}">
			${strvar }는 제이에스티엘
		</c:if>
		
		<c:if test="${strvar == 'jstl'}">
			${strvar }는 jstl
		</c:if>		
		
		<c:if test="${strvar == 'JSTL'}">
			${strvar }는 JSTL
		</c:if>
		
		<c:if test="${ true }">
			항상 출력되는 HTML
		</c:if>
		
		<c:if test="${ false }">
			절대 출력 안되는 HTML
		</c:if>
		
		<!-- 
			test속성에 EL식이 아닌 일반 값을 넣으면 무조건 거짓
			단, 일반 값이라도 TRUE(true)인 (대소문자 상관없이) 경우는 true로 판단
			(빈 공백은 없어야 한다.)
			또한 EL식이라도 \${} 양쪽에 빈 공백이 들어가면 무조건 거짓
		-->
		
		<h2>test속성에 일반값으로 조건 설정</h2>
		<c:if test="TrUe" var="result">
			100은 참이다. <br/>
		</c:if>
		\${result } : ${result }<br/>
	</fieldset>
</body>
</html>