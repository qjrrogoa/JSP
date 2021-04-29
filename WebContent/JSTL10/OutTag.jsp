<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OutTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>out태그 </legend>
		<c:set var="htmlString"><h3>h3태그로 감싼 문자열</h3></c:set>
		
		<h2>EL로 출력</h2>
		\${htmlString } : ${htmlString }
		
		<h2>out태그로 출력 - excapeXml="false"(EL과 동일)</h2>
		<c:out value="${htmlString }" escapeXml="false"/>
		
		<h2>out태그로 출력 - excapeXml="true"(디폴트-HTML태그가 그대로 문자열로 출력)</h2>
		<c:out value="${htmlString }" />
		
		<h2>default속성</h2>
		<!-- 
			out태그의 value속성의 값이 없을 때
			default속성에 지정한 값을 출력함.
		 -->
		 
		 <h3> 빈 문자열인 경우 : 값이 있는 경우</h3>
		 <c:out value="" default="빈 문자열이다."/>
		 
		 <h3> null인 경우 : 값이 없는 경우</h3>
		 <c:out value="${param.name }" default="null 이다."/>
		 
		 <h3>페이지 링크에 응용</h3>
		 <c:url value="/BBS08/List.jsp?nowPage="/><br/>
		 <c:out value="${param.nowPage }" default="1"/><br/>
		 <a href='<c:url value="/BBS08/List.jsp?nowPage="/><c:out value="${param.nowPage }" default="1"/>'>리스트</a>
		 
	</fieldset>
</body>
</html>