<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임차인 로그인</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<!-- 부트스트랩 css CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 아이콘 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
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
  	}
  	else if (fm.roomNumber.value ==""){
  		alert("호수를 입력하세요");
  		fm.roomNumber.focus();
  		return;
  	}else if (fm.deposit.value ==""){
  		alert("보증금을 입력하세요");
  		fm.deposit.focus();
  		return;
  	}else if (fm.rent.value ==""){
  		alert("월세를 입력하세요");
  		fm.rent.focus();
  		return;
  	}else if (fm.enterDate.value ==""){
  		alert("입주일을 입력하세요");
  		fm.enterDate.focus();
  		return;
  	}else if (fm.expirationDate.value ==""){
  		alert("계약 해지일을 입력하세요");
  		fm.expirationDate.focus();
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
<script>
//js 세션으로 컬러모드 값 받아와서 class로 추가하기
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
<table id="join-area">
<tr>
<td>
<div class="form-floating">
  <input type="text" class="form-control" name="memberName" placeholder="사용자 이름">
  <label for="floatingPassword">사용자 이름</label>
</div>
<!-- <input type="text" name="memberName" size="30" placeholder="사용자 이름"> -->
</td>
<td>
<div class="form-floating">
  <input type="text" class="form-control" name="memberPhone" placeholder="전화번호">
  <label for="floatingPassword">전화번호</label>
</div>
<!-- <input type="text" name="memberPhone" size="50" placeholder="전화번호"> -->
</td>
</tr>
<tr>
<td>
<div class="form-floating">
  <input type="text" class="form-control" name="memberJumin" placeholder="주민번호">
  <label for="floatingPassword">주민번호</label>
</div>
<!-- <input type="text" name="memberJumin" size="30" placeholder="주민번호"> -->
</td>
<td>
<input type="radio" name="memberGender" value="M" checked>남자
<input type="radio" name="memberGender" value="F" checked>여자
</td>
</tr>
<tr>
<td>
<div class="form-floating">
  <input type="text" class="form-control" name="memberId" placeholder="아이디">
  <label for="floatingPassword">아이디</label>
</div>
<!-- <input type="text" name="memberId" size="30" placeholder="아이디"> -->
</td>
<td>
<div class="form-floating">
  <input type="email" class="form-control" name="memberEmail" placeholder="이메일">
  <label for="floatingPassword">이메일</label>
</div>
<!-- <input type="email" name="memberEmail" size="30" placeholder="이메일"> -->
</td>
</tr>
<tr>
<td>
<div class="form-floating">
  <input type="password" class="form-control" name="memberPwd" placeholder="비밀번호">
  <label for="floatingPassword">비밀번호</label>
</div>
<!-- <input type="password" name="memberPwd" size="30" placeholder="비밀번호"> -->
</td>
<td>
<div class="form-floating">
  <input type="password" class="form-control" name="memberPwd2" placeholder="비밀번호 확인">
  <label for="floatingPassword">비밀번호 확인</label>
</div>
<!-- <input type="password" name="memberPwd2" size="30" placeholder="비밀번호 확인"> -->
</td>
</tr>
<tr>
<td>
<div class="form-floating">
  <input type="text" class="form-control" name="memberHouse" placeholder="빌라명">
  <label for="floatingPassword">빌라명</label>
</div>
<!-- <input type="text" name="memberHouse" size="30" placeholder="빌라명"> -->
</td>
<td>
<div class="form-floating">
  <input type="number" class="form-control" name="roomNumber" placeholder="호수">
  <label for="floatingPassword">호수</label>
</div>
<!-- <input type="number" name="roomNumber" size="30" placeholder="호수"> -->
</td>
</tr>
<tr>
<td>
<div class="form-floating">
  <input type="number" class="form-control" name="deposit" placeholder="보증금">
  <label for="floatingPassword">보증금</label>
</div>
<!-- <input type="number" name="deposit" size="30" placeholder="보증금"> -->
</td>
<td>
<div class="form-floating">
  <input type="number" class="form-control" name="rent" placeholder="월세+관리비">
  <label for="floatingPassword">월세+관리비</label>
</div>
<!-- <input type="number" name="rent" size="30" placeholder="월세+관리비"> -->
</td>
</tr>
<tr>
<td>
<label for="floatingPassword">입주일</label>
<input type="date"  class="form-control" name="enterDate">
</td>
<td>
<label for="floatingPassword">계약해지일</label>
<input type="date"  class="form-control" name="expirationDate">
<!-- 계약해지일<input type="date" name="expirationDate" > -->
</td>
</tr>
<tr>
<td>
<div id="joinlink">
<a href="<%=request.getContextPath()%>/member/memberLogin.do"><i class="bi bi-person fs-5" ></i>로그인하기</a>
</div>
<%-- <a href="<%=request.getContextPath()%>/member/memberLogin.do">로그인하기</a> --%>
</td>
<td>
<div id="btnspace">
<input type="button" name="btn"  class="btn btn-primary mb-3" value="완료" onclick="check();"> 
<input type="reset" name="btn"  class="btn btn-primary mb-3" value="다시작성" > 
</div>
<!-- <input type="button" name="btn" value="완료" onclick="check();">
<input type="reset" value="다시작성"> -->
</td>
</tr>
</table>
</form>
</section>
<aside></aside>
<footer></footer>
</body>
</html>