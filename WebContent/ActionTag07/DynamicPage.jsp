<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<fieldset>
		<legend>페이지를 선택해서 동적으로 페이지 포함하기</legend>
		<form>
			<select name="pageName">
				<option value="">페이지를 선택하세요</option>
				<option value="DirectivePage.jsp">DirectivePage.jsp</option>
				<option value="ActionTagPage.jsp">ActionTagPage.jsp</option>
			</select> <input type="submit" value="페이지 선택" />
		</form>
	</fieldset>
		<%
		String pageName = request.getParameter("pageName");
		if(pageName != null && pageName.length()!=0){
		%>
		<jsp:include page="<%=pageName %>"/>
		<%} %>
	<fieldset>
		<legend>계절에 따른 페이지 변환</legend>
		<%
			String season;
			SimpleDateFormat dataFormat = new SimpleDateFormat("MM");
			String dataString = dataFormat.format(new Date());
			out.println(dataString);
			switch(dataString){
			case "03":
			case "04":
			case "05":
				season="Spring.jsp";
				break;	
			case "06":
			case "07":
			case "08":
					season="Summer.jsp";
					break;	
			case "09":
			case "10":
			case "11":
					season="Autumn.jsp";
					break;
			default:
				season="Winter.jsp";
				break;
			}
		
			
		%>
		<jsp:include page="<%=season %>"/>
	</fieldset>
</body>
</html>