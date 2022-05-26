package homes.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String pj = request.getContextPath();
		String command = uri.substring(pj.length());
		// ex) /member/memberList.do
		
		String[] subpath = command.split("/");
		String location = subpath[1];	//2번째 ex)member
		
		if (location.equals("member")) {
			MemberController mc = new MemberController();
			mc.doGet(request, response);
		}else if (location.equals("payment")) {
			PaymentController bc = new PaymentController();
			bc.doGet(request, response);
		}else if (location.equals("board")) {
			BoardController bc = new BoardController();
			bc.doGet(request, response);
		}else if (location.equals("main")) {
			MainController bc = new MainController();
			bc.doGet(request, response);
		}
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
