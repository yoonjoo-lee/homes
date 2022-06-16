package homes.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/KakaopayController")

public class KakaopayController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		//가상경로 추출
		String uri = request.getRequestURI();
		String pj = request.getContextPath();
		String command = uri.substring(pj.length());
		
		if (command.equals("/kakao/kakaopayAction.do")){
			kakaopayAction(request, response);
//			response.getWriter().write(kakaopayAction());
		}
//			RequestDispatcher rd = request.getRequestDispatcher("/board/boardWrite.jsp");
//			rd.forward(request, response);
	}

	 
	public void kakaopayAction(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("카카오페이 액션 들어옴");
		
		
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
			InputStreamReader reader = new InputStreamReader(inputstream, "UTF-8");
			BufferedReader bufferedreader = new BufferedReader(reader);
			
//			System.out.println(bufferedreader.readLine());
//			System.out.println(bufferedreader.readLine());
			
//			String a = bufferedreader.readLine();
//			System.out.println(a);
			System.out.println(reader);
			String a = bufferedreader.readLine().toString();
			
			
			//System.out.println(bufferedreader.toString());
			
			//bufferedreader.readLine();
			response.setContentType("text/html;charset=utf-8");
			
			PrintWriter pw = response.getWriter();
			
			//pw.append("[{'test':'test'}]");
			pw.append(a);
//			String jsonString = bufferedreader.readLine();
//			System.out.println(jsonString);
			//pw.append(jsonString);
			pw.flush();
			
//			return "a";
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//		doGet(request, response);
	}

}














