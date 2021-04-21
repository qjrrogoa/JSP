<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestForServerNClinet.jsp</title>
</head>
<body>
	<fieldset>
		<legend>요청한 서버와 클라이언트에 대한 정보</legend>
		<form method = "post">
			<input type = "submit" value = "서버로 전송"/>
		</form>
		<ul>
			<li> 전송방식 : <%=request.getMethod() %></li>
			<li> 전체 URL : <%=request.getRequestURL() %></li>
			<li> 도메인을 제외한 URI : <%=request.getRequestURI() %></li>
			<li> 요청 프로토콜 : <%= request.getProtocol() %></li>
			<li> 요청 서버명 : <%=request.getServerName() %></li>
			<li> 요청 서버 포트 : <%=request.getServerPort() %></li>
			<li> 클라이언트의 IP주소 : <%=request.getRemoteAddr() %>
			<li> 클라이언트의 IP주소 : <%=request.getRemoteHost() %>
			<li> 요청과 관련된 세션객체 얻기(서블릿에서 사용-로그인 처리시) <%=request.getSession() %> </li>
			<li> 세션 내장객체 : <%=session %>
		</ul>
	</fieldset>
	
	<!-- 
		JSP에서는 웹 어플리케이션 전체 영역을 Context라 칭함.
		
		getContextPath(): server.xml의 Context태그에 path속성에 지정한 값을 얻어옴.
		HTML에서 절대경로로 링크를 걸때 주로 사용
		 -->
	<fieldset>
		<legend> Context Root얻기 </legend>
		<h3>프로젝트 생성 후 server.xml의 Context요소의 path속성 미 변경시</h3>
		Context Path(프로젝트명) : <%=request.getContextPath() %>
	</fieldset>
</body>
</html>