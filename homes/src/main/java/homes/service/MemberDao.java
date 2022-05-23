package homes.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homes.dbconn.Dbconn;
import homes.domain.MemberVo;
 
@WebServlet("/MemberDao")
public class MemberDao {
	 private Connection conn;
	 private PreparedStatement pstmt = null;
	 
	 public MemberDao() {
		 Dbconn db = new Dbconn();
		 this.conn = db.getConnection();
	 }
	 public int insertMemberUser(String memberName, String memberPhone, String memberJumin, String memberGender, String memberId, String memberEmail, String memberPwd, String memberHouse,int roomNumber, int deposit, int rent, String enterDate, String expirationDate) {
		 int value = 0;
		 
		 String sql = "INSERT INTO home_member(midx, membername,memberphone,memberemail,memberid,memberpwd,membergender,memberjumin, memberhouse, roomnumber, deposit, rent, enterdate, expirationdate)"
				 +"VALUES (MIDX_SEQ.NEXTVAL,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?,'YYYY-MM-DD'), TO_DATE(?,'YYYY-MM-DD'))";
		 System.out.println(enterDate);
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberPhone);
			pstmt.setString(3, memberEmail);
			pstmt.setString(4, memberId);
			pstmt.setString(5, memberPwd);
			pstmt.setString(6, memberGender);
			pstmt.setString(7, memberJumin);
			pstmt.setString(8, memberHouse);
			pstmt.setInt(9, roomNumber);
			pstmt.setInt(10, deposit);
			pstmt.setInt(11, rent);
			pstmt.setString(12, enterDate);
			pstmt.setString(13, expirationDate);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
		 return value;
	 }
	 
	 public int insertMemberManager(String memberName, String memberPhone, String memberJumin, String memberGender, String memberId, String memberEmail, String memberPwd, String memberHouse, int memberCount, String manager) {
		 int value = 0;
		 
		 String sql = "INSERT INTO home_member(midx, membername,memberphone,memberemail,memberid,memberpwd,membergender,memberjumin, memberhouse, membercount, manager)"
				 +"VALUES (MIDX_SEQ.NEXTVAL,?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		 
		 try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberPhone);
			pstmt.setString(3, memberEmail);
			pstmt.setString(4, memberId);
			pstmt.setString(5, memberPwd);
			pstmt.setString(6, memberGender);
			pstmt.setString(7, memberJumin);
			pstmt.setString(8, memberHouse);
			pstmt.setInt(9, memberCount);
			pstmt.setString(10, manager);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
		 return value;
	 }
	 
	 public int updateMemberMoney(int money, int midx) {
	 		int value = 0;
	 		
	 		String sql = "UPDATE home_member SET money= money + ? WHERE MIDX=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, money);
				pstmt.setInt(2, midx);
				value = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					pstmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
	 		
	 		return value;
	 	}
	 
	 public MemberVo memberLogin(String memberId, String memberPwd) {
			System.out.println(memberId +  memberPwd);
			ResultSet rs = null;
			MemberVo mv = null;
			
			String sql="select * from home_member where delyn = 'N' and memberid = ? and memberpwd = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {	//다음꺼가 존재한다면
					mv = new MemberVo();	//객체를 생성시킨다.
					mv.setMidx(rs.getInt("midx")); //mv에 담겨있는 midx, memberIdm memberName 값을 꺼낸다.
					mv.setMemberid(rs.getString("memberid"));
					mv.setMembername(rs.getString("membername"));
					mv.setManager(rs.getString("manager"));
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
			
			return mv;
		}
	 
	 	public MemberVo memberSelectOne(int midx) {
			MemberVo pv = null;
			ResultSet rs = null;
			
			String sql = "select * from home_member where midx=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, midx);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					pv = new MemberVo();
					pv.setMidx(rs.getInt("midx"));
					pv.setMembername(rs.getString("memberName"));
					pv.setMemberid(rs.getString("memberId"));
					pv.setMemberpwd(rs.getString("memberPwd"));
					pv.setMemberemail(rs.getString("memberEmail"));
					pv.setMemberhouse(rs.getString("memberHouse"));
					pv.setRoomnumber(rs.getInt("roomNumber"));
					pv.setDeposit(rs.getInt("deposit"));
					pv.setRent(rs.getInt("rent"));
					pv.setEnterdate(rs.getString("enterDate"));
					pv.setMoney(rs.getInt("money"));
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
			
			return pv;
		}
	 	
	 	public int deleteMember(int midx) {
			int value = 0;
			String sql = "UPDATE home_member SET DELYN='Y' WHERE MidX=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, midx);
				value = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					pstmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			return value;
		} 
	 	
	 	public int memberChangeId(String memberId, String memberPwd, int midx) {
			int value = 0;
			
			String sql = "UPDATE home_member SET MEMBERID = ? where memberpwd = ? AND midx=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);
				pstmt.setInt(3, midx);
				value = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					pstmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			
			
			return value;
		}
	 	
	 	public int memberChangePwd(String memberChangePwd, int midx) {
			int value = 0;
			
			String sql = "UPDATE home_member SET memberpwd = ? where midx=?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberChangePwd);
				pstmt.setInt(2, midx);
				value = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					pstmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			
			
			return value;
		}
	 	
	 	
}
