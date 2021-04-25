<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String directivePath = "DirectivePage.jsp";
    	String actionPath = "ActionTagPage.jsp";
    	//페이지 및 리퀘스트 영역에 속성 저장]
    	pageContext.setAttribute("pageVar","페이지 영역입니다.");
    	request.setAttribute("requestVar","리퀘스트 영역입니다.");
    	
    	
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>include지시어와 &lt;jsp:include &gt;액션태그</legend>
		<h2>include 지시어로 page삽입하기</h2>
		<!-- file속성에 표현식 사용불가 -->
		<%--@ include file="<%=directivePath --%> <!-- 소스코드가 그대로, 서블릿 X, .java X, .class X -->
		<%@ include file ="DirectivePage.jsp" %>
		<!-- 페이지가 같음 -->
		
		<h2>include액션태그로 페이지 삽입하기</h2>
		<jsp:include page="<%=actionPath %>"/>
		
		<!--  페이지 다르지만 리퀘스트 영역 공유한다. -->
		<h2>삽입된 페이지 안에서 선언한 변수 사용하기</h2>
		<ul>
			<li>directiveString : <%=directiveString %></li>
			<li>actionTagString : <%--=actionTagString --%></li> 
			<!-- include 액션태그로 포함된 페이지에서 선언한 변수는 사용불가(실행결과(HTML결과)만 포함됨) -->
			
		</ul>
		
	</fieldset>
</body>
</html>