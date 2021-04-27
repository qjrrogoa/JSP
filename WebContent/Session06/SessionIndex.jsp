<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SessionIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>session(HttpSession타입)내장객체의 주요 메소드</legend>
		<ul>
			<li>셰션의 유효시간(web.xml:분단위):<%=session.getMaxInactiveInterval() %>초</li>
			<% session.setMaxInactiveInterval(60);//60초 %>
			<li>메소드로 세션의 유효시간 설정(초단위):<%=session.getMaxInactiveInterval() %>초</li>
			<li>세션 아이디:<a href="SessionResult.jsp"><%=session.getId() %></a>
			<%
				//세션의 최초 생성시간
				long createTime=session.getCreationTime();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String creationTimeString = dateFormat.format(new Date(createTime));
				//서버로 클라이언트가  마지막으로  요청한 시간
				long accessTime = session.getLastAccessedTime();
				String accessTimeString = dateFormat.format(accessTime);
			
			%>
			<li>세션의 최초 생성 시간:<%=creationTimeString %></li>
			<li>클라이언트 최근 요청시간:<%=accessTimeString %></li>
			
		</ul>
		<h2>세션 및 리퀘스트 영역에 속성 저장</h2>
		<%
			request.setAttribute("requestScope","리퀘스트 영역입니다");
			session.setAttribute("sessionScope", "세션 영역입니다");	
		
		%>
	</fieldset>
</body>
</html>