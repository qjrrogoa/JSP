package model.dataroom;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.sql.DataSource;

public class DataRoomDAO {
	//[멤버변수]
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	//톰캣이 만들어 놓은 커넥션을 커넥션 풀에서 가져다 쓰기]
	public DataRoomDAO(ServletContext context) {
		try {
			//데이타 베이스 연결하기-커넥션 풀 이용]
			Context ctx = new InitialContext();
			DataSource source=(DataSource)ctx.lookup(context.getInitParameter("JNDI_ROOT")+"/myjsp");
			conn=source.getConnection();
		}
		catch(NamingException | SQLException e) {e.printStackTrace();}
	}////////////////
	//자원반납용]-사용한 커넥션 객체를 다시 풀에 반납
	public void close() {
		try {
			//메모리 해제]
			if(rs !=null) rs.close();
			if(psmt !=null) psmt.close();
			//커넥션 풀에 커넥션 객체 반납-메모리 해제 아님]
			if(conn !=null) conn.close();
		}
		catch(SQLException e) {e.printStackTrace();}
	}///////////close
	//전체 목록용]
	/*
	 * 페이징 순서
	 * 1. 전체 목록용 쿼리를 구간쿼리로 변경
	 * 2. 전체 레코드수 얻기용 메소드 추가
	 * 3. 페이징 로직을 리스트 컨트롤러에 추가
	 * 4. 리스트.JSP페이지에 결과값 출력
	 */
	public List<DataRoomDTO> selectList(Map map) {
		List<DataRoomDTO> list = new Vector<DataRoomDTO>();
		//페이징 적용 전 쿼리
		//String sql="SELECT * FROM dataroom ORDER BY no DESC";
		//페이징 적용 쿼리(구간 쿼리)
		String sql="SELECT * FROM (SELECT T.*,ROWNUM R FROM(SELECT * FROM dataroom ORDER BY no DESC) T) WHERE R BETWEEN ? AND ? ";
		
		try {
			psmt = conn.prepareStatement(sql);
			//시작 및 끝 행번호 설정]
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while(rs.next()) {
				DataRoomDTO dto = new DataRoomDTO();
				dto.setAttachFile(rs.getString(6));
				dto.setContent(rs.getString(5));
				dto.setDownCount(rs.getString(7));
				dto.setName(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPassword(rs.getString(3));
				dto.setPostDate(rs.getDate(8));
				dto.setTitle(rs.getString(4));
				list.add(dto);
			}
		}
		catch(SQLException e) {e.printStackTrace();}
		
		return list;
	}/////////////selectList
	//전체 레코드 수 얻기용]
	public int getTotalRecordCount() {
		int totalCount=0;
		String sql="SELECT COUNT(*) FROM dataroom";
		try {
			psmt = conn.prepareStatement(sql);			
			rs = psmt.executeQuery();
			rs.next();
			totalCount=rs.getInt(1);
		}
		catch(SQLException e) {e.printStackTrace();}
		return totalCount;
	}////////////getTotalRecordCount
	//입력용]	
	public int insert(DataRoomDTO dto) {
		int affected=0;
		String sql="INSERT INTO dataroom VALUES(SEQ_DATAROOM.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getPassword());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getAttachFile());
			affected = psmt.executeUpdate();
		}
		catch(SQLException e) {e.printStackTrace();}
		return affected;
	}//////////
	//상세보기용]
	public DataRoomDTO selectOne(String no) {
		DataRoomDTO dto = null;
		String sql="SELECT * FROM dataroom WHERE no=?";
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto = new DataRoomDTO();
				dto.setAttachFile(rs.getString(6));
				dto.setContent(rs.getString(5));
				dto.setDownCount(rs.getString(7));
				dto.setName(rs.getString(2));
				dto.setNo(rs.getString(1));
				dto.setPassword(rs.getString(3));
				dto.setPostDate(rs.getDate(8));
				dto.setTitle(rs.getString(4));				
			}///if
		}////try
		catch(SQLException e) {e.printStackTrace();}
		
		return dto;
	}//////////////////////
	//비밀번호 확인]
	public boolean isCorrectPassword(String no, String password) {
		String sql="SELECT password FROM dataroom WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			rs = psmt.executeQuery();
			if(rs.next()) {
				if(!rs.getString(1).equals(password)) return false;
			}
		}
		catch(SQLException e) {e.printStackTrace();return false;}
		return true;
	}////////////////isCorrectPassword
	//삭제용]
	public int delete(String no) {
		int affected=0;
		String sql="DELETE FROM dataroom WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, no);
			affected = psmt.executeUpdate();			
		}
		catch(SQLException e) {e.printStackTrace();}
		return affected;
	}///////////////delete
	//수정용]
	public int update(DataRoomDTO dto) {
		int affected=0;
		String sql="UPDATE dataroom SET name=?,title=?,attachFile=?,password=?,content=? WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getAttachFile());
			psmt.setString(4, dto.getPassword());
			psmt.setString(5, dto.getContent());
			psmt.setString(6, dto.getNo());
			affected = psmt.executeUpdate();			
		}
		catch(SQLException e) {e.printStackTrace();}
		return affected;
	}//////////////update
	//다운로드 횟수 증가용
	public void updateDownCount(String no) {
		String sql="UPDATE dataroom SET downcount=downcount+1 WHERE no=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,no);
			psmt.executeUpdate();			
		}
		catch(SQLException e) {e.printStackTrace();}
		
	}//////////updateDownCount
	
}///////////////
