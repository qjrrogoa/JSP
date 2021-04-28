<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 
JSTL사용]
1] WEB-INF / lib폴더에 필요한 jar파일 추가
2] taglib지시어를 JSP페이지에 추가.
 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SetTagIndex.jsp</title>
</head>
<body>
	<fieldset>
		<legend>set태그</legend>
		<!-- 
			var속성 : 문자열만
			value속성 : 값(문자열이든 숫자든),표현식,EL식 모두 가능
			scope속성 : 문자열만(
						"page","request","session","application"중 하나)
						"page"가 기본값
		 -->
		 <h2>set태그로 EL에서 사용할 변수 설정</h2>
		 <ul>
		 	<li>value속성에 직접 값 설정 : <c:set var="directvar" value="100"/></li>
		 	<!-- 위 JSTL코드는 아래의 자바코드와 같다 -->
		 	<%--<% pageContext.setAttribute("directvar","100"); --%>
		 	<li>value속성에 EL로 값 설정 : <c:set var="elvar" value="${directvar }"/></li>
		 	<li>value속성에 표현식으로 값 설정 : <c:set var="expvar" value="<%= new java.sql.Date(new Date().getTime()) %>"/></li>
		 	<li>시작태그와 종료 태그사이에 값 설정 : <c:set var="betweenvar"><h3>시작태그와 종료태그</h3>사이에 값 설정</c:set></li>
		 </ul>
	</fieldset>
	
	<fieldset>
		<legend>set태그로 설정한 값 출력하기</legend>
		<h2>스크립팅 요소(자바코드)로 출력해보자</h2>
		<ul>
			<li>directvar:<%=pageContext.getAttribute("directvar") %></li>
			<li>elvar:<%=pageContext.getAttribute("elvar") %></li>
			<li>expvar:<%=pageContext.getAttribute("expvar") %></li>
			<li>betweenvar:<%=pageContext.getAttribute("betweenvar") %></li>
		</ul>
		
		<h2>EL로 출력해보자</h2>
		<ul>
			<li>directvar:${directvar }</li>
			<li>elvar:${elvar }</li>
			<li>expvar:${expvar }</li>
			<li>betweenvar:${betweenvar }</li>
		</ul>
	</fieldset>
	
	<fieldset>
		<legend>set태그로 각 영역에 객체 저장</legend>
		<c:set var="pagevar" value="페이지 영역"/>
		<c:set var="requestvar" value="리퀘스트 영역" scope="request"/>		
		<c:set var="sessiontvar" value="세션 영역" scope="session"/>		
		<c:set var="applicationvar" value="어플리케이션 영역" scope="application"/>		
	
	<h2>스크립팅 요소(자바코드)로 출력해보자</h2>
		<ul>
			<li>pagevar:<%=pageContext.getAttribute("pagevar") %></li>
			<li>requestvar:<%=request.getAttribute("requestvar") %></li>
			<li>sessionvar:<%=session.getAttribute("sessionvar") %></li>
			<li>applicationvar:<%=application.getAttribute("applicationvar") %></li>
		</ul>
		
		<h2>EL로 출력해보자</h2>
		<ul>
			<li>pagevar:${pagevar }</li>
			<li>requestvar:${requestvar }</li>
			<li>sessionvar:${sessionvar }</li>
			<li>applicationvar:${applicationvar }</li>
		</ul>
	</fieldset>
	
	<fieldset>
		<legend> set태그로 자바빈 객체 설정 </legend>
		<h2>기본 생성자로 생성</h2>
		<c:set var="defaultmember" value="<%=new MemberDTO() %>" scope="request" />
		
		<h2>스크립팅 요소(자바코드)로 출력해보자</h2>
		<ul>
			<li>아이디 : <%=((MemberDTO)request.getAttribute("defaultmember")).getId() %></li>
			<li>비번 : <%=((MemberDTO)request.getAttribute("defaultmember")).getPwd() %></li>
			<li>이름 : <%=((MemberDTO)request.getAttribute("defaultmember")).getName() %></li>
		</ul>
		
		<h2>EL로 출력해보자</h2>
		<ul>
			<li>아이디 : ${defaultmember.id} </li>
			<li>비번 : ${defaultmember.pwd} </li>
			<li>이름 : ${defaultmember.name} </li>
		</ul>
		
		<h2>인자 생성자로 생성</h2>
		<c:set var="argsmember" value='<%=new MemberDTO("KIM","1234","김길동",null,null) %>' scope="request" />
		
		<h2>스크립팅 요소(자바코드)로 출력해보자</h2>
		<ul>
			<li>아이디 : <%=((MemberDTO)request.getAttribute("argsmember")).getId() %></li>
			<li>비번 : <%=((MemberDTO)request.getAttribute("argsmember")).getPwd() %></li>
			<li>이름 : <%=((MemberDTO)request.getAttribute("argsmember")).getName() %></li>
		</ul>
		
		<h2>EL로 출력해보자</h2>
		<ul>
			<li>아이디 : ${argsmember.id} </li>
			<li>비번 : ${argsmember.pwd} </li>
			<li>이름 : ${argsmember.name} </li>
		</ul>
		
		
		<!-- 
	      set태그의 target속성과 property속성은
	      자바빈 객체나 컬렉션계열 객체 설정할때 사용할 수 있는 속성.
	      
	      ※target속성:반드시 EL식이나 표현식만 가능
	       property속성:값,표현식,EL식 모두 가능.
	       자바빈 인 경우-속성명(멤버변수명)
	       Map컬렉션 - 키값     
	      
	      ※scope속성은 var속성을 지정한 태그에서만 설정 가능
	    -->
	    
	    <!-- 
		    target과 property를 사용해서
		    자바빈이나 컬렉션에 값을 설정할때는
		    var속성을 지정하면 안된다.
	    -->
	    
	    <!-- 
	     	target속성과 property속성을 이용해서
	        자바빈 객체의 속성값 설정
	    -->
	     
	      <!-- setId랑 똑같다 -->
	     <!-- scope 지정 못한다 왜냐? 이미 defaultmember 만들어줄때 scope 사용 -->
	     <c:set target="${defaultmember}" property="id" value="PARK"/>
	     <c:set target="${defaultmember}" property="pwd" value="1234"/>
	     <c:set target="${defaultmember}" property="name" value="박길동"/>
	     <h4>target속성과 property속성으로 값 설정 후 EL로 출력</h4>
	     <ul>
			<li>아이디 : ${defaultmember.id} </li>
			<li>비번 : ${defaultmember.pwd} </li>
			<li>이름 : ${defaultmember.name} </li>
		</ul>
	     
	     <%
	     	//리스트 계열 컬렉션
	     	List list = new Vector();
	     	list.add(request.getAttribute("defaultmember"));
	     	list.add(request.getAttribute("argsmember"));
	     %>
	    <!--  list를 target으로 못 써서 EL값으로 변경 해줘야한다. -->
	    <c:set var="list" value = "<%=list %>" scope="request"/>
	    <h4>속성 값 변경 전 출력</h4>
	    <ul>
	    	<li>아이디 : ${requestScope.list[0].id }</li>
	    	<li>비번 : ${list[0].pwd }</li>
	    	<li>이름 : ${list[0].name }</li>
	    </ul>
	    
	    <h4>target 및 property속성으로 값 변경</h4>
	    <c:set target="${list[0] }" property="id" value="KOSMO"/>
	    <c:set target="${list[0] }" property="pwd" value="777"/>
	    <c:set target="${list[0] }" property="name" value="한소인"/>
	    
	    <h4>속성 값 변경 후 출력</h4>
	    <ul>
	    	<li>아이디 : ${requestScope.list[0].id }</li>
	    	<li>비번 : ${list[0].pwd }</li>
	    	<li>이름 : ${list[0].name }</li>
	    </ul>
	    
	    <%
	    	//맵 계열 컬렉션
	    	Map map = new HashMap();
	    	map.put("default",request.getAttribute("defaultmember"));
	    	map.put("args",request.getAttribute("argsmember"));	    
	    %>
	    <c:set var="map" value="<%=map %>" scope="request"/>
	  	<!--  default는 EL 예약어다 그래서 .으로 접근 못하고 []로 접근 가능!!! -->
	    <ul>
	    	<li>아이디 : ${requestScope.map["default"].id }</li>
	    	<li>비번 : ${map["default"]["pwd"] }</li>
	    	<li>이름 : ${map["default"].name }</li>
	    </ul>
	    
	    <h4>target 및 property 속성으로 값 변경</h4>
	    <c:set target="${map['default'] }" property="id" value="KOSMO2"/>
	    <c:set target="${map['default'] }" property="pwd" value="0000"/>
	    <c:set target="${map['default'] }" property="name" value="한소인2"/>
	    
	    <ul>
	    	<li>아이디 : ${requestScope.map["default"].id }</li>
	    	<li>비번 : ${map["default"]["pwd"] }</li>
	    	<li>이름 : ${map["default"].name }</li>
	    </ul>
	</fieldset>
	
	<jsp:forward page="SetTagResult.jsp">
			<jsp:param value="android" name="subject"/>
	</jsp:forward>
</body>
</html>