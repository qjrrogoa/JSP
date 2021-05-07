package controller.dataroom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.dataroom.DataRoomDAO;
import model.dataroom.DataRoomDTO;
import model.dataroom.FileUtils;

public class EditController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("요청방식:"+req.getMethod());
		System.out.println("모드 파라미터:"+req.getParameter("mode"));
		
		String mode = req.getParameter("mode");
		if(mode != null) {//수정 폼으로 이동
			//파라미터 받기]
			String no = req.getParameter("no");
			//모델 호출 및 결과 값 받기]
			DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
			DataRoomDTO dto= dao.selectOne(no);
			dao.close();
			//리퀘스트 영역에 저장]
			req.setAttribute("dto", dto);
			//포워드]
			req.getRequestDispatcher("/DataRoom14/Edit.jsp").forward(req, resp);
		}
		else {//수정 처리
			//한글처리]
			req.setCharacterEncoding("UTF-8");
			//3]요청분석- 입력처리 요청
			//4]모델호출 및 결과값 받기
			//파일 업로드와 관련된 모델(비지니스 로직) 호출
			MultipartRequest mr= FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
			System.out.println("mr="+mr);
			//DB수정 성공시에는 1,실패시 0, 파일용량 초과시에는 -1 저장
			int successOrFail;
			if(mr !=null) {//파일을 첨부 안했거나 혹은 첨부했다면 500KB이하
				
				String no = mr.getParameter("no");
				//※MultipartRequest가 파라미터를 
				//가로 챔으로 포워드 하더라도 파라미터가 전달되지 않는다
				//그래서 리퀘스트 영역에 저장
				//키값을 리퀘스트 영역에 저장]수정 완료후 View.kosmo로 이동하기 위함
				req.setAttribute("no", no);
				//현재 페이지번호를 리퀘스트 영역에 저장
				req.setAttribute("nowPage", mr.getParameter("nowPage"));
				
				String originalFilename = mr.getParameter("originalFilename");
				String name = mr.getParameter("name");
				String title = mr.getParameter("title");
				String password = mr.getParameter("password");
				String content = mr.getParameter("content");
				
				
				String attachFile = mr.getFilesystemName("attachFile");
				System.out.println("attachFile:"+attachFile);
				if(attachFile ==null) {//파일 미 첨부 즉 수정시 기존 파일을 새로운 파일로 미 교체
					attachFile = originalFilename;
				}
				
				//데이타베이스 CRUD작업과 관련된 모델 호출]
				DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
				DataRoomDTO dto = new DataRoomDTO();
				dto.setAttachFile(attachFile);
				dto.setContent(content);
				dto.setPassword(password);
				dto.setName(name);
				dto.setTitle(title);
				dto.setNo(no);
				successOrFail=dao.update(dto);
				if(successOrFail ==1 && mr.getFilesystemName("attachFile")!=null) {//DB업데이트 성공하고 파일 교체시에만 파일 삭제
					//파일 삭제 로직 호출]
					FileUtils.deleteFile(req,"/Upload",originalFilename);
				}
				dao.close();
				
			}
			else {//파일 용량 초과시
				successOrFail = -1;
			}
			//5]리퀘스트 영역에 결과값 혹은 필요한 값 저장
			req.setAttribute("SUCCFAIL",successOrFail);
			//5-2]컨트롤러 구분용-입력:INS,수정:EDT,삭제:DEL
			req.setAttribute("WHERE","EDT");
			//6]뷰로 이동
			req.getRequestDispatcher("/DataRoom14/Message.jsp").forward(req, resp);
			
		}
	}////////////service
}
