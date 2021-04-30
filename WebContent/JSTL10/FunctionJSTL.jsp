<%@page import="java.util.HashMap"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunctionJSTL.jsp</title>
</head>
<body>
	<fieldset>
		<legend> JSTL의 함수 라이브러리 </legend>
		<!-- 
			JSTL에서 제공하는 함수들은 EL에서 호출해야한다
				호출방법 : \${접두어 : 함수명([매개변수들])}
			JSTL의 모든 함수는 항상 값을 반환한다.
		 -->
		 <!-- 데이터 준비 -->
		 <% String[] mountains={"한라산","성인봉","태백산","덕유산"}; %>
		 <fmt:formatDate value="<%=new Date() %>" pattern="yyyy년 M월 dd일" var="today"/>
		 <c:set var="todayString">Today는 ${today }입니다.</c:set>
		 <c:set var="interString">Polities,Economics,Entertainments</c:set>
		 <c:set var="array" value="<%=mountains %>"/>
		 <c:set var="collection" value="<%= new HashMap() %>"/>
		 <c:set target="${collection }" property="uesr" value="KOSMO"/>
		 <c:set target="${collection }" property="pass" value="1234"/>
		 <h2>int length(Object)</h2>
		 
		 <!-- 
		 	문자열인 경우는 문자열의 길이 반환
		 	(한글 1자도 길이 1로 처리)
		 	배열인 경우는 배열의 크기(즉 메모리 개수) 반환
		 	컬렉션인 경우는 컬렉션에 저장된 객체의 수 반환
		  -->
		  <ul>
			  <li>문자열의 길이 : ${fn:length(todayString)}</li>
			  <li>배열의 길이 : ${fn:length(array)}</li>
			  <li>컬렉션의 객체의 수 (JSTL함수 이용) : ${fn:length(collection)}</li>
			  <li>컬렉션의 객체의 수 (EL함수 이용) : ${collection.size()}</li>
		  </ul>
		  <h5>컬렉션에 저장된 객체 여부 판단 : JSTL함수 이용</h5>
		  <c:if test="${fn:length(collection) != 0 }" var="result">
				<c:forEach var="item" items="${collection }">
					${item.key} : ${item.value }<br/>
				</c:forEach>	  
		  </c:if>
		  <c:if test="${!result }">
		  		저장된 객체가 없어요
		  </c:if>
		  
		  <h5>컬렉션에 젖아된 객체 여부 판단 : EL함수 이용</h5>
		  <c:if test="${collecion.size() != 0 or not empty collection }" var="result">
		  		<c:forEach var="item" items="${collection }">
					${item}<br/>
				</c:forEach>	
		  </c:if>
		   <c:if test="${!result }">
		  		저장된 객체가 없어요
		  </c:if>
		  
		  
		  <h2>String substring(문자열,시작인덱스,끝인덱스)</h2>
		  <!-- 
		  	문자열에서 시작인덱스부터 끝인덱스 -1까지 추출,
		  	끝인덱스가 -1인 경우 시작인덱스부터
		  	문자열 끝까지 추출
		  	인덱스느 0부터 시작
		   -->
		  <ul>
			  <li>${todayString }</li>
			  <li>${fn:substring(todayString,0,5) }</li>
			  <li>날짜 부분부터 끝까지</li>
			  <li>${fn:substring(todayString,7,-1) }</li>
		  </ul>
		  
		  <h2>String substringAfter(문자열,str) : str이후의 문자열 반환</h2>
		  "는"이후의 문자열 추출 : ${fn:substringAfter(todayString,"는") }<br/>
		 
		  
		  <h2>String substringBefore(문자열,str) : str이전의 문자열 반환</h2>
		  "는"이전의 문자열 추출 : ${fn:substringBefore(todayString,"는") }<br/>
		  
		  <h2>String replace(문자열,src,dest)</h2>
		  ${fn:replace(todayString,"Today","Tomorrow") }<br/>
		  
		  
		  <h4>방법1</h4>
		  <c:set var="temp" value='${fn:replace(todayString,"Today","Tomorrow") }'/><br/>
	      ${fn:replace(fn:replace(temp,"4","5"),"30","1") }<br/>
		  
		  
		  <h4>방법2</h4>
		  ${fn:replace(fn:replace(todayString,"Today","Tomorrow"),"4월 30일","5월 1일") }<br/>
		  
		  <h2>String trim(String):양쪽 공백 제거</h2>
		  \X${"       J  S  T L   " }Y[트림 적용전] : X${"       J  S  T L      "}Y<br/>
		  \X${fn:trim("       J  S  T L   ") }Y[트림 적용후] : X${fn:trim("       J  S  T L   ") }Y<br/>

		  
		  <h2>boolean startsWith(문자열,str):문자열이 str로 시작하면 true, 아니면 false반환</h2>
		  ${fn:startsWith(todayString,"To") }<br/>
		  <h2>boolean endsWith(문자열,str):문자열이 str로 끝나면 true, 아니면 false반환</h2>
		  ${fn:endsWith(todayString,"입니다.") }<br/>
		  
		  <h2>String[] split(문자열,delim):문자열에서 delim(구분자)로 문자열 분리</h2>
		  \${fn:split(interString,",") } : ${fn:split(interString,",") }<br/>
		  <c:forEach var="item" items='${fn:split(interString,",") }'>
		  	${item }
		  </c:forEach>
		  
		  <h2>String join(배열,str):모든 배열요소를 str로 연결해서 하나의 문자열 반환</h2>
		  ${fn:join(array,'▲') }<br/>
		  
		  <h2>String escapeXml(문자열):HTML태그를 그대로 출력하고자 할 때 </h2>
		  함수 라이브러리 사용 : ${fn:escapeXml("<h3>함수 라이브러리 사용</h3>") }<br/>
		  코어 라이브러리 사용 : <c:out value="<h3>함수 라이브러리 사용</h3>" escapeXml="false"/>
		  
		  <h2>int indexOf(str1,str2):str1에서 str2의 인덱스 위치 반환</h2>
		  ${fn:indexOf(todayString,"Day") }<br/>
		  ${fn:indexOf(todayString,"day") }<br/>
		  
		  <h2>boolean contains(str1,str2):str1에서 str2가 포함되었으면 true,아니면 false반환</h2>
		  ${fn:contains(todayString,"Day") }<br/>
		  ${fn:contains(todayString,"day") }<br/>
		  
		  <h2>boolean containsIgnoreCase(str1,str2):대소문자 구분하지 않고 str1에서 str2가 포함되었으면 true,아니면 false반환</h2>
		  ${fn:containsIgnoreCase(todayString,"Day") }<br/>
		  ${fn:containsIgnoreCase(todayString,"day") }<br/>
		  
		  <h2>String toUpperCase(str) 및 String toLowerCase(str)</h2>
		  대문자로 변경 : ${fn:toUpperCase(interString) }<br/>
		  소문자로 변경 : ${fn:toLowerCase(interString) }<br/>
		  
	</fieldset>
</body>
</html>