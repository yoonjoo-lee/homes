<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<script>

function check(){
	  	
	  	var fm = document.frm;
	  	
	  	if (fm.subject.value ==""){
	  		alert("제목을 입력하세요");
	  		fm.subject.focus();
	  		return;
	  	}else if (fm.content.value ==""){
	  		alert("내용을 입력하세요");
	  		fm.content.focus();
	  		return;
	  	}else if (fm.writer.value ==""){
	  		alert("작성자를 입력하세요");
	  		fm.writer.focus();
	  		return;
	  	} 
	  		
	  	
 	  		fm.action = "<%=request.getContextPath()%>/board/boardWriteAction.do";
	  		fm.method = "post"; 
	  		fm.enctype = "multipart/form-data";
	  		fm.submit(); 

	  
	   return;
	  }

</script>

</head>
<body>
<header>
<h1>글쓰기</h1>
</header>
<nav></nav>
<section>
<form name="frm"> 
<table border=1>
<tr>
	<td>제목</td>
	<td><input type="text" name="subject" size="50"></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea placeholder="내용을 입력해주세요." name="content" cols="100" rows="20" ></textarea></td>
</tr>
<tr>
	<td>작성자</td>
	<!-- 로그인 정보로 작성자 이름 불러오기(수정 못하게 readonly) -->
	<td><input type="text" name="writer" size="50" value="<%=session.getAttribute("memberName") %>" readonly="readonly"></td>
</tr>

<tr>
	<td>파일</td>
	<td><input type="file" name="filename"></td>
</tr>

<tr>
	<td colspan=2>
		<input type="button" name ="btn" value="확인" onclick="check();"> 
		<input type="reset" value="취소" > 
	</td>
</tr>
</table>
 </form>
 </section>
 <aside></aside>
 <footer></footer>
</body>
</html>