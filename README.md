# JSP

# Scripting02
<%! %>
---
    스크립틀릿 
    선언부에 작성한 자바코드는 서블릿으로 변환시 Class안에 생성됨.
    즉 멤버변수나 멤버메서드 혹은 상수등을 선언부에서 선언함.
    하지만 선언한 멤버들은 내장객체를 바로 사용할 수 없다.
    
    내장객체를 사용 할 수 있는 방법2가지
    방법1]
    멤버변수 선언
    	JspWriter out;
	
    방법2]
    매개변수로 전달 받는다.
    void showMessage(String message,JspWriter out)
<%= %>
---
    표현식은 _jspService()메서드 안에서 out.print("EXPRESSION");로 변환 됨
    
<% %>
---
    자바코드나 쟈스를 사용할 수 있다.

# JDBC 연결 방법
    
    변수 설정]
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement psmt;
    
    1] 드라이브 로딩
    Class.forName("oracle.jdbc.OracleDriver")
    
    2] 데이터베이스 연결
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhose:1521:xe","system","kosmo1234");
    
    3] SQL문 작성
    String sql = "select * from member";
    
    4] SQL문 연결
    psmt = conn.prepareStatement(sql);
    
    5] SQL문 실행
    rs = psmt.executeQuery();
  
    6] 자원 반납용 메서드 만들기
    public void close() {
		try {
			if(rs != null)
				rs.close();
			if(psmt != null)
				psmt.close();
			if(conn != null)
				conn.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}//// close
    
    	rs.getInt(1)
        반환값 첫번째 컬럼 수! 	
	
# InnerObject03
1] REQUEST객체
--- 
	전송방식 : <%=request.getMethod() %></li>
	전체 URL : <%=request.getRequestURL() %></li>
	도메인을 제외한 URI : <%=request.getRequestURI() %></li>
	요청 프로토콜 : <%= request.getProtocol() %></li>
	요청 서버명 : <%=request.getServerName() %></li>
	요청 서버 포트 : <%=request.getServerPort() %></li>
	클라이언트의 IP주소 : <%=request.getRemoteAddr() %>
	클라이언트의 IP주소 : <%=request.getRemoteHost() %>
	요청과 관련된 세션객체 얻기(서블릿에서 사용-로그인 처리시) <%=request.getSession() %> </li>
	세션 내장객체 : <%=session %>
	Context Path(프로젝트명) : <%=request.getContextPath() %>
		
	파라미터값 한 개 일때 
	request.getParameter("파라미터 값")
	
	파라미터값 여러 개 일때(checkbox)
	request.getParameterValues("파라미터 값")
	String[] inters = request.getParameterValues("inter");
	String inter ="";
	for(String values:inters)
		inter += values;

	맵으로 모든 파라미터값 받기
	Map(String,String[]) params = request.getParameterMap();
	Set<String> paramNames = params.KeySet();
	for(String paramName:paramNames){
		if(paramName.equals("inter")){
			String[] inters=request.getParameterValues(paramName);
			String paramValues="";
			for(String code:inters) paramValues+=codeToValue(code)+ " ";
			out.println("<li>"+paramName+":"+paramValues+"</li>");
		}
		else{
			String paramValue= request.getParameter(paramName);
			out.println("<li>"+paramName+":"+paramValue+"</li>");
		}	
	}
	
	
2] JSP문과 자바스크립트 같이 사용하기
---
	<% 
		if(!"POST".equlas(request.getMethod())){
	%>
		<script>
			alert("잘못된 접근입니다.");
			history.back(); 혹은 out.println("location.replace(\"ResponseForRedirectIndex.jsp\");");

		</script>
	<%
		}
		return;
	%>
3] OUT
---
	<%
	out.println("A");
	out.flush();
	out.println("B");
	out.clearBuffer();
	out.println("C");
	%>
	
	출력값
	A
	C
	
	out.print와 out.println 둘 다 똑같이 보여지지만 소스 검사를 할 때 println이 훨씬 깔끔하게 보여진다.

4] pageContext 내장객체로 request 내장객체 사용하기
---
	🔥request.getMethod()
	=
	(ServletRequest > HttpServletRequest 상속 계층도)
	ServlertRequest req = pageContext.getRequest();
	String method = ((HttpServletRequest)req).getMethod();
	
	잘 사용안한다,, 그래도 알고 있자,
	
# InnerObjectScope04

