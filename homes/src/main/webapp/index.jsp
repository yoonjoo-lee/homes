<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="homes.domain.MemberVo" %>    
<%
if (session.getAttribute("midx") == null){
	//로그인 후 다시 현재 페이지로 돌아오기 위해 saveUrl 생성하기 
	session.setAttribute("saveUrl", request.getRequestURI());
	
	out.println("<script>alert('로그인해주세요');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
}
%>   
<%
if (session.getAttribute("midx") != null){
	out.println("회원 아이디 : " + session.getAttribute("memberId") + "<br>");
	out.println("회원 이름 : "  + session.getAttribute("memberName") + "<br>");
	
	out.println("<a href='"+ request.getContextPath() + "/member/memberLogout.do'>로그아웃</a><br>");
}
%>
<%
	//MemberVo mv = (MemberVo)request.getAttribute("mv");
%>       

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/basicstyle.css"> -->
<title>Insert title here</title>
</head>
<body>
<a>마이페이지</a>
<a>알림</a>
<br>
<a>공지사항nnddddd</a>
<a>글쓰기</a>
<a href="<%=request.getContextPath()%>/payment/paymentList.do?manager=<%=session.getAttribute("manager")%>">납부현황</a>
<a href="<%=request.getContextPath()%>/member/memberJoin.do">회원가입</a>
<a href="<%=request.getContextPath()%>/member/memberLogin.do">로그인</a>
</body>
</html>