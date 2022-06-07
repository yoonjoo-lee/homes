package homes;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homes.service.ChatDao;

@WebServlet("/ChatSubmitServlet")
public class ChatSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("써브밋 서블릿");
		String chatName = request.getParameter("chatName");
		System.out.println(chatName);
		String chatContent = request.getParameter("chatContent");
		String midx_ = request.getParameter("midx");
		int midx = Integer.parseInt(midx_);
		String othermidx_ = request.getParameter("othermidx");
		int othermidx = Integer.parseInt(othermidx_);
		
		ChatDao cd = new ChatDao();
		
		if(chatName == null || chatName.equals("") || chatContent == null || chatContent.equals("")) {
			response.getWriter().write("0");
		} else {
			response.getWriter().write(cd.chatSubmit(chatName, chatContent, midx, othermidx) + "");
		}
	
	}



}