1] pageContext
---
	XX자료형.getAttribute(String형) 반환값은 Object다.
	XX자료형.getParameter(String형) 반환값은 String이다.
	
	내가 생성한 자료형으로 getAttribute값을 얻으려면 변수에 담아야한다.
	
	MemberDTO형에 담는 방법 2가지	
	방법1]
	Object object = pageContext.getAttribute("String")
	if(object instanceOf MemberDTO){
		MemberDTO dto = (MemberDTO)object;
		firstMemberString=String.format("이름:%s,아이디:%s,비번:%s,나이:%s",
								dto.getName(),
								dto.getId(),
								dto.getPwd(),
								dto.getAge());	
	}
	
	방법2]
	MemberDTO second = (MemberDTO)pageContext.getAttribute("String");
2] request
---
	🔥값을 다른페이지에 보낼 때 값을 공유하는 방법
	포워드, 리다이렉트, 쿼리스트링
	포워드방식:컨텍스트 루트 제외
	리다이렉트 방식:컨텍스트 루트 반드시 포함
	단,server.xml에서 Context태그의 path속성을 빈문자열로 지정시에는 신경 안써도 된다.
	
	포워드 
	request.getRequestDispatcher("페이지").forward(request, response);
	
	
#Cookie05

1] 쿠키 설정하기
	
	<%
	//1] 쿠키 객체 설정하기 new Cookie("쿠키명","쿠키값")
	//쿠키명 설정하는 setName()이 없다 반드시 생성자로 쿠키명 설정
	Cookie cookie = new Cookie("쿠키명","쿠키값");
	
	//2] 쿠키가 적용되는 PATH설정
	cookie.setPath(request.getContextPath()); //"/JSPProj"
	
	//3]쿠키 유효기간 설정 - 초단위
	cookie.setMaxAge(60)
	/*
		유효기간 미 설정시 쿠키는 웹브라우저에 저장됨
		- 웹브라우저 닫을 때 삭제됨

		유효기간 설정시 쿠키는 사용자의 PC에 저장됨.
		- 유효기간이 지나면 자동으로 삭제됨 
	*/

	//4] 생성된 쿠키를 응답헤더에 설정 : addCookie()
	response.addCookie(cookie);
	
	//5] 쿠키값 읽기
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie cook:cookies{
			String name = cook.getName();
			String value = cook.getValue();
			out.println(String.format("%s : %s",name,value));
		}
	}
	%>

# ActionTag07

1] include지시어와 액션태그
---
	1] include 지시어와 액션 태그 비교
	//지시어는 
	표현식 사용 불가, 소스 그대로 해당 위치에 포함됨
	페이지는 현재 페이지와 같은 페이지를 의미
	
	//액션태그
	표현식 사용 가능, JSP컨테이너에 의해 실행된 결과가 해당 위치에 포함됨
	서로 다른 페이지의미, request영역 공유
	
	2] usebean 사용
	<jsp:useBean id="member" class="model.MemberDTO" scope="request"/>
	==
	MemberDTO member = new MemberDTO(); //기본 생성자로 생성한다는 뜻
	
	//값 할당
	<jsp:setProperty name ="member" property="id" value="KIM">
	<jsp:setProperty name ="member" property="pwd" value="9999">
	<jsp:setProperty name ="member" property="name" value="김길동">
	
