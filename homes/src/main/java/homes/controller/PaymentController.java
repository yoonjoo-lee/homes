package homes.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import homes.service.MemberDao;
import homes.service.PaymentDao;
import homes.domain.BoardVo;
import homes.domain.MemberVo;
import homes.domain.PaymentVo;
import homes.service.BoardDao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.time.LocalDate;
import java.time.ZoneId;
 
public class PaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String uri = request.getRequestURI();
		String pj = request.getContextPath();
		String command = uri.substring(pj.length());
		
		if (command.equals("/payment/paymentList.do")) {

			String manager = request.getParameter("manager");

			String midx_ = request.getParameter("midx");
			
			
			
			if ("Y".equals(manager)) {
				int midx = Integer.parseInt(midx_);
				
				PaymentDao md = new PaymentDao();
				ArrayList<MemberVo> alist = md.paymentSelectAll(midx);
				
				request.setAttribute("alist", alist);
				
				RequestDispatcher rd = request.getRequestDispatcher("/payment/paymentListManager.jsp");
				rd.forward(request, response);
			} else {
				int midx = Integer.parseInt(midx_);	//int형으로 변환
				//2. 처리함
				PaymentDao bd = new PaymentDao();
				MemberVo pv = bd.paymentSelectOne(midx);
				
				request.setAttribute("pv", pv);
				
				RequestDispatcher rd = request.getRequestDispatcher("/payment/paymentListUser.jsp");
				rd.forward(request, response);
			}
		} else if (command.equals("/payment/paymentPayAction.do")) {
			
			String midx_ = request.getParameter("midx");
			int midx = Integer.parseInt(midx_);
			
			String manager = request.getParameter("manager");
			
			
			PaymentDao pd = new PaymentDao();
			int value = pd.payMoney(midx);
			
			if (value==1){
				response.sendRedirect(request.getContextPath()+"/payment/paymentList.do?manager="+manager+"&midx="+midx);
			}else{
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			}
			
		} else if (command.equals("/payment/paymentListUser.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/payment/paymentListUser.jsp");
			rd.forward(request, response);
		} else if (command.equals("/payment/paymentContent.do")) {
			String midx_ = request.getParameter("midx");
			int midx = Integer.parseInt(midx_);
			
			PaymentDao pd = new PaymentDao();
			MemberVo pv = pd.paymentSelectOne(midx);
			
			request.setAttribute("pv", pv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/payment/paymentContent.jsp");
			rd.forward(request, response);
		}
		
		
		
		
	}
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
