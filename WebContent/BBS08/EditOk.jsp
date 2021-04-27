<%@page import="model.BBSDao"%>
<%@page import="model.BBSDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- EditOk.jsp -->
<%
	//1] 한글처리
	request.setCharacterEncoding("UTF-8");
	//2] 파라미터 받기
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	//작성자의 아이디 얻기 : 세션영역에서
	String no = request.getParameter("no");
	//3] 데이터를 전달할 DTO객체 생성 및 데이터 설정
	BBSDto dto = new BBSDto(no, null, title,content,null,null);
	//4]CRUD작업용 DAO 계열 객체 생성
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	int affected = dao.update(dto);
	if(affected == 1){
		response.sendRedirect("View.jsp?no="+no);
	}
	else{%>
	<script>
		alert("수정 실패했어요.");
		histroy.back();
	</script>
	<%
	}
%>