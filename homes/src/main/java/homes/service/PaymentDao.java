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

import homes.domain.MemberVo;
import homes.domain.PaymentVo;
import homes.domain.BoardVo;
import homes.dbconn.Dbconn;


 
@WebServlet("/PaymentDao")
public class PaymentDao{
	private Connection conn;
	private PreparedStatement pstmt = null;
	
	public PaymentDao() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}
	
	public ArrayList<MemberVo> paymentSelectAll(){
		ArrayList<MemberVo> alist = new ArrayList<MemberVo>();  
		
		ResultSet rs = null;
		String sql = "select * from home_member where delyn='N' AND manager != 'Y' order by midx desc";
		
		try{
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				MemberVo pv = new MemberVo();
				//�Űܴ��
				pv.setMidx(rs.getInt("midx"));
				pv.setMembername(rs.getString("membername"));
				pv.setMemberid(rs.getString("memberid"));
				pv.setEnterdate(rs.getString("enterDate"));
				pv.setExpirationdate(rs.getString("expirationDate"));
			
				
				alist.add(pv);
				
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
	
	public MemberVo paymentSelectOne(int midx) {
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
				pv.setDeposit(rs.getInt("deposit"));
				pv.setRent(rs.getInt("rent"));
				pv.setEnterdate(rs.getString("enterDate"));
				pv.setManager(rs.getString("manager"));
				pv.setMoney(rs.getInt("money"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pv;
	}
	
	public int payMoney(int midx) {
 		int value = 0;
 		
 		String sql = "UPDATE home_member SET money= money - rent, paymentcount = paymentcount+1 WHERE MIDX=?";
		
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
	
 

}
