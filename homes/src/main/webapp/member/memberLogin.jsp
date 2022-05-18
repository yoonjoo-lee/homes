<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h1>로그인하기</h1>
<form name="frm">
<table>
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
</table>
</form>
</body>
</html>