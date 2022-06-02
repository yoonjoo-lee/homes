package homes.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homes.dbconn.Dbconn;
import homes.domain.BoardVo;
import homes.domain.ChatVo;
import homes.domain.SearchCriteria;

@WebServlet("/ChatDao")
public class ChatDao {
	Connection conn;
	PreparedStatement pstmt;
	
    public ChatDao() {
    	Dbconn db = new Dbconn();
		this.conn = db.getConnection();
    }

    public ArrayList<ChatVo> getChatList(String nowTime){
    	ArrayList<ChatVo> alist = new ArrayList<ChatVo>();
		ResultSet rs = null;
		
		String sql ="SELECT * FROM home_chat where chattime > ? order by chattime";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nowTime);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ChatVo cv = new ChatVo();
				cv.setCidx(rs.getInt("cidx"));	//rs에 복사된 bidx를 bv에 옮겨담는다
				cv.setChatname(rs.getString("chatName"));
				cv.setChatcontent(rs.getString("chatContent").replace(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "gt;").replaceAll("\n", "<br>"));
				cv.setChattime(rs.getString("chatTime"));
				cv.setMidx(rs.getInt("midx"));
				
				alist.add(cv);	//각각의 bv 객체를 alist에 추가한다. 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return alist;
    }
    
    public int chatSubmit(String chatName, String chatContent, int midx){
    	int value = 0;
    	
    	String sql = "INSERT INTO home_chat VALUES (CIDX_SEQ.NEXTVAL, ?,?,SYSDATE,?)";
    	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chatName);
			pstmt.setString(2, chatContent);
			pstmt.setInt(3, midx);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
    	return value;
    }

    public ArrayList<ChatVo> getChatListByRecent(int number){
    	ArrayList<ChatVo> chatList = new ArrayList<ChatVo>();
		ResultSet rs = null;
		
		String sql ="SELECT a.*,b.userprofile FROM HOME_CHAT a JOIN HOME_MEMBER b ON a.MIDX = b.MIDX where cidx > (SELECT MAX(cidx) - ? FROM home_chat) order by chattime";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ChatVo cv = new ChatVo();
				cv.setCidx(rs.getInt("cidx"));	//rs에 복사된 bidx를 bv에 옮겨담는다
				cv.setChatname(rs.getString("chatName"));
				cv.setUserprofile(rs.getString("userProfile"));
				cv.setChatcontent(rs.getString("chatContent").replace(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "gt;").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
				String timeType = "오전";
				if(Integer.parseInt(rs.getString("chatTime").substring(11,13)) >= 12){
					timeType = "오후";
					chatTime -= 12;
				}
				cv.setMidx(rs.getInt("midx"));
				cv.setChattime(rs.getString("chatTime").substring(0,11) + " " + timeType + " " + chatTime + ":" + rs.getString("chatTime").substring(14, 16) + "");
				
				chatList.add(cv);	//각각의 bv 객체를 alist에 추가한다. 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				/* rs.close(); */
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
    	
    	return chatList;
    }
    
    public ArrayList<ChatVo> getChatListByRecent(String cidx){
    	ArrayList<ChatVo> chatList = new ArrayList<ChatVo>();
		ResultSet rs = null;
		
		String sql ="SELECT a.*,b.userprofile FROM HOME_CHAT a JOIN HOME_MEMBER b ON a.MIDX = b.MIDX WHERE CIDX > ?  order by chattime";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cidx));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ChatVo cv = new ChatVo();
				cv.setCidx(rs.getInt("cidx"));	//rs에 복사된 bidx를 bv에 옮겨담는다
				cv.setUserprofile(rs.getString("userProfile"));
				cv.setChatname(rs.getString("chatName"));
				cv.setChatcontent(rs.getString("chatContent").replace(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "gt;").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
				String timeType = "오전";
				if(Integer.parseInt(rs.getString("chatTime").substring(11,13)) >= 12){
					timeType = "오후";
					chatTime -= 12;
				}
				cv.setMidx(rs.getInt("midx"));
				cv.setChattime(rs.getString("chatTime").substring(0,11) + " " + timeType + " " + chatTime + ":" + rs.getString("chatTime").substring(14, 16) + "");
				
				chatList.add(cv);	//각각의 bv 객체를 alist에 추가한다. 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
    	
    	return chatList;
    }















}

