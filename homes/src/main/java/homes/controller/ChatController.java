package homes.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homes.domain.BoardVo;
import homes.domain.ChatVo;
import homes.service.BoardDao;
import homes.service.ChatDao;
import homes.service.MemberDao;

public class ChatController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//가상경로 추출
		String uri = request.getRequestURI();
		String pj = request.getContextPath();
		String command = uri.substring(pj.length());
		
		if (command.equals("/chat/chatPage.do")){
			RequestDispatcher rd = request.getRequestDispatcher("/chat/chatPage.jsp");
			rd.forward(request, response);
		} else if (command.equals("/chat/chatSubmitAction.do")) {
			String chatName = request.getParameter("chatName");
			String chatContent = request.getParameter("chatContent");
			String midx_ = request.getParameter("midx");
			
			System.out.println(chatName);
			System.out.println(chatContent);
			System.out.println(midx_);
			
			int midx = Integer.parseInt(midx_);
			
			ChatDao cd = new ChatDao();
			int value = cd.chatSubmit(chatName, chatContent, midx);
			
			if (value==1){
				response.sendRedirect(request.getContextPath()+"/chat/chatPage.do?value");
			}else{
				response.sendRedirect(request.getContextPath()+"/main/index.do");
			}
		} 
//		else if (command.equals("/chat/chatListAction.do")) {
//			String listType = request.getParameter("listType");
//			
//			if(listType==null || listType.equals("")) {
//				response.getWriter().write("");
//			} else if (listType.equals("today")) {
//				StringBuffer result = new StringBuffer("");
//				result.append("{\"result\":[");
//				
//				ChatDao cd = new ChatDao();
//				ArrayList<ChatVo> chatList = cd.getChatList(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
//				
//				request.setAttribute("chatList", chatList);
//				
//				RequestDispatcher rd = request.getRequestDispatcher("/chat/chatPage.jsp");
//				rd.forward(request, response);
//				for(int i=0; i< chatList.size(); i++) {
//					result.append("[{\"value\": \"" + chatList.get(i).getChatname() + "\"},");
//					result.append("[{\"value\": \"" + chatList.get(i).getChatcontent() + "\"},");
//					result.append("[{\"value\": \"" + chatList.get(i).getChattime() + "\"},");
//					if(i != chatList.size()-1) {
//						result.append(",");
//					}
//				}
//				result.append("]}");
//				return result.toString();
//			}
//		}
		
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}





