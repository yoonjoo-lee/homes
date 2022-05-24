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
import homes.domain.SearchCriteria;
import homes.domain.MemberVo;

public class BoardDao {
	Connection conn;
	PreparedStatement pstmt;
	
	
	public BoardDao() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
	
	// boardWriteAction에서 게시글 삽입을 위해 넘어옴 (처리되면 value값에 1로 리턴, 안되면 0리턴)
	public int insertBoard(String subject, String content, String writer, String ip, int midx, String filename) {
		int value = 0;
		
		String sql="INSERT INTO home_board(BIDX,SUBJECT,CONTENT,WRITER,IP,MIDX,ORIGINBIDX,DEPTH_,LEVEL_,filename)"
				+ "VALUES(bidx_seq.NEXTVAL,?,?,?,?,?,bidx_seq.NEXTVAL,0,0,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			pstmt.setString(4, ip);
			pstmt.setInt(5, midx);
			pstmt.setString(6, filename);
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
	
	//boardList에서 게시글들을 출력하기 위해 넘어옴
		public ArrayList<BoardVo> boardSelectAll(SearchCriteria scri) {
			ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
			ResultSet rs = null;
			
			String str = "";
			if (scri.getSearchType().equals("subject")) {
				str = "and subject like ? ";
			} else {
				str = "and writer like ? ";
			}
			
			String sql = "SELECT * FROM (SELECT ROWNUM AS rnum, A.* FROM "
					+ "(SELECT * FROM home_board WHERE delyn='N' "+ str +" ORDER BY ORIGINBIDX DESC, DEPTH_ ASC) A) B "
					+ "WHERE rnum BETWEEN ? AND ?";

			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + scri.getKeyword() + "%");
				pstmt.setInt(2, (scri.getPage()-1)*15+1);
				pstmt.setInt(3, (scri.getPage()*15));
				rs = pstmt.executeQuery();
				
				
				//다음 값이 존재하면 참이고 그 행으로 커서가 이동한다.
				while(rs.next()) {
					BoardVo bv = new BoardVo();
					bv.setBidx(rs.getInt("bidx"));	//rs에 복사된 bidx를 bv에 옮겨담는다
					bv.setSubject(rs.getString("subject"));
					bv.setWriter(rs.getString("writer"));
					bv.setWriteday(rs.getString("writeday"));
					bv.setLevel_(rs.getInt("level_"));
					
					alist.add(bv);	//각각의 bv 객체를 alist에 추가한다. 
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
		
		public ArrayList<BoardVo> boardSelectAll() {
			ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
			ResultSet rs = null;
			String sql = "select * from home_board where delyn='N' order by midx desc";
			
			try{
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
				
					BoardVo mv = new BoardVo();
					mv.setBidx(rs.getInt("bidx"));	//rs에 복사된 bidx를 bv에 옮겨담는다
					mv.setSubject(rs.getString("subject"));
					mv.setWriter(rs.getString("writer"));
					mv.setWriteday(rs.getString("writeday"));
					mv.setLevel_(rs.getInt("level_"));
					alist.add(mv);
					}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					rs.close();
					pstmt.close();
					conn.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
			
			
			return alist;

		}
		
		public int boardTotal(SearchCriteria scri) {
			int cnt = 0;
			ResultSet rs = null;
			String str = "";
			if (scri.getSearchType().equals("subject")) {
				str = "and subject like ? ";
			} else {
				str = "and writer like ? ";
			}
			
			String sql = "select count(*) as cnt from a_board where delyn='N' "+ str + "";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + scri.getKeyword() + "%");
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					cnt = rs.getInt("cnt");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					rs.close();
					pstmt.close();
			//		conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return cnt;
		}
		
		

}
