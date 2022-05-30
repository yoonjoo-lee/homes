<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="homes.domain.*" %> 
<%
	MemberVo mv = (MemberVo)request.getAttribute("mv");
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<script src="/jQueryStudy/js/jquery-3.6.0.min.js"></script>
<!-- 부트스트랩 css 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 아이콘 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>

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
<nav></nav>
<section>
<div id="left-section">
<div id="main-form">
<table class="maintable">
<thead><tr><td><h4>프로필 변경</h4></td></tr></thead>
<tbody>

<tr><td onclick="location.href='<%=request.getContextPath()%>/member/memberProfileUpload.do?midx=<%=mv.getMidx() %>'">프로필변경<td></tr>
<tr><td onclick="location.href='<%=request.getContextPath()%>/member/memberChangeId.do?midx=<%=mv.getMidx() %>'">아이디변경<td></tr>
<tr><td onclick="location.href='<%=request.getContextPath()%>/member/memberChangePwd.do?midx=<%=mv.getMidx() %>'">비밀번호변경<td></tr>
<tr><td onClick="outMemberFn()">회원탈퇴<td></tr>
<tr><td onClick="chargeFn()">충전하기<td></tr>
<tr><td><a href="<%=request.getContextPath()%>/member/memberLogout.do">로그아웃</a><td></tr>
</tbody>
</table>
</div>

<form name='frm'>
<input type="hidden" id="charge" name="chargeamount" value=chargeamount>
<input type="hidden" name="midx" value=<%=mv.getMidx() %>>
</form>
</div>
<div id="right-section">
<div id="myinfo">
<table class="maintable2">
<tr><td>
<%if (mv.getUserprofile()!=null){%>
<img style = "border-radius:50%;" 
src="<%=request.getContextPath()%>/img/<%=mv.getUserprofile() %>"  width="40px" height="40px" />
<%}else{ %>
<img style = "border-radius:50%;"
src="<%=request.getContextPath()%>/img/userProfile.jpg"  width="40px" height="40px" />	
<%} %>			
<%=mv.getUserprofile() %><td></tr>
<tr><td><%=mv.getMemberemail() %><td></tr>
<tr><td><%=mv.getMembername() %><td></tr>
<tr><td>아이디 <%=mv.getMemberid() %><td></tr>
<tr><td>비밀번호 <%=mv.getMemberpwd() %><td></tr>
<tr><td><%=mv.getMemberhouse() %> <%=mv.getRoomnumber() %>호<td></tr>
<tr><td>잔액 <%=mv.getMoney() %>원<td></tr>
</table>
</div>
</div>
</section>
<aside></aside>
<footer></footer>
<script>
function outMemberFn(){
	if(confirm("정말 탈퇴하시겠습니까?")){
		
		var fm = document.frm;
		
		fm.action = "<%=request.getContextPath()%>/member/memberDeleteAction.do";
		fm.method = "post"; 
		fm.submit();
		
		return;
	}else{
		
	}
}
//충전하기 클릭 시 실행 
function chargeFn(){
	var chargeamount =prompt("충전할 금액을 입력해주세요.");
	
	if(chargeamount){
		//히든 타입의 chargemount에 value값을 입력한 금액으로 변경하기 
		$("#charge").attr("value", chargeamount);
	
		alert(chargeamount + "원을 충전하였습니다." );
		
		//chargemount갑과 midx값을 담은 form데이터를 memberChargeAction으로 넘겨주기 
		var fm = document.frm;
		
		fm.action = "<%=request.getContextPath()%>/member/memberChargeAction.do";
		fm.method = "post"; 
		fm.submit();
		
		return;		
	}else{
		alert("입력한 금액이 없습니다." );
	}
	
}

//js 세션으로 컬러모드 값 받아와서 body, table 클래스 명 추가 
function changecolor(){
	var mode =sessionStorage.getItem("colormode");
	
	if(mode=="dark"){
		$(".maintable").attr("class","table table-dark table-hover");
		$(".maintable2").attr("class","table table-dark table-sm");
	}else{
		$(".maintable").attr("class","table table-hover");
		$(".maintable2").attr("class","table table-sm");
	}
	$('body').addClass(mode);
} 
window.onload = changecolor();


</script>
</body>
</html>