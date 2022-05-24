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

</head>
<body>
<header></header>
<nav></nav>
<section>
<div id="left-section">
<div id="main-form">
<table class="table table-striped table-hover">
<thead><tr><td><h4>프로필 변경</h4></td></tr></thead>
<tbody>

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
<table class="table table-sm">
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
</script>

</body>
</html>