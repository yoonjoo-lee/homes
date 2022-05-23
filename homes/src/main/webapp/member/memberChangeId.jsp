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
	
	if (<%=mv.getMemberpwd() %> == fm.memberPwd.value){
			alert("변경 완료");
			
			fm.action = "<%=request.getContextPath()%>/member/memberChangeIdAction.do";
			fm.method = "post";
			fm.submit();
			
			return;
	} else{
		alert("비밀번호가 일치하지 않습니다.");
	}
	
}
</script>
</head>
<body>
<header>
<h1>아이디 변경</h1>
</header>
<nav></nav>
<section>
<form name="frm">
<table>
<tr>
<td><input type="text" name="memberId" placeholder="변경할 아이디"></td>
</tr>
<tr>
<td><input type="password" name="memberPwd" placeholder="비밀번호"></td>
</tr>
<tr>
<td>
<a href="<%=request.getContextPath()%>/member/memberMypage.do">아이디 변경 취소</a>
<input type="button" name="btn" value="변경" onclick="check();">
</td>
</tr>
</table>
<input type="hidden" name="midx" value=<%=mv.getMidx() %>>
</form>
</section>
<aside></aside>
<footer></footer>
</body>
</html>