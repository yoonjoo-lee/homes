package homes.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import homes.domain.BoardVo;
import homes.domain.MemberVo;
import homes.service.BoardDao;
import homes.service.MemberDao;
@WebServlet("/MainController")
public class MainController extends HttpServlet {
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	
		String uri = request.getRequestURI();
		String pj = request.getContextPath();
		String command = uri.substring(pj.length());
		
		if (command.equals("/main/index.do")) {
			BoardDao bd = new BoardDao();

			ArrayList<BoardVo> alist = bd.boardSelectAll();
			request.setAttribute("alist", alist);
			
			HttpSession session = request.getSession();
			if(session.getAttribute("midx")!=null) {
				int midx = (int)session.getAttribute("midx");
				
				MemberDao md = new MemberDao();
				MemberVo mv = md.memberSelectOne(midx);
				session.setAttribute("userProfile", mv.getUserprofile());
				
				request.setAttribute("mv", mv);
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);		
		}
		
		
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
