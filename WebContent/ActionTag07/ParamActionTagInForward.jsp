<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	포워드된 페이지나 인클루드된 페이지로
	파라미터를 전달시
	한글이 포함된 경우 ,한글 처리는
	반드시 포워드 시키는 최초 페이지나
	인클루드 시키는 페이지에서 
	설정한다. 
	*/ 
	request.setCharacterEncoding("UTF-8");

	/*
	forward의 page속성의 값의 일부만을 표현식으로
	처리 불가.
	예]page="<%=url% >?query=쿼리스트링"
	즉 page="<%=url % >"만 가능
	
	파라미터 전달시
	파라미터의 값을 표현식으로 처리하고자 할때는
	param액션 태그를 이용한다.
	단,파라미터명은 표현식 사용불가.즉 문자열만 와야한다
	*/
	String pageUrl="ForwardedPage.jsp?query=쿼리스트링";
	String paramValue ="KOSMO";
	//리퀘스트 영역에 객체 저장]
	request.setAttribute("member",new MemberDTO("KIM","1234","김길동",null,"20"));
%>

<jsp:forward page="<%=pageUrl %>">
	<jsp:param value="코스모" name="name"/>
	<jsp:param value="<%=paramValue %>" name="id"/>
</jsp:forward>