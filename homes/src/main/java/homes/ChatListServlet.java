package homes;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import homes.domain.ChatVo;
import homes.service.ChatDao;

@WebServlet("/ChatListServlet")
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String listType = request.getParameter("listType");
		System.out.println("업데이트");
		//System.out.println("listType"+listType);
		if(listType==null || listType.equals("")) {
			response.getWriter().write("aaa");
		} else if (listType.equals("today")) {
			response.getWriter().write(getToday());
		} else if (listType.equals("ten")) {
			response.getWriter().write(getTen());
		} else if (listType.equals("list")) {
			String midx_ = request.getParameter("midx");
			int midx = Integer.parseInt(midx_);
			
			response.getWriter().write(getList(midx));
			System.out.println("리스트");
		} else if (listType.equals("recentlist")) {
			String midx_ = request.getParameter("midx");
			int midx = Integer.parseInt(midx_);
			
			String cidx_ = request.getParameter("cidx");
			int cidx = Integer.parseInt(cidx_);
			
			response.getWriter().write(getRecentList(midx, cidx));
			System.out.println("리스트");
		} else if (listType.equals("twolist")) {
			String myMidx_ = request.getParameter("myMidx");
			int myMidx = Integer.parseInt(myMidx_);
			
			String chatMidx_ = request.getParameter("chatMidx");
			int chatMidx = Integer.parseInt(chatMidx_);
			
			response.getWriter().write(twoChatList(myMidx, chatMidx));
			System.out.println("리스트");
		} else if (listType.equals("twolistrecent")) {
			String myMidx_ = request.getParameter("myMidx");
			int myMidx = Integer.parseInt(myMidx_);
			
			String chatMidx_ = request.getParameter("chatMidx");
			int chatMidx = Integer.parseInt(chatMidx_);
			
			String cidx_ = request.getParameter("cidx");
			int cidx = Integer.parseInt(cidx_);
			
			System.out.println(myMidx);
			System.out.println(chatMidx);
			System.out.println(cidx);
			
			response.getWriter().write(twoChatListRecent(myMidx, chatMidx, cidx));
			System.out.println("리스트");
		} else if (listType.equals("kakao")) {
			response.getWriter().write(kakaopayAction());
		}
		else {
			try {
				Integer.parseInt(listType);
				response.getWriter().write(getID(listType));
			} catch(Exception e) {
				response.getWriter().write("ttt");
			}
		}
	}
	
	public String kakaopayAction() {
		
		System.out.println("챗리스트에서 카카오페이 들어옴");
		
		
		try {
			URL payurl = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connect = (HttpURLConnection) payurl.openConnection();
			connect.setRequestMethod("POST");
			connect.setRequestProperty("Authorization", "KakaoAK 62c32a2bde2cd28d2495111b7cd169f7");
			connect.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connect.setDoOutput(true);
			String pram = "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&vat_amount=200&tax_free_amount=0&approval_url=http://localhost:8090/homes/kakaopay/success.jsp&fail_url=http://localhost:8090/homes/main/index.do&cancel_url=http://localhost:8090/homes/main/index.do";
			OutputStream outputstream = connect.getOutputStream(); 
			DataOutputStream dataoutputstream = new DataOutputStream(outputstream);
			dataoutputstream.writeBytes(pram);
			dataoutputstream.close();
			
			int result = connect.getResponseCode();
			System.out.println(result);
			InputStream inputstream;
			if(result==200) {
				System.out.println("성공");
				inputstream = connect.getInputStream();
			}else {
				System.out.println("에러");
				inputstream = connect.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(inputstream);
			BufferedReader bufferedreader = new BufferedReader(reader);
			System.out.println(bufferedreader.readLine());
			//System.out.println(bufferedreader.toString());
			
			return bufferedreader.readLine();
//			return "a";
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "{\"result\":\"NO\"}";
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
			result.append("{\"value\": \"" + chatList.get(i).getUserprofile() + "\"},");
			/* result.append("{\"value\": \"" + chatList.get(i).getMidx() + "\"},"); */
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
			result.append("{\"value\": \"" + chatList.get(i).getUserprofile() + "\"},");
			/* result.append("{\"value\": \"" + chatList.get(i).getMidx() + "\"},"); */
			result.append("{\"value\": \"" + chatList.get(i).getChattime() + "\"}]");
			if(i != chatList.size()-1) {
				result.append(",");
			}
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getCidx() + "\"}");
		return result.toString();
	}
	
	
	
//  쪽지에서 본인 제외 리스트 출력
	public String getList(int midx) {
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDao cd = new ChatDao();
		ArrayList<ChatVo> chatList = cd.getChatListIndividual(midx);
		
		for(int i=0; i< chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatname() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatcontent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChattime() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getUserprofile() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getMidx() + "\"}]");
			if(i != chatList.size()-1) {
				result.append(",");
			}
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getCidx() + "\"}");
		return result.toString();
	}
	
	public String getRecentList(int midx, int cidx) {
		
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDao cd = new ChatDao();
		ArrayList<ChatVo> chatList = cd.getChatListIndividualRecent(midx, cidx);
		
		for(int i=0; i< chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatname() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatcontent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChattime() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getUserprofile() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getMidx() + "\"}]");
			if(i != chatList.size()-1) {
				result.append(",");
			}
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getCidx() + "\"}");
		return result.toString();
	}
	
	public String twoChatList(int myMidx, int chatMidx) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDao cd = new ChatDao();
		ArrayList<ChatVo> chatList = cd.getTwoChatList(myMidx, chatMidx);
		
		for(int i=0; i< chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatname() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatcontent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getUserprofile() + "\"},");
			/* result.append("{\"value\": \"" + chatList.get(i).getMidx() + "\"},"); */
			result.append("{\"value\": \"" + chatList.get(i).getChattime() + "\"}]");
			if(i != chatList.size()-1) {
				result.append(",");
			}
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getCidx() + "\"}");
		return result.toString();
	}
	
	
	public String twoChatListRecent(int myMidx, int chatMidx, int cidx) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDao cd = new ChatDao();
		ArrayList<ChatVo> chatList = cd.twoChatListRecent(myMidx, chatMidx, cidx);
		
		for(int i=0; i< chatList.size(); i++) {
			result.append("[{\"value\": \"" + chatList.get(i).getChatname() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getChatcontent() + "\"},");
			result.append("{\"value\": \"" + chatList.get(i).getUserprofile() + "\"},");
			/* result.append("{\"value\": \"" + chatList.get(i).getMidx() + "\"},"); */
			result.append("{\"value\": \"" + chatList.get(i).getChattime() + "\"}]");
			if(i != chatList.size()-1) {
				result.append(",");
			}
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size()-1).getCidx() + "\"}");
		return result.toString();
	}
	
	
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
		
		
	}
	
	
}














