<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<!-- bootstrap-3.3.2-dist 안에 있는 css 링크 -->
<%-- <link href="${pageContext.request.contextPath}/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet" /> --%>

<!-- 부트스트랩 CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 아이콘 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<script>
function check(){
	
	var fm = document.frm;
	
	if (fm.memberId.value==""){
		alert("아이디를 입력하세요");
		fm.memberId.focus();
		return;
	}else if (fm.memberPwd.value==""){
		alert("비밀번호를 입력하세요");
		fm.memberPwd.focus();
		return;
	}
	
	fm.action = "<%=request.getContextPath()%>/member/memberLoginAction.do";
	fm.method = "post";
	fm.submit();
	
	return;
}
</script>
</head>
<body>
<script>
function changecolor(){
	var mode =sessionStorage.getItem("colormode");
	$('body').addClass(mode);
} 
window.onload = changecolor();
</script>
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
<form name="frm">
<div id="login-form">
<div id="login-input-form">
<div class="form-floating mb-3">
  <input type="text" class="form-control" name="memberId" id="floatingInput" placeholder="아이디">
  <label for="floatingInput">아이디</label>
</div>
<div class="form-floating">
  <input type="password" class="form-control" name="memberPwd" id="floatingPassword" placeholder="비밀번호">
  <label for="floatingPassword">비밀번호</label>
</div>
</div>
<div id="btnspace">
<input type="button" id="login-btn" name="btn"  class="btn btn-primary mb-3" value="로그인" onclick="check();"> 
</div>
<div id="joinlink">
<a href="<%=request.getContextPath()%>/member/memberJoin.do"><i class="bi bi-person fs-5" ></i>회원가입</a>
</div>
</div>
<%-- <input type="button"  class="btn btn-primary mb-3" value="회원가입" onclick="location.href='<%=request.getContextPath()%>/member/memberJoin.do'">
 --%>
<%-- <table>
<tr>
<td><input type="text" name="memberId" placeholder="아이디"></td>
</tr>
<tr>
<td><input type="password" name="memberPwd" placeholder="비밀번호"></td>
</tr>
<tr>
<td>
<a href="<%=request.getContextPath()%>/member/memberJoin.do">회원가입하기</a>
<input type="button" name="btn" value="로그인" onclick="check();">
</td>
</tr>
</table> --%>
</form>
</section>
<aside></aside>
<footer></footer>
</body>
</html>