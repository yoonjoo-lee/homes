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
	
	if (fm.memberPrePwd.value==""){
		alert("현재 비밀번호를 입력하세요");
		fm.memberPrePwd.focus();
		return;
	}else if (fm.memberChangePwd.value ==""){
  		alert("비밀번호를 입력하세요");
  		fm.memberChangePwd.focus();
  		return;
  	}else if (fm.memberChangePwd2.value ==""){
  		alert("비밀번호 확인을 입력하세요");
  		fm.memberChangePwd2.focus();
  		return;
  	}else if (fm.memberChangePwd.value != fm.memberChangePwd2.value){
  		alert("변경 비밀번호가 일치하지 않습니다.");
  		fm.memberChangePwd2.value = "";
  		fm.memberChangePwd2.focus();
  		return;
  	}
	
	if (<%=mv.getMemberpwd() %> == fm.memberPrePwd.value){
			alert("변경 완료");
			
			fm.action = "<%=request.getContextPath()%>/member/memberChangePwdAction.do";
			fm.method = "post";
			fm.submit();
			
			return;
	} else{
		alert("현재 비밀번호가 일치하지 않습니다.");
	}
	
}
</script>
</head>
<body>
<header>
<h1>비밀번호 변경</h1>
</header>
<nav></nav>
<section>
<form name="frm">
<table>
<tr>
<td><input type="password" name="memberPrePwd" placeholder="현재 비밀번호"></td>
</tr>
<tr>
<td><input type="password" name="memberChangePwd" placeholder="변경할 비밀번호"></td>
</tr>
<tr>
<td><input type="password" name="memberChangePwd2" placeholder="비밀번호 확인"></td>
</tr>
<tr>
<td>
<a href="<%=request.getContextPath()%>/member/memberMypage.do">비밀번호 변경 취소</a>
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