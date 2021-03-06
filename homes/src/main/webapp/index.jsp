<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import = "java.util.*" %>
<%@page import = "homes.domain.*" %>
<%
ArrayList<BoardVo> alist = (ArrayList<BoardVo>)request.getAttribute("alist");
%>

  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/basicstyle.css"> -->
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<!-- 부트스트랩 css CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 메인 클릭용 스타일 시트 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<!-- 부트스트랩 아이콘 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<!-- 카카오페이.jsp 생성? 
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
-->

<script>
//js 세션으로 컬러모드 값 받아와서 body, table 클래스 명 추가 
//table table-borderless table-hover
function changebackground(){
	if($('body').attr('class')=='dark'){
    	$(".dark").attr("class","light");
    	sessionStorage.setItem("colormode", "light");
		$(".btncolormode").text("다크 모드로 보기"); 
	}else{
		$(".light").attr("class","dark");
		sessionStorage.setItem("colormode", "dark");
    	$(".btncolormode").text("라이트 모드로 보기"); 
	}
	console.log($(".btntest").text());
	console.log($('body').attr('class'));
	
	
};


</script>
</head>

<body >

<!-- 헤더부분 homes 클릭 시 메인 화면으로 이동 -->
<header>

<table>
<tr onclick="location.href='<%=request.getContextPath() %>/main/index.do'"><td>
<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="#0066ff" class="bi bi-house-heart" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.707L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.646a.5.5 0 0 0 .708-.707L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5ZM13 7.207l-5-5-5 5V13.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7.207Zm-5-.225C9.664 5.309 13.825 8.236 8 12 2.175 8.236 6.336 5.309 8 6.982Z"/>
</svg></td>
<td><h2 style="color:#0066ff"><b>homes</b></h2></td>
</tr>
</table>
</header>


<section>
<div id="left-section">

<!-- 광고 배너 -->
<div id="top-inner">
 <img src="${pageContext.request.contextPath}/img/legohouse.jpg"
        alt="사진을 출력할 수 없습니다." style="width:100%;
    height:100%;
    object-fit:cover;" >
</div>


<!-- 공지사항 일부, 더보기 이동 -->
<div id="board-inner">
<a id="board-title" onclick="location.href='<%=request.getContextPath() %>/board/boardList.do'"><b>공지게시판></b></a>
<table id="board-inner-list" class="table table-borderless table-hover">
<% 


for (BoardVo bv : alist) {%>
<tbody>
<%--   onclick="location.href='<%=request.getContextPath() %>/board/boardList.do'" --%>
<tr onclick="location.href='<%=request.getContextPath() %>/board/boardContent.do?bidx=<%=bv.getBidx() %>'" >
<td><%=bv.getBidx() %></td>
<td>
<%
for(int i = 1; i <= bv.getLevel_(); i++){
	out.print("&nbsp;&nbsp;");
	if (i==bv.getLevel_()){
		out.println("ㄴ");
	}
}
%>
<%=bv.getSubject() %></td>
<td><%=bv.getWriter() %></td>
<td><%String[] dayandtime=bv.getWriteday().split(" "); 
%><%=dayandtime[0]%></td>
</tr>
</tbody>
<% }  %>
</table>
</div>



<!-- <div id="housediv"><h4 id="housespace">happy house</h4></div> -->
     
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
            <%-- <div class="serviceBox" onclick="location.href = '<%=request.getContextPath()%>/payment/paymentList.do?manager=<%=session.getAttribute("manager")%>&midx=<%=session.getAttribute("midx")%>'">--%>
            <div class="serviceBox" onclick="movetopamentlist();">
                <h3 class="title">납부현황</h3>
            </div>
        </div>
    </div>
</div> 

<script>
//납부현황 클릭시 로그인 검열 후 이동
function movetopamentlist(){
	if(<%=session.getAttribute("midx")%>==null){
		alert("로그인 후 이용해주세요")
	}else{
		location.href = '<%=request.getContextPath()%>/payment/paymentList.do?manager=<%=session.getAttribute("manager")%>&midx=<%=session.getAttribute("midx")%>'
	}
}
</script>



<%-- <div class="container-fluid">
<div class="container-sm"><a href="<%=request.getContextPath()%>/board/boardList.do">공지사항</a></div>
<div class="fluid"><a href="<%=request.getContextPath()%>/board/boardWrite.do">글쓰기</a></div>
<div class="fluid"><a href="<%=request.getContextPath()%>/payment/paymentList.do?manager=<%=session.getAttribute("manager")%>&midx=<%=session.getAttribute("midx")%>">납부현황</a></div>
</div> --%>


