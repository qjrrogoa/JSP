<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="IncludePage.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>DivLayout12.html</title>
    <link href="../Styles/divLayout.css" rel="stylesheet"/>
</head>
<body>
    <div class="allWrap">
        <div class="partWrap">
            <!-- 탑메뉴 및 로고 감싸는 div 시작 -->
            <div class="header"> 
                <div class="logo"><img src="../Images/kosmo.jpg" alt="회사 로고 이미지"/></div>
                <div class="topMenu">
                    <%@ include file="/Template/Top.jsp" %>
                    
                </div>
            </div>
            <!-- 탑메뉴 및 로고 감싸는 div 끝 -->
            <!--Left메뉴 및 실제 내용 감싸는 div시작-->
            <div class="section">
                <div class="leftMenu">
                    <%@ include file="/Template/Left.jsp"%>    
                </div>
                <div class="body">
                    <div class="content">
                        <h2>메인 페이지</h2>
                       	현재 페이지명 : <%=currentPage%>
                    </div>
                </div>
            </div>
            <!--Left메뉴 및 실제 내용 감싸는 div끝-->
            <!--footer를 감싸는 div 시작-->
            <div class="footer">
                <%@ include file="/Template/Footer.jsp" %>
            </div>
            <!--footer를 감싸는 div 끝-->

        </div>
    </div>
</body>
</html>