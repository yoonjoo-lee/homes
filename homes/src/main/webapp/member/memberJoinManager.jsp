<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임대인 회원가입</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<script>
function check(){
	var fm = document.frm;
	
	if (fm.memberName.value ==""){
  		alert("이름을 입력하세요");
  		fm.membernName.focus();
  		return;
	}else if (fm.memberPhone.value == ""){
  		alert("전화번호를 입력하세요");  		
  		fm.memberPhone.focus();
  		return;
  	}else if (fm.memberJumin.value == ""){
  		alert("주민번호를 입력하세요");  		
  		fm.memberJumin.focus();
  		return;
  	}else if (fm.memberId.value ==""){
  		alert("아이디를 입력하세요");
  		fm.memberId.focus();
  		return;
  	}else if (fm.memberEmail.value == ""){
  		alert("이메일을 입력하세요");  		
  		fm.memberEmail.focus();
  		return;
  	}else if (fm.memberPwd.value ==""){
  		alert("비밀번호를 입력하세요");
  		fm.memberPwd.focus();
  		return;
  	}else if (fm.memberPwd2.value ==""){
  		alert("비밀번호 확인을 입력하세요");
  		fm.memberPwd2.focus();
  		return;
  	}else if (fm.memberPwd.value != fm.memberPwd2.value){
  		alert("비밀번호가 일치하지 않습니다.");
  		fm.memberPwd2.value = "";
  		fm.memberPwd2.focus();
  		return;
  	}else if (fm.memberHouse.value ==""){
  		alert("빌라명을 입력하세요");
  		fm.memberHouse.focus();
  		return;
  	}else if (fm.memberCount.value ==""){
  		alert("빌라명을 입력하세요");
  		fm.memberCount.focus();
  		return;
  	}
	
	
	fm.action = "<%=request.getContextPath()%>/member/memberJoinAction.do";
	fm.method = "post"; 
	fm.submit();
	
	return;
}
</script>
</head>
<body>
<header>
<h1>임대인 회원가입</h1>
</header>
<nav></nav>
<section>
<form name="frm">
<table>
<tr>
<td><input type="text" name="memberName" size="30" placeholder="사용자 이름"></td>
<td><input type="text" name="memberPhone" size="50" placeholder="전화번호"></td>
</tr>
<tr>
<td><input type="text" name="memberJumin" size="30" placeholder="주민번호"></td>
<td>
<input type="radio" name="memberGender" value="M" checked>남자
<input type="radio" name="memberGender" value="F" checked>여자
</td>
</tr>
<tr>
<td><input type="text" name="memberId" size="30" placeholder="아이디"></td>
<td><input type="email" name="memberEmail" size="30" placeholder="이메일"></td>
</tr>
<tr>
<td><input type="password" name="memberPwd" size="30" placeholder="비밀번호"></td>
<td><input type="password" name="memberPwd2" size="30" placeholder="비밀번호 확인"></td>
</tr>
<tr>
<td colspan=2)><input type="text" name="memberHouse" size="30" placeholder="빌라명"></td>
</tr>
<tr>
<td colspan=2><input type="number" name="memberCount" size="30" placeholder="세대 수"></td>

</tr>
<tr>
<td><a href="<%=request.getContextPath()%>/member/memberLogin.do">로그인하기</a></td>
<td>
<input type="button" name="btn" value="완료" onclick="check();">
<input type="reset" value="다시작성">
<input type="hidden" name="manager" value='Y'>
</td>
</tr>
</table>
</form>
</section>
<aside></aside>
<footer></footer>
</body>
</html>