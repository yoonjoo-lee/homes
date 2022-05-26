package homes.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homes.domain.BoardVo;
import homes.service.BoardDao;
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
			
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);		
		}
		
		
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
