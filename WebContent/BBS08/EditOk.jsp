<%@page import="java.net.URLEncoder"%>
<%@page import="model.BBSDao"%>
<%@page import="model.BBSDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- EditOk.jsp -->
<%
	//1]한글처리
	request.setCharacterEncoding("UTF-8");
	//2]파라미터 받기
	String title = request.getParameter("title");
	String content = request.getParameter("content");	
	String no = request.getParameter("no");
	
	//현재 페이지번호 받기
	String nowPage = request.getParameter("nowPage");
	/*
	searchWord를 한글로 검색후 수정시 주의 사항
	sendRedirect()메소드로 쿼리스트링 연결시 한글 깨짐
	해결책:
	1.검색어를  URLEncoder.encode()
	  단,검색후 총 레코드 수 구할때는 인코딩하지 않는 검색어 전달
	2.수정 완료후 뷰로 이동시 뷰(View.jsp)에서는 URLDecoder.decode()해야 한다
	
	단,form태그로 이동시에는  URL 인코딩 및 디코딩 불필요
	*/
	
	//검색과 관련된 파라미터 받기]
	String searchColumn = request.getParameter("searchColumn");
	String searchWord   = URLEncoder.encode(request.getParameter("searchWord"),"UTF-8") ;	
	System.out.println("searchWord:"+searchWord);
	//3]데이타를 전달할 DTO객체 생성및 데이타 설정
	BBSDto dto = new BBSDto(no,null,title,content,null,null);
	//4]CRUD작업용 DAO계열 객체 생성
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	int affected=dao.update(dto);
	if(affected ==1){
		response.sendRedirect(String.format("View.jsp?searchColumn=%s&searchWord=%s&no=%s&nowPage=%s",searchColumn,searchWord,no,nowPage));
	%>
		<!--  
		<form action="View.jsp">
			<input type="hidden" name="no" value="<%=no%>"/>
			<input type="hidden" name="searchColumn" value="<%=searchColumn%>"/>
			<input type="hidden" name="searchWord" value="<%=searchWord%>"/>
			<input type="hidden" name="nowPage" value="<%=nowPage%>"/>		
		</form>	
		<script>
			document.forms[0].submit();
		</script>
		-->
	<%
	}
	else{%>
	<script>
		alert("수정 실패했어요");
		history.back();
	</script>
	<%
	}//else
%>