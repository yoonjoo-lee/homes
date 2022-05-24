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
	out.println("midx : " + session.getAttribute("midx") + "<br>");
	
	out.println("<a href='"+ request.getContextPath() + "/member/memberLogout.do'>로그아웃</a><br>");
	
	
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/basicstyle.css"> -->
<title>Insert title here</title>
<link href="css/basic.css" rel="stylesheet" />
<!-- 부트스트랩 css CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- 메인 클릭용 스타일 시트 -->
<link rel="stylesheet" href="css/style.css">
<!-- 부트스트랩 아이콘 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

</head>
<body>
<header></header>
<nav></nav>

<section>
<div id="left-section">
<!-- <div id="housediv"><h4 id="housespace">happy house</h4></div> -->
<div class="container">
    <div class="row">
        <div class="col-md-4 col-sm-6">
            <div class="serviceBox" onclick="location.href = '<%=request.getContextPath()%>/board/boardList.do'">
                <h3 class="title">공지사항</h3>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="serviceBox"  onclick="location.href='<%=request.getContextPath()%>/board/boardWrite.do'">
                <h3 class="title"> 글쓰기</h3>
            </div>
        </div>

        <div class="col-md-4 col-sm-6">
            <div class="serviceBox" onclick="location.href = '<%=request.getContextPath()%>/payment/paymentList.do?manager=<%=session.getAttribute("manager")%>&midx=<%=session.getAttribute("midx")%>'">
                <h3 class="title">납부현황</h3>
            </div>
        </div>
    </div>
</div>
</div>




<%-- <div class="container-fluid">
<div class="container-sm"><a href="<%=request.getContextPath()%>/board/boardList.do">공지사항</a></div>
<div class="fluid"><a href="<%=request.getContextPath()%>/board/boardWrite.do">글쓰기</a></div>
<div class="fluid"><a href="<%=request.getContextPath()%>/payment/paymentList.do?manager=<%=session.getAttribute("manager")%>&midx=<%=session.getAttribute("midx")%>">납부현황</a></div>
</div> --%>


<div id="right-section">
<div id="login-area">
<input type="button" id="login-btn" class="btn btn-primary mb-3" value="로그인" onclick="location.href='<%=request.getContextPath()%>/member/memberLogin.do'">
<div id="joinlink">
<a href="<%=request.getContextPath()%>/member/memberJoin.do"><i class="bi bi-person fs-5" ></i>회원가입</a>
</div>
</div>
<a href="<%=request.getContextPath()%>/member/memberMyPage.do?midx=<%=session.getAttribute("midx")%>">마이페이지</a>
<a>알림</a>
</div>
</section>





<%-- <a href="<%=request.getContextPath()%>/member/memberJoin.do">회원가입</a> --%>
<%-- <a href="<%=request.getContextPath()%>/member/memberLogin.do">로그인</a> --%>



<aside>
<%-- <input type="button"  class="btn btn-primary" value="마이페이지" onclick="location.href='<%=request.getContextPath()%>/member/memberMyPage.do?midx=<%=session.getAttribute("midx")%>'">
 --%>
</aside>

<footer></footer>
</body>
</html>