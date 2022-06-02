package homes.domain;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/ChatVo")


public class ChatVo {
	private int cidx;
	private String chatname;
	private String chatcontent;
	private String chattime;
	private String userprofile;
	
	public int getCidx() {
		return cidx;
	}
	public void setCidx(int cidx) {
		this.cidx = cidx;
	}
	public String getChatname() {
		return chatname;
	}
	public void setChatname(String chatname) {
		this.chatname = chatname;
	}
	public String getChatcontent() {
		return chatcontent;
	}
	public void setChatcontent(String chatcontent) {
		this.chatcontent = chatcontent;
	}
	public String getChattime() {
		return chattime;
	}
	public void setChattime(String chattime) {
		this.chattime = chattime;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getUserprofile() {
		return userprofile;
	}
	public void setUserprofile(String userprofile) {
		this.userprofile = userprofile;
	}
	private int midx;
	
}
