<%@page import="model.PagingUtil"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ELError.jsp</title>
</head>
<body>
 
	<fieldset >
		<legend>EL에서 에러가 나거나 혹은 에러는 안나지만 출력이 안된느 경우</legend>
		<h2> + 를 숫자형식이 아닌 문자열에 적용시(에러)</h2>
		<ul>
			<li>\${"100" + 100 }[정상] : ${"100" + 100 }</li>
			<li>\${"백" + 100 }[500에러] : \${"백" + 100 }</li>
			<li>\${"HELLO" + ' HI' }[500에러] : \${"HELLO" + ' HI'}</li>
		</ul>
		<h2>.인덱스  형식으로 배열이나 리스트계열 컬렉션의 요소에 접근시(에러)</h2>
		<%
			String[] mountains ={"설악산","소백산","비슬산","덕유산"};
			out.println(mountains[0]+"<br/>");
			List collection = Arrays.asList(mountains);
			out.println(collection.get(0));
		%>
		<c:set var="mountains" value="<%=mountains %>"  />
		
		<c:set var="collection" value="<%=collection %>"/>
		<ul>
			<li>\${mountains[0]}[정상] : ${mountains[0]}</li>
			<li>\${collection[0]}[정상] : ${collection[0]}</li>
			<li>\${mountains.0}[에러] : \${mountains.0}</li>
			<li>\${collection.0}[에러] : \${collection.0}</li>
		</ul>
		<h2>배열이나 리스트계열 컬렉션의 인덱스를 벗어난 경우(에러 NO,출력 NO)</h2>
		<ul>
			<li>\${mountains[4]} : ${mountains[4]}</li>
			<li>\${collection[4]} : ${collection[4]}</li>
		</ul>
		<h2>없는 속성이거나 속성은 존재하지만 getter가 없는 경우(에러)-자바빈의 경우</h2>
		<c:set var="member" value='<%=new MemberDTO("KIM","1234","김길동",null,null) %>'/>
		<ul>
			<li>없는 속성 접근[PropertyNotFoundException에러발생] : \${member.addr}</li>
			<li>속성은 존재,getter없는 경우(에러) : ${member.id }</li>
			<li>EL변수명이 틀린 경우(에러 NO,출력 NO) : ${membar.id }</li>
		</ul>
		<h2>EL 내장객체의 없는 속성으로 접근시</h2>
		<!-- 
  		EL의 내장객체중 사용자가 정의한 속성에 접근하는 
		내장객체(xxxxScope계열/param계열등) 및 맵 컬렉션인 경우, 
		존재하지 않은 속성이나 키값으로 접근시 null임으로 에러는 안나고 출력만 안됨
  	 	-->
  	 	\${null } : ${null }
  	 	<%
  	 		request.setAttribute("myrequest","리퀘스트 영역");
  	 		Map map = new HashMap(); 	 	
  	 		map.put("mymap","맵 컬렉션");
  	 	%>
  	 	
  	 	<c:set var="map" value="<%=map %>"/>
  	 	<ul>
  	 		<li>\${requestScope.myrequest }[정상] : ${requestScope.myrequest }</li>
  	 		<li>\${requestScope.yourrequest }[에러 NO,출력 NO] : ${requestScope.yourrequest }</li>
  	 		<li>\${map.mymap }[정상] : ${map.mymap }</li>
  	 		<li>\${map.yourmap }[에러 NO,출력 NO] : ${map.yourmap }</li>
  	 		<li>\${pageContext.noproperty }[에러] : \${pageContext.noproperty }</li>
  	 	</ul>
  	 	<h2>숫자를 0으로 나누면 Infinity</h2>
  	 	\${100/0 } : ${100/0 }
  	 	<h2>임의의 변수로 .을 통해서 접근시-에러 NO,출력 NO</h2>
  	 	\${mum } : ${mum }<br/>
  	 	\${mum.num } : ${mum.num }
	</fieldset>
</body>
</html>