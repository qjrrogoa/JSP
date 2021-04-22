<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	/*
	-application영역에 저장된 속성은 모든 JSP페이지(서블릿)에서 공유한다.
	-링크로 페이지 이동하든 리다이렉트나 포워드로 자동 이동하든 모든 JSP페이지는
	  하나의 application영역안에 있기때문에.....
	*/
	//[어플리케이션 영역에 속성 저장]
	//저장할 객체 생성
	MemberDTO first = new MemberDTO("GA","1234","가길동",null,"20");
	MemberDTO second = new MemberDTO("NA","5678","나길동",null,"10");
	MemberDTO third = new MemberDTO("DA","999","다길동",null,"30");
	
	//리스트 계열 컬렉션에 객체 저장]
	List<MemberDTO> list = new Vector<MemberDTO>();
	list.add(first);
	list.add(second);
	list.add(third);
	
	//맵계열 컬렉션에 객체 저장]
	Map<String,MemberDTO> map = new HashMap<String,MemberDTO>();
	map.put("first",first);
	map.put("second",second);
	map.put("third",third);
	
	//application영역에 컬렉션들 저장]
	application.setAttribute("list", list);
	application.setAttribute("map", map);
	

%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>ApplicationScopeIndex.jsp</title>
</head>
<body>	
	<fieldset>
		<legend>application영역</legend>
		<h2>사용자 클릭으로 페이지 이동</h2>
		<a href="ApplicationScopeResult.jsp"> 클릭하세요 </a>
		
		<h2>포워드로 페이지 이동</h2>
		<%
			/*
			절대 경로로 지정시]
			포워드 방식 : 컨텍스트 루트 제외
			리다이렉트 방식 : 컨텍스트 루트 반드시 포함
			단,server.xml에서 context태그의 path속성을 빈문자열로 지정시에는 신경 안써도 된다.
			*/
			//request.getRequestDispatcher("/InnerObjectScope04/ApplicationScopeResult.jsp").forward(request, response);
			//내용은 result url은 index why? 포워드
		%>
		<h2>리다이렉트로 페이지 이동</h2>
		<%
			response.sendRedirect(request.getContextPath()+"/InnerObjectScope04/ApplicationScopeResult.jsp");
			//컨텍스트 루트 꼭 써야한다,!
			//내용 result, url 모두 result why? 리다이렉트
		%>
	</fieldset>

</body>
</html>