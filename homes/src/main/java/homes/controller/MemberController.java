package homes.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import homes.service.MemberDao;
import homes.domain.MemberVo;

 
@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
	
		String uri = request.getRequestURI();
		String pj = request.getContextPath();
		String command = uri.substring(pj.length());
		System.out.println("command:" + command);
		if (command.equals("/member/memberJoinAction.do")) {
			String memberName = request.getParameter("memberName");
			String memberPhone = request.getParameter("memberPhone");
			String memberJumin = request.getParameter("memberJumin");
			String memberGender = request.getParameter("memberGender");
			String memberId = request.getParameter("memberId");
			String memberEmail = request.getParameter("memberEmail");
			String memberPwd = request.getParameter("memberPwd");
			String memberHouse = request.getParameter("memberHouse");
			String memberCount_ = request.getParameter("memberCount");
			String roomNumber_ = request.getParameter("roomNumber");
			String deposit_ = request.getParameter("deposit");
			String rent_ = request.getParameter("rent");
			//date 받아온거 string에서 date 형태로 변환하기 (아래)
			String enterDate = request.getParameter("enterDate");
			String expirationDate = request.getParameter("expirationDate");
			String manager = request.getParameter("manager");
			
			
			System.out.println(manager);
			
			MemberDao md = new MemberDao();
			//관리자일 경우 insertMemberManager 구문 실행
			if ("Y".equals(manager)) {
				int memberCount = Integer.parseInt(memberCount_);
				int value = md.insertMemberManager(memberName, memberPhone, memberJumin, memberGender, memberId, memberEmail, memberPwd, memberHouse, memberCount, manager);
			
				if (value==1){
					response.sendRedirect(request.getContextPath()+"/member/memberJoin.do");
				}else{
					response.sendRedirect(request.getContextPath()+"/member/memberJoinManager.do");
				}
			}else {	//관리자가 아닐 경우 insertMemberUser 구문 실행
				int roomNumber = Integer.parseInt(roomNumber_);
				int deposit = Integer.parseInt(deposit_);
				int rent = Integer.parseInt(rent_);
				int value = md.insertMemberUser(memberName, memberPhone, memberJumin, memberGender, memberId, memberEmail, memberPwd, memberHouse, roomNumber, deposit, rent, enterDate, expirationDate);
			
				if (value==1){
					response.sendRedirect(request.getContextPath()+"/member/memberJoin.do");
				}else{
					response.sendRedirect(request.getContextPath()+"/member/memberJoinUser.do");
				}
			}
			
		}else if (command.equals("/member/memberJoin.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberJoin.jsp");
			rd.forward(request, response);
		} else if (command.equals("/member/memberJoinManager.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberJoinManager.jsp");
			rd.forward(request, response);
		} else if (command.equals("/member/memberJoinUser.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberJoinUser.jsp");
			rd.forward(request, response);
		} else if (command.equals("/member/memberLogin.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberLogin.jsp");
			rd.forward(request, response);
		} else if(command.equals("/member/memberLoginAction.do")) {
			
			
			//1. 넘어온 값을 받는다
			String memberId = request.getParameter("memberId");
			String memberPwd = request.getParameter("memberPwd");
			
			//2. 처리
			MemberDao md = new MemberDao();
			MemberVo mv = md.memberLogin(memberId, memberPwd);
			
			HttpSession session = request.getSession();
			//3. 이동 
			if (mv != null) {
//				response.sendRedirect(request.getContextPath() + "/index.jsp");
				session.setAttribute("midx", mv.getMidx());
				session.setAttribute("memberId", mv.getMemberid());
				session.setAttribute("memberName", mv.getMembername());
				session.setAttribute("manager", mv.getManager());

				// 로그인 후 boardWrite.jsp 에서 생성한 saveUrl로 다시 보내기 
				if (session.getAttribute("saveUrl") != null) {
					response.sendRedirect((String)session.getAttribute("saveUrl"));
				}else {
					response.sendRedirect(request.getContextPath() + "/member/memberLogin.do");
					
				}
			}else {
				System.out.println("mv 비었음");
				response.sendRedirect(request.getContextPath() + "/member/memberLogin.do");
			}
		} else if (command.equals("/member/memberLogout.do")) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			response.sendRedirect(request.getContextPath() + "/");
		} else if (command.equals("/member/memberMyPage.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberMyPage.jsp");
			rd.forward(request, response);
		} 
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}