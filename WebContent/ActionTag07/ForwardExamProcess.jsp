<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1]파라미터 받기
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	//2]아뒤가 KIM이고 비번이 1234인 경우 회원이라고 가정
	//  회원인 경우 로그인 처리
	//  로그인 처리후 "액션태그"를 이용해서 ForwardExamMyPage.jsp
	//  로 포워드 하여라.
	//  ForwardExamMyPage.jsp에서 아이디와 비번 출력하고
	//  로그아웃 처리하여라.
	if("KIM".equals(user.trim()) && "1234".equals(pass.trim())){//회원
		//1.로그인 처리]-세션영역에 속성(주로 식별자만) 저장
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_PWD", pass);
		//2.로그인 처리후 마이 페이지로 이동]
	%>
	<jsp:forward page="ForwardExamMyPage.jsp"/>
	
	<%	
	}

	//3]비회원인 경우는 리퀘스트 영역에 "회원이 아닙니다"라는
    //  에러메시지를 저장하고 다시 로그인 페이지로 
    //  "액션태그"를 이용해서 포워드 하여라
    //  또한 포워드시 사용자가 입력한 아이디 와 비번을 그대로
    //  input태그에 출력하여라
    else{//아이디 비번 불일치
		//리퀘스트 영역에 필요한 데이터 저장]
		request.setAttribute("error","회원이 아닙니다");
		//로그인 페이지로 포워드]
	%>
	<jsp:forward page="ForwardExamLogin.jsp"/>
	<%
	}
%>