# 게시판 작성 프로세스
    
    1. DTO, DAO 객체 만들기
    DTO : 데이터를 전송하는 객체로 테이블의 레코드 하나를 저장할 수 있는 자료구조 (BBSDto.java)
    DAO : 데이터에 접근해서 CRUD작업을 수행하는 업무처리 로직을 갖고 있는 객체 (BBSDao.java)
    
    2. 회원 여부 파악하기

	1] 사용자 입력 값 받기 
	- request.getParameter로 값을 받아옴
	
	2] DAO객체 연결하기 (LoginProcess.jsp)
	
	3] DAO객체로 user, pass매개변수 받아 boolean반환하는 메서드 만들기 (LoginProcess.jsp)
	- 파라미터로 받아온 변수를 매개변수에 넣는다.
	
	4] true면 세션에 ID 저장해주고 MyPage.jsp로 이동
	
	5] 실패 시 아이디와 비번 불일치 표시 해주고, 로그인 페이지로 포워드 (Login.jsp)
	
	6] DAO객체 닫기
	
    3. 목록 창 만들기 (List)
    	1] DAO객체 연결하기 (List.jsp)
	
	2] 모든 DAO객체 불러오는 <DTO>타입의 List 컬렉션 매서드 생성 (BBSDao.java)
	
	3] 메서드 호출 (List.jsp)
	
	4] Html문에 스크립팅 요소 사용하여 값 대입
	
	5] DAO객체 닫기
	
    4. 글작성
	1] 글 작성 글자에 a태그 걸어주기 (List.jsp)
	
	2] 제목과 내용을 request.parameter값으로 변수에 담는다. (WriteOk.jsp)
	
	3] 변수를 dto객체를 인스턴스 할 때 생성자에 변수를 담는다. (WriteOk.jsp)
	
	4] dao객체 연결 후 dto를 매개변수 받고 int 반환하는 메서드 (List.jsp)
	- executeUpdate() 메서드 즉 DB에 저장하는 메서드다!!

	5] 메서드 호출 한다.
	- 성공시 List.jsp 호출,
	- 실패시 실패했다는 안내와 history.back();
	
	
    5. 글 상세보기 페이지 만들기 (View) (조회수 얻기 같이,,)

	1] 목록창에서 글 주제를 클릭하면 상세 페이지 이동
	- no를 쿼리스트링 값으로 넘겨준다.

	2] 
   
    
    6. 이전글 다음글

    7. 수정

	1] 필요한 요소 파라미터 얻어오기 (EditOk.jsp)
	
	2] dto 객체 생성 (생성자로는 필요한 값만 넣어주고 나머지는 null)
	- no, title, content

	3] dao 객체 연결 후 dto를 매개변수 받고 int 반환하는 매서드 생성 (List.jsp)
	
	4] 메서드 호출
	- 성공시 View.jsp 호출

    8.

페이징 방법
	
	1. ㅇ

	2. 페이징에 필요한 값들 구하기
	- 총 등록된 글수
	- 한 페이지 보여줄 레코드의 개수
	- 현재 보고 있는 글의 현재 페이지
	- 전체 페이지 수 구하기
		int totalpage = int(Math.ceil((double)totalReocrdCount/pageSize));
		
		int start = (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize
	- 

	3. 글 삭제 순서에 관계없이 순번 구하는 로직

	4. 페이징을 위한 로직

	5. 목록을 누르면 페이지 포함된 페이지로 바로 들어가기

# EL09

1] ELOperator
---
	1] 기본형식
	${}
	
	EL에서 null이 연산에 참여시 0으로 처리된다.
	
	2] param내장객체 
	${param}
	${param.myparam+10}
	${param["myparam"]+10}
	${param['myparam']+10}
	
	3] EL에서는 기본적으로 변수 선언 할 수 없다.
	JSTL로 EL에서 사용할 변수 선언 해야한다.
	1] <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 선언
	2] <c:set var="fnum" value="9"> 
	   <c:set var="snum" value="5">
	   <c:set var="varInScriptlet" value="<%=varInscriptel"%>
	 
	4] EL의 산술 연살자
	${fnum+snum}
	${fnum-snum}
	${fnum*snum}
	${fnum/snum}
	${fnum%snum}
	${fnum div snum}
	${fnum mod snum}
	
	${"100"+100}  // 200
	문자열+숫자 하면 문자열 자동으로 형 변환된다.
	
	${"Hello"+"EL!!!!"} // 에러
	숫자연산에만 사용 가능하다. 문자열 연결시 에러
	
	5] EL의 비교 연산자
	크기 비교 연산자는 compareTo() 메서드로 인식
	equals()메서드 대신 == 사용한다.
	
2] EL의 내장객체
---
	1] setAttribute로 다 값을 주어졌다고 가정
	
	getAttirbute 을 이렇게 사용
	${pageScope.scopeVar}
	${requestScope.scopeVar}
	${sessionScope.scopeVar}
	${applicationScope.scopeVar}
	XXScope는 생략 가능하다, 생략시 가장 작은 영역에 있는 값을 읽어옴.
	
	2] setAttribute로 저장한 값은 EL에서 바로 사용 가능하다,,?
	request.setAttribute("stringObject","문자열 객체")
	${stringObject}

	3] 액션태그 파라미터 값 받기
	<jsp:param value="10" name="first">
	<jsp:param value="5" name="second">
	${param.first + param.second} // 15
	
