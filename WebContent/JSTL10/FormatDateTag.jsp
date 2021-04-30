<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FormatDateTag.jsp</title>
</head>
<body>
	<fieldset>
		<legend>국제화 태그 : formatDate 태그</legend>
		<c:set var="today" value="<%=new Date() %>"/>
		<!--  반드시 java.util.Date -->
		
		<!-- 
			value는 필수속성, 단 날짜타입이 와야됨
			type은 기본값: date (time,both속성 있다.)
			dateStyle 기본값 : default
		 -->
		 <h2>필수 속성만 사용</h2>
		 <h4>EL로 출력</h4>
		 	\${today } : ${today }
		 
		 <h4>JSTL의 formatDate태그로 출력</h4>
		 <!-- 필수 속성만,, -->
		 <h4>type="date"(디폴트)</h4>		  
		 <fmt:formatDate value="${today }" type="date" dateStyle="short"/><br/>
		 
		 <h4>type="date"(디폴트) , dateStyle="short"</h4>		 
		 <fmt:formatDate value="${today }" dateStyle="short"/><br/>

		 <h4>type="date"(디폴트) , dateStyle="medium"</h4>	
		 <!-- 디폴트값과 똑같다. -->	 
		 <fmt:formatDate value="${today }" dateStyle="medium"/><br/>
		 
		 <h4>type="date"(디폴트) , dateStyle="long"</h4>		 
		 <fmt:formatDate value="${today }" dateStyle="long"/><br/>

		 <h4>type="date"(디폴트) , dateStyle="full"</h4>		 
		 <fmt:formatDate value="${today }" dateStyle="full"/><br/>
		 
		 <h4>type="time" 나머지 (디폴트)</h4>
		 <fmt:formatDate value="${today }" type="time" timeStyle="default"/><br/>
		 
		 <h4>type="time", dateStyle="short"</h4>
		 <fmt:formatDate value="${today }" type="time" timeStyle="short"/><br/>
		 
		 <h4>type="time", dateStyle="medium"</h4>
		 <fmt:formatDate value="${today }" type="time" timeStyle="medium"/><br/>
		 
		 <h4>type="time", dateStyle="long"</h4>
		 <fmt:formatDate value="${today }" type="time" timeStyle="long"/><br/>
		 
		 <h4>type="time", dateStyle="full"</h4>
		 <fmt:formatDate value="${today }" type="time" timeStyle="full"/><br/>
		 
		 <h2>pattern 속성 - type속성 의미없다. (주로 사용)</h2>
		 <fmt:formatDate value="${today }" pattern="yyyy-MM-dd a HH:mm:ss"/><br/>

		 <fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일"/><br/>
		 
		 <fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일 HH시 입니다."/><br/>
		 
		 <fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일 EEEE"/><br/>
		 
		 <h2>var속성 지정해서 원하는 위치에 출력</h2>
		 <fmt:formatDate value="${today }" pattern="yyyy년 MM월 dd일 EEEE" var="promise"/><br/>
		 
		 <h4>아래에 출력</h4>
		 모임 날짜는 <span style="color:red;font-size:1.5em">${promise }</span>입니다.
		 
	</fieldset>
</body>
</html> 