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
<!-- 부트스트랩 웹상에 있는거 연동 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
<header>
<h1>로그인하기</h1>
</header>
<nav></nav>
<section>
<form name="frm">
<article>
<div class="form-floating mb-3">
  <input type="text" class="form-control" name="memberId" id="floatingInput" placeholder="아이디">
  <label for="floatingInput">아이디</label>
</div>
<div class="form-floating">
  <input type="password" class="form-control" name="memberPwd" id="floatingPassword" placeholder="비밀번호">
  <label for="floatingPassword">비밀번호</label>
</div>
<div id="btnspace">
<input type="button"  class="btn btn-primary mb-3" value="회원가입" onclick="location.href='<%=request.getContextPath()%>/member/memberJoin.do'">
<input type="button" name="btn"  class="btn btn-primary mb-3" value="로그인" onclick="check();"> 
</div>
</article>
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