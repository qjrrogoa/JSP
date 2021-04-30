<%@page import="java.io.IOException"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   request.setCharacterEncoding("UTF-8");
   /*
      2]파일 업로드를 위한 MultipartRequest객체 생성
       ※MultipartRequest객체 생성만으로 파일 업로드가 이루어짐
      
      MultipartRequest(
       javax.servlet.http.HttpServletRequest request,
       java.lang.String saveDirectory,
       int maxPostSize,
       java.lang.String encoding,
       FileRenamePolicy policy) 
       
       ※MultipartRequest 객체 생성시, 
         최대 업로드 용량 초과시에는 예외 발생
      */
      String saveDirectory = application.getRealPath("/Upload");
      //out.println(saveDirectory);
      int maxPostSize = 1024*500;
      String encoding = "UTF-8";
      FileRenamePolicy policy = new DefaultFileRenamePolicy();
      MultipartRequest mr = null;
      String name = null;
      String title = null;
      String inter = null;
      File file1=null;
      File file2=null;
      try{
         mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding,policy);
         
         name = mr.getParameter("name");
         title = mr.getParameter("title");
         inter = Arrays.toString(mr.getParameterValues("inter"));
         file1 = mr.getFile("attachedFile1");
         file2 = mr.getFile("attachedFile2");
      }
      catch(IOException e){
         request.setAttribute("error", "최대파일 용량초과");
         request.getRequestDispatcher("UploadForm.jsp").forward(request, response);
      }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UploadComplete.jsp</title>
</head>
<body>
   <fieldset>
      <legend>파일 업로드 결과</legend>
      <h2>type="file" 요소를 제외한 폼 요소들</h2>
      <ul>
         <li>이름:<%=name %> </li>
         <li>제목:<%=title %> </li>
         <li>관심사:<%=inter %> </li>
      </ul>
      <h2>업로드된 파일관련 정보</h2>
      <h3>첫번째 파일</h3>
      <ul>
         <li>원본 파일명 :<%=mr.getOriginalFileName("attachedFile1") %> </li>
         <li>실제 파일시스템에 저장된 파일명 :<%=mr.getFilesystemName("attachedFile1") %> </li>
         <li>컨텐츠 타입 :<%=mr.getContentType("attachedFile1") %> </li>
         <li>파일크기 :<%=(int)Math.ceil(file1.length()/1024.0) %> KB </li>
         <%
            String filename =file1.getName();
            String ext= filename.substring(filename.lastIndexOf(".")+1);
            if(ext.equalsIgnoreCase("JPG")||ext.equalsIgnoreCase("JPG")){
          %>
          
          <li><img alt="이미지" src="<c:url value='/Upload'/>/"<%=filename %> style="width:200px;height:200px"/> </li>
          
          <%} %>
      </ul>
      <h3>두번째 파일</h3>
      <ul>
         <li>원본 파일명 :<%=mr.getOriginalFileName("attachedFile2") %> </li>
         <li>실제 파일시스템에 저장된 파일명 :<%=mr.getFilesystemName("attachedFile2") %> </li>
         <li>컨텐츠 타입 :<%=mr.getContentType("attachedFile2") %> </li>
         <li>파일크기 :<%=(int)Math.ceil(file2.length()/1024.0) %> KB </li>
         <%
            filename =file2.getName();
            ext= filename.substring(filename.lastIndexOf(".")+1);
            if(ext.equalsIgnoreCase("JPG")||ext.equalsIgnoreCase("PNG")){
          %>
          
          <li><img alt="이미지" src="<c:url value='/Upload'/>/<%=filename %>" style="width:200px;height:200px"/> </li>
          
          <%} %>
      </ul>
   </fieldset>

</body>
</html>