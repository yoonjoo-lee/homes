package homes.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import homes.service.BoardDao;
import homes.domain.BoardVo;
import homes.domain.PageMaker;
import homes.domain.SearchCriteria;


public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//가상경로 추출
		String uri = request.getRequestURI();
		String pj = request.getContextPath();
		String command = uri.substring(pj.length());
		
		//여러곳에서 쓰니까 여기에 지정 (fileDownload.do랑 boardWriteAction.do에서 사용)
		String uploadPath = "C:\\Users\\753\\git\\homes\\homes\\src\\main\\webapp\\";
		String saveFolder = "images";
		String saveFullPath = uploadPath + saveFolder;
		
	
		if (command.equals("/board/boardWrite.do")){
			System.out.println("보드롸이트");
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardWrite.jsp");
			rd.forward(request, response);
		} else if (command.equals("/board/boardWriteAction.do")) {
			
			
			int sizeLimit = 1024*1024*15;
			
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, saveFullPath, sizeLimit,"utf-8", new DefaultFileRenamePolicy());
		
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String writer = multi.getParameter("writer");
			
			//열거자에 저장될 파일을 담는 객체를 생성한다
			Enumeration files = multi.getFileNames();
			//담긴 파일의 객체의 파일 이름을 얻는다
			String file = (String)files.nextElement();			
			//저장되는 파일이름
			String fileName = multi.getFilesystemName(file);
			//원래 파일이름
			String originFileName = multi.getOriginalFileName(file);
			
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			System.out.println(midx);
			
			BoardDao bd = new BoardDao();
			int value = bd.insertBoard(subject, content, writer, ip, midx, fileName);
			
			if(value == 1 ) {
				response.sendRedirect(request.getContextPath() + "/index.jsp");
			}else {
				response.sendRedirect(request.getContextPath() + "/board/boardWrite.do");
			}
		} else if (command.equals("/board/boardList.do")){
			System.out.println("리스트 들어왔음");
			
			String page = request.getParameter("page");
			if (page == null) page = "1";
			int pagex = Integer.parseInt(page);
			
			String keyword = request.getParameter("keyword");
			if (keyword == null) keyword = "";	//검색이 없으면 빈값으로 넘어가게 처리
			String searchType = request.getParameter("searchType");
			if (searchType == null) searchType = "제목";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			scri.setSearchType(searchType);
			
			//처리
			BoardDao bd = new BoardDao();
			int cnt = bd.boardTotal(scri);
			System.out.println("cnt" + cnt);
			
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			
			
			ArrayList<BoardVo> alist = bd.boardSelectAll(scri);
			request.setAttribute("alist", alist);	//데이터(자원) 공유
			request.setAttribute("pm", pm);
			
			//이동
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardList.jsp");
			rd.forward(request, response);			
		}
		
		
		
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
