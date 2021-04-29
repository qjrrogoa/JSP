<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanActionTagBasic.jsp</title>
</head>
<body>
	<fieldset>
		<legend>useBean액션 태그</legend>
		
		<jsp:useBean id="member" class="model.MemberDTO" scope="request"/>
		
		<!--위 액션태그를 자바코드 만으로 코딩시 아래와 같다 -->
		<%--
			//1]scope속성에 지정한 영역에서 객체 얻기(속성명은 id에 지정한 이름으로..)
			//인스턴스 변수명은 역시 id에 지정한 이름으로	 
			MemberDTO member = (MemberDTO)request.getAttribute("member");
			//2]영역에 존재하지 않을때 생성
			if(member == null){
				//기본 생성자로 생성]
				member = new MemberDTO();
				//생성된 객체를 scope에 지정한 영역에 저장(속성명은 id에 지정한 이름으로..)
				request.setAttribute("member",member);
			}	
		
		--%>
		<%=member %>
		<h2>setProperty액션 태그로 자바빈 객체 속성 설정</h2>
		
		<!-- 액션 태그로 속성 설정 -->	
		<!-- 
		  - setter를 호출한 것과 같다
		  - name속성에는 액션태그로 자바빈 객체 생성시 
		    id속성에 지정한 값
		  -->
		<jsp:setProperty property="id" name="member" value="KIM"/>
		<jsp:setProperty property="name" name="member" value="김길동"/>
		<!-- 자바코드로 속성 설정 -->
		<%
			member.setAge("20");
			member.setPwd("1234");		
		%>
		<h2>속성 설정후 출력</h2>
		<%=member %>
		<h2>getProperty액션 태그로 자바빈 객체 속성 읽기</h2>
		<!-- getter를 호출한 것과 같다 -->
		<ul>
			<li>아이디:<jsp:getProperty property="id" name="member"/> </li>
			<li>비번:<jsp:getProperty property="pwd" name="member"/> </li>
			<li>나이:<%=member.getAge() %> </li>
			<li>이름:<%=member.getName() %> </li>
		</ul>
	</fieldset>
</body>
</html>