3] EL의 기타 내장객체
---
	1] EL의 pageContext
	
	EL은 pageContext객체 밖에 없다.
	예를들어 내장객체 메서드를  얻어오려면 
	자바코드
		[1] <%=request.contextPath%>
		[2] <%=session.getMaxInactiveInterval()%>
		[3} <$=request.getSession().getMaxInactiveInterval()%>
		
	EL은 (get제외 해도 됨)
		[1] ${pageContext.request.contextPath} 
		[2] ${pageContext.session.getMaxInactiveInterval}
		[3] ${pageContext.request.session.maxInactiveInterval}
	대신 형 변환은 안해도됨
	
	2] EL의 header
	요청헤더명에 특수문자가 들어가 있는 경우에는 무조건 [] 사용
	${header["user-agent"]}
	${pageContext.request.hederNames}
	
	3] EL의 Cookie
	쿠키값 얻기
	<% 
		Cookie cookie = new Cookie("KOSMO","한소인")
		cookie.setPath(request.getContextPath())
		response.addCookie(cookie)
	%>

	스크립팅으로 만들어진 Cookie값 읽기
	${cookie.쿠키명.value}
	${cookie.KOSMO.value}

	JSTL으 이용해서 쿠키 배열 출력
	<c:forEach var = "cook" items = "${pageContext.request.cookies}"
		%{cook.name} = ${cook.value}<br/>
	</c:forEach>
	
	4] EL의 initParam
	${initparam.ORACLE_URL}
	${initparam["ORACLE_URL"]}
	
	5] EL의 Collection

	<%
	//데이터 준비
	MemberDTO first = MemberDTO("KIM","1234","김길동",null,null);
	MemberDTO second = MemberDTO("LEE","1234","이길동",null,null);
	
	//리스트 계열 준비
	List<MemberDTO> list = new Vector<MemberDTO>();
	list.add(first);
	list.add(second);
	
	//맵 계열 준비
	Map<String,MemberDTO> map = new HashMap<String,MemberDTO>();
	map.put("first",first);
	map.put("second",second);
	%>
	
	//EL로 출력
	<c:set var="elList" value="<%=list%>"/>
	<c:set var="elMap" value="<%=map%>"/>
	
	//JSTL 미사용
	//리스트 계열 켈렉션
	<li> 이름 : ${elList[0].name} 아이디 : ${elList[0].id} 비번 : ${elList[0].pwd} </li>
	<li> 이름 : ${elList[1]["name"]} 아이디 : ${elList[1]["id"]} 비번 : ${elList[1]["pwd"]} </li>
	
	//JSTL 사용
	//리스트계열 컬렉션
	<c:forEach var="item" items="${elList}">
		<li>이름 : ${item.name} 아이디 : ${item.id} 비번 : ${item.pwd}</li>
	</c:forEach>
	
	//맵 계열 컬렉션
	<li> 이름 : ${elMap.first.name} 아이디 : ${elMap.first.id} 이름 : ${elMap.first.pwd} </li>
	<li> 이름 : ${elMap["second"]["name"]} 아이디 : ${elMap["second"]["id"]} 이름 : ${elMap["second"]["pwd"]} </li>
	
	//JSTL 사용
	//맵 계열 컬렉션
	<c:forEach var="item" items="${elMap}">
		<li> ${item.key} - 이름 : ${item.value.name} 아이디 : ${item.value.id} 비번 : ${item.value.pwd}
	</c:forEach>
	
	6] EL의 size()
	<li> ${elList.size()} </li>
	<li> ${elMap.size()} </li>
	
4] EL의 에러
---
	1] +를 숫자형식이 아닌 문자열에 적용시 
	${"백" + 100}
	${"HELLO" + "HI"}
	
	2] 인덱스 형식으로 배열이나 리스트계열 컬렉션의 요소에 접근시(에러)
	//데이터 준비
	<%
	String[] mountains = {"설악산","소백산","비술산","덕유산"}
	%>
	${mountains[0]} // 정상
	${mountains.0} // 에러
	
	3] 배열이나 리스트계열 컬렉션의 인덱스를 벗어난 경우 (에러 NO, 출력 NO)
	${mountains[4]}
	
	4] 없는 속성이거나 속성은 존재하지만 getter가 없는 경우(에러)
	<c:set var="member" value="new MemberDTO("KIM","1234","김길동",null,null)}
	${member.addr} // 에러
	${memb.id} // 에러
	
	5] 내장객체에 없는 속성으로 접근시
	
	6] 숫자를 0으로 나누면 Infinity
	
	7] 임의의 변수로 .을 통해서 접근시 - 에러 NO, 출력 NO