<div id="right-section">
<div id="login-area">
<%
if (session.getAttribute("midx") == null){
	//로그인 후 다시 현재 페이지로 돌아오기 위해 saveUrl 생성하기 
	session.setAttribute("saveUrl", request.getRequestURI());
	
//	out.println("<script>alert('로그인해주세요');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
%> 
<input type="button" id="login-btn" class="btn btn-primary mb-3" value="로그인" onclick="location.href='<%=request.getContextPath()%>/member/memberLogin.do'">
<div id="joinlink">
<a href="<%=request.getContextPath()%>/member/memberJoin.do"><i class="bi bi-person fs-5" ></i>회원가입</a>
</div>

<%
}
%>
<%
if (session.getAttribute("midx") != null){
	
	/* out.println("회원 아이디 : " + session.getAttribute("memberId") + "<br>");
	out.println("회원 이름 : "  + session.getAttribute("memberName") + "<br>");
	out.println("midx : " + session.getAttribute("midx") + "<br>"); 
	
	out.println("<a href='"+ request.getContextPath() + "/member/memberLogout.do'>로그아웃</a><br>");*/
%>
<table class="table ">
<tr><td colspan=2>

<%if (session.getAttribute("userProfile")!=null){%>
<img style = "border-radius:50%;" 
src="<%=request.getContextPath()%>/img/<%=session.getAttribute("userProfile")%>"  width="40px" height="40px" />
<%}else{ %>
<img style = "border-radius:50%;"
src="<%=request.getContextPath()%>/img/userProfile.jpg"  width="40px" height="40px" />	
<%} %>			


<b><%=session.getAttribute("memberName")%>님</b>

</td>
<td>
<input type="button" name="btn"  class="btn btn-secondary  btn-sm" value="로그아웃" onclick="location.href='<%= request.getContextPath() %>/member/memberLogout.do'">
</td></tr>
<tr><td colspan=3><%=session.getAttribute("memberEmail")%></td></tr>
<tr>
<td><a href="<%=request.getContextPath()%>/member/memberMyPage.do?midx=<%=session.getAttribute("midx")%>">마이페이지</a></td>
<td><a href = "javascript:individualMessage()" >쪽지</a></td>
<td><a href = "javascript:groupMessage()" >단체메세지</a></td>
</tr>
</table>
<%
}
%> 
</div>
</div>
<div id="btncolormode-area">
<button class="btncolormode" onclick="changebackground();"></button>

 	
    <img src="<%=request.getContextPath()%>/images/kakao_small.png" id="apibtn" alt="My Image">

</div>
<script>
$(function(){
	$('#apibtn').click(function(){
		$.ajax({
			//type: 'POST',
			dataType: 'json', 
			url:'<%=request.getContextPath()%>/kakao/kakaopayAction.do', 
			success:function(data){
				console.log(data);
				var box = data.next_redirect_pc_url;
				window.open(box); 
			},
			error:function(error){
				alert(error);
			}
		});
	});
});
</script>
<!-- 
<input type="button" id="dnN" value="night" onclick="dayAndNight();"> -->
</section>
<%-- <a href="<%=request.getContextPath()%>/member/memberJoin.do">회원가입</a> --%>
<%-- <a href="<%=request.getContextPath()%>/member/memberLogin.do">로그인</a> --%>
<%-- <input type="button"  class="btn btn-primary" value="마이페이지" onclick="location.href='<%=request.getContextPath()%>/member/memberMyPage.do?midx=<%=session.getAttribute("midx")%>'">
 --%>
<footer>
<div class="footer_inner">
</div>
</footer>
</body>


<script>
function individualMessage(){
	var url = "<%=request.getContextPath()%>/chat/chatIndividualPage.do";
	var name = "message popup page";
	var option = "width = 400, height = 600, top = 100, left = 200, location = no";
	window.open(url,name, option);
}
function groupMessage(){
	var url = "<%=request.getContextPath()%>/chat/chatPage.do";
	var name = "message popup page";
	var option = "width = 400, height = 600, top = 100, left = 200, location = no";
	window.open(url,name, option);
}




//js 세션으로 컬러모드 값 받아와서 class로 추가하기
function changecolor(){
	var mode =sessionStorage.getItem("colormode");
	$('body').addClass(mode);
	if(mode=='dark'){
		$(".btncolormode").text("라이트 모드로 보기"); 
	}else{
		$(".btncolormode").text("다크 모드로 보기"); 
	}
	if($('body').attr('class')==null){
		$('body').addClass('light');
		$(".btncolormode").text("다크 모드로 보기"); 
	}
} 
window.onload = changecolor();


</script>
</html>