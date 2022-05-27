<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (session.getAttribute("midx") == null){
	//로그인 후 다시 현재 페이지로 돌아오기 위해 saveUrl 생성하기 
	session.setAttribute("saveUrl", request.getRequestURI());
	
	out.println("<script>alert('로그인해주세요');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<!-- 부트스트랩 css 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 아이콘 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
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
<table id="main-form">
<tr>
	<td><!-- <input type="text" name="subject" size="50"> -->
	<div class="mb-3">
	  <input type="text" name="subject" class="form-control" placeholder="제목을 입력해주세요">
	</div>
	</td>
</tr>
<tr>
	<td>
	<div class="mb-3">
	  <textarea class="form-control" name="content" placeholder="내용을 입력해주세요" cols="100%" rows="10"></textarea>
	</div>
	<!-- <textarea placeholder="내용을 입력해주세요." name="content" cols="100" rows="20" ></textarea> --></td>
</tr>
<tr>
	<!-- 로그인 정보로 작성자 이름 불러오기(수정 못하게 readonly) -->
	<td>
	<%-- <input type="text" name="writer" size="50" value="<%=session.getAttribute("memberName") %>" readonly="readonly"> --%>
	<input type="text" name="writer" class="form-control"  value="<%=session.getAttribute("memberName") %>" readonly="readonly">
	</td>
</tr>

<tr>
	<td>
	<!-- <input type="file" name="filename"> -->
	<div class="mb-3">
	  <input class="form-control"  name="filename" type="file" >
	</div>
	</td>
</tr>

<tr>
	<td colspan=2>
		<input type="button" name ="btn" class="btn btn-primary mb-3" value="확인" onclick="check();">
		<input type="reset" class="btn btn-primary mb-3" value="취소">
		<!-- <input type="button" name ="btn" value="확인" onclick="check();">  -->
		<!-- <input type="reset" value="취소" >  -->
	</td>
</tr>
</table>
 </form>


 </section>
 <aside></aside>
 <footer></footer>
</body>
</html>