#JSTL10
1] JSTL Set태그
---
	<!--
		🔥
		var 속성 : 문자열만
		value 속성 : 값, 표현식, EL식
		scope 속성 : "page", "request", "session", "application"중 하나
		
		🔥target설정 하려면 반드시 set설정 해줘야한다!!!!
		
		target 속성 : 표현식, EL식. 	  // 컬렉션 사용할 때 사용
		property 속성 : 값, 표현식, EL식 // 컬렉션의 키 값이나 변수 명
	--!>
	
	1] set태그로 EL에서 사용할 변수 설정
	<c:set var="directvar value="100"/> = <% pageContext.setAttribute("directvar","100") %>
	<%=pageContext.getAttribute("directvar")도 가능하다
	
	2] set태그로 자바빈 객체 설정
	<c:set var="defaultmember" value="<%= new MemberDTO()" scope="request" %>/>
	<c:set va="argsmember" value="<%= new MemberDTO("KIM","1234","김길동",null,null) %> scope="request"/>
	
	//EL로 출력
	<li> 아이디 : ${defaultmember.id} </li>
	<li> 비번 : ${defaultmember.pwd} </li>
	<li> 이름 : ${defaultmember.name} </li>
	
	<li> 아이디 : ${argsmember.id} </li>
	<li> 비번 : ${argsmember.pwd} </li>
	<li> 이름 : ${argsmember.name} </li>
	
	3] target으로 값 할당하기
	<c:target="${defaultmember}" property="id" value="PARK"/>
	<c:target="${defaultmember}" property="pwd" value="1234"/>
	<c:target="${defaultmember}" property="name" value="박길동"/>
	
	//EL로 출력
	<li> 아이디 : ${defaultmember.id} </li>
	<li> 비번 : ${defaultmember.pwd} </li>
	<li> 이름 : ${defaultmember.name} </li>
	
	4] 리스트 계열
	//데이터 준비
	<%
		List list = new vector();
		list.add(request.getAttribute("defaultmember"));
		list.add(request.getAttribute("argsmember"));
	%>
	
	<c:set var="list" value="<%=list%>" scope="request"/>
	
	//EL로 출력
	<li> 아이디 : ${list[0].id} </li>
	<li> 비번 : ${list[0].pwd} </li>
	<li> 이름 : ${list[0].name} </li>
	
	//target으로 값 변경
	<c:target="${list[0]}" property="id" value="KOSMO"/>
	<c:target="${list[0]}" property="pwd" value="7777"/>
	<c:target="${list[0]}" property="name" value="한소인"/>


	5] 맵 게열
	//데이터 준비
	<%
		Map map = new Map();
		map.put("default",request.getAttribute("defaultmember"));
		map.put("args",request.getAttribute("argsmember"));
	%>
	<c:set var="map" value="<%= map %>" scope="request"/>
	
	//EL로 출력
	<li> 아이디 : ${map.args.id} </li>
	<li> 비번 : ${map.args.pwd} </li>
	<li> 이름 : ${map.args.name} </li>
	
	//target으로 값 변경
	<c:target="${map.args}" property="id" value="LEE"/>
	<c:target="${map.args}" property="pwd" value="9999"/>
	<c:target="${map.args}" property="name" value="이길동"/>

2] JSTL의 remove
---
	<c:remove var="request" scope="request"/>
	//scope 미 지정시 동일한 속성명 모두 삭제한다.
	
3] JSTL의 IF태그
---
	//if 이외 else if, else는 없다
	//기본 형태
	//test속성에 EL식이 아닌 일반 값을 넣으면 무조건 거짓
	//단, 일반 값이라도 TRUE(대소문자 상관없이) 경우는 true로 판단 (빈 공백 없어야한다)
	//test는 반드시 EL식 val는 if문 변수 지정
	
	${c:if test="조건식" val=""}

4] JSTL의 ChooseWhenOtherwise태그
---
	<c:choose>
		<c:when test="조건식">
		
		</c:when>
		<c:otherwise>
		
		</c:otehrwise>
	<c:choose>
	

