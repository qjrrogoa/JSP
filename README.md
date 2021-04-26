# JSP

JDBC 연결 방법
    
    변수 설정]
    private Connection conn;
    private ResultSet rs;
    private PreparedStatement psmt;
    
    1] 드라이브 로딩
    Class.forName("oracle.jdbc.OracleDriver")
    
    2] 데이터베이스 연결
    conn = DriverManager.getConnection("jdbc:oracle:thin:@localhose:1521:xe","system","kosmo1234");
    
    3] SQL문 작성
    String
post방식 일 때!

request.setCharacterEncoding("UTF-8");

Enumertation

hasMoreElements() : 읽어올 요소가 있으면 true

nextElement() : 다음 요소를 읽어옴

로그아웃 

session.invalidate();

