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
    
# 게시판 작성 프로세스
    
    1. DTO, DAO 객체 만들기
    DTO : 데이터를 전송하는 객체로 테이블의 레코드 하나를 저장할 수 있는 자료구조
    DAO : 데이터에 접근해서 CRUD작업을 수행하는 업무처리 로직을 갖고 있는 객체
    
    2. 회원 여부 파악하기

    3. 목록 창 만들기 (List)

    4. 글 상세보기 페이지 만들기 (View)
    
    5. 이전글 다음글

    6. 목록/수정/삭제
post방식 일 때!

request.setCharacterEncoding("UTF-8");

Enumertation

hasMoreElements() : 읽어올 요소가 있으면 true

nextElement() : 다음 요소를 읽어옴

로그아웃 

session.invalidate();