5] JSTL의 ForEach태그
---	
	//기본 식
	<c:forEach begin=" " end=" " var=" ">
	</c:forEach>
	//varStatus
	<c:forEach begin=" ' end=" " var=" " varStatus="loop">
		loop.count 속성  1부터 시작한다
		loop.index 속성  begin값부터 시작
		loop.first 속성  첫번째 index만 true
		loop.last 속성   마지막 index만 true
		loop.current 속성 begin값부터 시작
	</c:forEach>

	<%
	//배열 준비
	String[] colors={"red","green","blue"}
	
	//리스트 준비
	List list = new Vector();
	list.add(new MemDTO("KIM","1234","김길동",null,null));
	list.add(new MemDTO("LEE","1234","이길동",null,null));
	list.add(new MemDTO("PARK","1234","박길동",null,null));
	
	//맵 계열 준비
	Map map = new HashMap();
	map.put("first",list.get(0));
	map.put("second",list.get(1));
	map.put("third",list.get(2));
	%>
	
	//출력 순서는 무조건 셋으로 지정 후 forEach사용
	//1]배열 출력
	<c:set var="colors" value="<%=colors%>"/>
	<c:forEach var="item" items="${colors}>
		<h4 style="color:"+${item}>JSP</h4>
	</c:forEach>
	
	//2]리스트 출력
	<c:set var="list" value="<%=list%>"/>
	<c:forEach var="item" items="${list}">
		<h4> 아이디 : ${item.id} 비번 : ${item.pwd} 이름 : ${item.name} </h4>
	</c:forEach>
	
	//3]맵 출력
	<c:set var="map" value="<%=map%>"/>
	<c:forEach var="item" items="${map}">
		<h4> 키 : ${item.key} 아이디 : ${item.value.id} 비번 : ${item.value.pwd} 이름 : ${item.value.name}
	</c:forEach>

6] JSTL의 forTokensTag
---
	
	//자바 forTokenTag
	//split하는거다!
	<%
	//데이터 준비
	String colors = "red,green,blue"
	
	//1]String 클래스
	for(String color : colors.split(","){
		out.println("<h4 style='color:"+color+"'>"+color+"</h4>")
	}
	
	//2] StringTokenizer 클래스
	StringTokenizer tokenizer = new StringTokenizer(colors,",");
	while(tokenizer.hasMoreToken()){
		String color = tokenizer.nextToken();
		out.println("<h4 style='color:"+color+"'>"+color+"</h4>")
	}
	%>
	
	//3]JSTL의 forTokens태그
	<c:set var="colors" value="<%=colors$>">
	<c:forTokens var="color" items="${colors}" delims=",">
		<h4 style="color:${color}">${color}</h4>
	<c:forTokens>
	
7] JSTL의 import태그
---
	
	//var 속성 미지정시 include 액션태그와 같다.
	//외부에 있는 컨텐츠 삽입도 가능하다.
	
	<c:import url=""/>
	==
	<jsp:include page="">
	
	<c:import url="">
		<c:param name="user" value="PARK"/>
		<c:param name="pass" value="1234"/>
	</c:import>
	
	//var 속성 지정. 원하는 위치에 삽입하고자 할 떄
	<c:import url="" var=""/>
	
	
8] JSTL의 redirect방식
---
	
	//response.sendRedirect랑
	//공통점은 request영역 공유 안한닫
	//차이점은 컨텍스트 루트를 포함 안해도됨
	
	<c:redirect url="">
		<c:param name="user" value="PARK"/>
		<c:param name="pass" value="1234"/>
	</c:redirect>
	
	//다른 어플안에 있는 페이지로 가고 싶을 시 context속성 사용
	<c:redirect context"/" url="/">
	
9] JSTL의 OUT
---

	//null이거나 param이 없을 경우 default값을 설정 할 수 있다.
	<c:out value="">
	==
	<c:set var ="" value="">

	//excapeXml 속성 
	//false가 디폴트값이고 false면 EL이랑 같고 
	//true 설정시 HTML태그가 그대로 문자열로 출력
	
	//default속성
	<c:out value=" " default=""/>
	
10] JSTL의 url태그

	//url태그 사용시 컨텍스트 루트 신경 쓸 필요 없다. 
	//url 파라미터가 쿼리스트링으로 연결됨!
	<c:uri value="페이지"/>
	
	//var속성시 내가 원하는 위치에 url 출력 된다.
	

	
	
	
	
	
	
	
