package homes;

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

import homes.domain.ChatVo;
import homes.service.ChatDao;

@WebServlet("/ChatListServlet")
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String listType = request.getParameter("listType");
		
		if(listType==null || listType.equals("")) {
			response.getWriter().write("");
		} else if (listType.equals("today")) {
			response.getWriter().write(getToday());
		} else if (listType.equals("ten")) {
			response.getWriter().write(getTen());
		}
		else {
			try {
				Integer.parseInt(listType);
				response.getWriter().write(getID(listType));
			} catch(Exception e) {
				response.getWriter().write("");
			}
		}
	}
	
	public String getToday() {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");

		ChatDao cd = new ChatDao();
		ArrayList<ChatVo> chatList = cd.getChatList(new SimpleDateFormat("yyyyMMdd").format(new Date()));
		System.out.println(chatList.get(6).getChattime());
		
		for(int i=0; i< chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatname() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatcontent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChattime() + "\"}]");
			if(i != chatList.size()-1) {
				result.append(",");
			}
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getCidx() + "\"}");
		return result.toString();
	}

	public String getTen() {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDao cd = new ChatDao();
		ArrayList<ChatVo> chatList = cd.getChatListByRecent(10);

		for(int i=0; i< chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatname() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatcontent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChattime() + "\"}]");
			if(i != chatList.size()-1) {
				result.append(",");
			}
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getCidx() + "\"}");
		return result.toString();
	}
	
	public String getID(String cidx) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDao cd = new ChatDao();
		ArrayList<ChatVo> chatList = cd.getChatListByRecent(cidx);

		for(int i=0; i< chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatname() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatcontent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChattime() + "\"}]");
			if(i != chatList.size()-1) {
				result.append(",");
			}
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getCidx() + "\"}");
		return result.toString();
	}
}














