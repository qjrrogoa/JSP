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

//1]HttpServlet상속-컨트롤러가 됨 즉 서블릿이 됨
public class WriteController extends HttpServlet {
	
	//[입력 폼으로 이동]
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//3]요청분석- 입력폼 요청
		//4]모델호출 및 결과값 받기
		//5]결과값이 있으면 ,리퀘스트 영역에 저장
		//6]뷰 선택
		/*
		 *  절대경로 지정시
		 * 	포워딩:컨텍스트 루트 경로 미 포함
		 *  리다이렉트:컨텍스트 루트 포함.
		 *  단, server.xml에 Context태그의 path속성 값을
		 *  지울시에는 신경 쓸 필요없다.
		 */
		req.getRequestDispatcher("/DataRoom14/Write.jsp").forward(req, resp);
	}///////////
	//[입력 처리 즉 파일 업로드 및 데이타베이스 입력]
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글처리]
		req.setCharacterEncoding("UTF-8");
		//3]요청분석- 입력처리 요청
		//4]모델호출 및 결과값 받기
		//파일 업로드와 관련된 모델(비지니스 로직) 호출
		MultipartRequest mr= FileUtils.upload(req,req.getServletContext().getRealPath("/Upload"));
		if(mr !=null) {//파일 업로드 성공일때 DB 입력처리]
			String name = mr.getParameter("name");
			String title = mr.getParameter("title");
			String password = mr.getParameter("password");
			String content = mr.getParameter("content");
			String attachFile = mr.getFilesystemName("attachFile");
			//데이타베이스 CRUD작업과 관련된 모델 호출]
			DataRoomDAO dao = new DataRoomDAO(req.getServletContext());
			DataRoomDTO dto = new DataRoomDTO();
			dto.setAttachFile(attachFile);
			dto.setContent(content);
			dto.setPassword(password);
			dto.setName(name);
			dto.setTitle(title);
			int successOrFail=dao.insert(dto);
			if(successOrFail ==0) {//데이터 입력 실패시 업로된 파일 삭제
				//파일 삭제 로직 호출]
				FileUtils.deleteFile(req,"/Upload",attachFile);
			}
			dao.close();
		}
		else {//파일 용량 초과시
			
		}
	}/////////
}
