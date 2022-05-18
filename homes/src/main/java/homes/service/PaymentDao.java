package homes.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homes.domain.MemberVo;
import homes.domain.PaymentVo;
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
		String sql = "select * from home_member where delyn='N' order by midx desc";
		
		try{
			System.out.println("페이먼트 셀렉트올 트라이");
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				System.out.println("페이먼트 셀렉트올 와일");
				MemberVo pv = new MemberVo();
				//�Űܴ��
				pv.setMidx(rs.getInt("midx"));
				pv.setMembername(rs.getString("membername"));
				pv.setMemberid(rs.getString("memberid"));
				
				alist.add(pv);
				System.out.println(alist);
			}
		}catch(Exception e){
			System.out.println("페이먼트 셀렉트올 캐치");
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
	
 

}
