<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//한글처리
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InnerObjectParamExamResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>자바코드(스크립팅 요소)로 파라미터 받기</legend>
		<ul>
			<li>이름:<%=request.getParameter("name") %></li>
			<li>성별:<%=request.getParameter("gender") %></li>
			<%
			String[] inters = request.getParameterValues("inter");
			%>
			<li>관심사항:<%=Arrays.toString(inters) %></li>
			<li>학력:<%=request.getParameter("grade") %></li>
		</ul>
	</fieldset>
	
	<fieldset>
		<legend>EL로 파라미터 받기</legend>
		<!-- 
			하나받을때:param.파라미터명 혹은 param["파라미터명"]
			여러개 받을때:paramValues.파라미터명 혹은 paramValues["파라미터명"]
        --> 가산디지털단지역 7호선
		<ul>
			<li>이름:${param.name }</li>
			<li>성별:${param["gender"] }</li>
			<li>관심사항:
			[<c:forEach items="${paramValues.inter }" var="item" varStatus="loop">
					<c:if test="${not loop.last }" var="result">
						${item },
					</c:if>
					<c:if test="${not result }">
						${item }
					</c:if>					
				</c:forEach>]		
			</li>
			<li>학력:${param.grade }</li>
		</ul>
	</fieldset>
</body>
</html>