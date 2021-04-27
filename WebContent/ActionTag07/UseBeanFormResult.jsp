<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanFormResult.jsp</title>
</head>
<body>
	<fieldset>
		<legend>useBean액션태그로 폼의 하위요소값 받기</legend>
		<%
			//자바코드로 받기]	
			//1]POST방식으로 파라미터 전달시 한글처리
			request.setCharacterEncoding("UTF-8");
			//2]폼의 하위요소값 받기
			String id = request.getParameter("id")==null?request.getParameter("user"):request.getParameter("id");
			String pwd= request.getParameter("pwd")==null?request.getParameter("pass"):request.getParameter("pwd");
			String name = request.getParameter("name");
			//3]받은 값을 MemberDTO객체의 속성에 설정
			MemberDTO member = new MemberDTO();
			member.setId(id);
			member.setPwd(pwd);
			member.setName(name);
		%>
		<h2>스크립팅 요소 즉 자바코드로 받기</h2>
		<%=member %>
		<h2>액션 태그로 받기</h2>
		<!--  
		  ※중요]
		  jsp:getProperty 나 jsp:setProperty의 name속성에는
		  반드시 jsp:useBean액션 태그의 id속성에 지정한 값이어야 한다
		  자바코드로 생성한 인스턴스 변수는 불가.  
		 -->
		 <!-- STEP1]액션태그로 자바빈 객체 생성 -->
		 <jsp:useBean id="action" class="model.MemberDTO"/>
		 <h3>파라미터명과  자바빈의 속성명(멤버변수) 일치시</h3>
		 <!-- STEP2]setProperty액션태그로 폼요소값 설정:value속성 미 지정 -->
		 <jsp:setProperty name="action" property="*" />
		  <h3>파라미터명과  자바빈의 속성명(멤버변수) 불일치시</h3>
		 <!-- 
   			property에는 자바빈의 속성명(멤버변수명)
   			param속성에는 form의 하위요소명(name속성에 지정한 값)
   		 -->
   		 <jsp:setProperty property="id" param="user" name="action"/>
   		 <jsp:setProperty property="pwd" param="pass" name="action"/>
		 <%=action %>
		 
	</fieldset>
</body>
</html>