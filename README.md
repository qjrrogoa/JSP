# JSP

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


post방식 일 때!

request.setCharacterEncoding("UTF-8");

Enumertation

hasMoreElements() : 읽어올 요소가 있으면 true

nextElement() : 다음 요소를 읽어옴

로그아웃 

session.invalidate();

