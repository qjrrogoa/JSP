<%@page import="java.util.Map"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.BBSDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Delete.jsp -->
<%
	//1]파라미터 받기
	String no = request.getParameter("no");
	//현재 페이지번호 받기
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	//검색과 관련된 파라미터 받기]
	String searchColumn = request.getParameter("searchColumn");
	String searchWord   = URLEncoder.encode(request.getParameter("searchWord"),"UTF-8") ;	
	
	Map map = new HashMap();
	String queryString="";
	if(searchColumn !=null){
		queryString=String.format("searchColumn=%s&searchWord=%s&", searchColumn,searchWord);
		map.put("searchColumn",searchColumn);
		//인코딩 하지 않는 검색어 전달
		map.put("searchWord",request.getParameter("searchWord"));
	}
	
	//2]CRUD작업용 DAO계열 객체 생성
	BBSDao dao = new BBSDao(application,"JSP","JSP");
	int affected = dao.delete(no);
	//마지막 레코드 삭제시 페이지가 하나 줄어드는 경우 코딩 시작]	
	int totalRowCount = dao.getTotalRowCount(map);
	int pageSize =  Integer.parseInt(application.getInitParameter("PAGE_SIZE"));
	int totalPage = (int)Math.ceil((double)totalRowCount/pageSize);
	if(totalPage < nowPage) nowPage=totalPage;
	
	//마지막 레코드 삭제시 페이지가 하나 줄어드는 경우 코딩 끝]
	dao.close();
	if(affected==1)
		response.sendRedirect("List.jsp?"+queryString+"nowPage="+nowPage);
	else{
		out.println("<script>");
		out.println("alert('삭제 실패했어요');");
		out.println("history.back();");
		out.println("</script>");
	}


%>