<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="homes.domain.*" %>
<%
	BoardVo bv = (BoardVo)request.getAttribute("bv");
if (session.getAttribute("midx") == null){
	out.println("<script>alert('로그인해주세요');location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<!-- 부트스트랩 css CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 아이콘 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<title>게시판 수정하기</title>
<script>
function check(){
	var fm = document.frm;
	
		fm.action = "<%=request.getContextPath()%>/board/boardModifyAction.do";
  		fm.method = "post"; 
  		fm.submit(); 
  		
  	return;
}
</script>
<style>
div{
	float : right;
}
</style>
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
<section>
<form name="frm"> 
<table  class="table table-striped table-hover">
<tr>
	<td>제목</td>
	<td><input type="text" name="subject" size="50" value=<%=bv.getSubject() %>></td>
</tr>
<tr>
	<td>내용</td>
	<td><textarea placeholder="내용을 입력해주세요." name="content" cols="100" rows="20" ><%=bv.getContent() %></textarea></td>
</tr>
<tr>
	<td>작성자</td>
	<td><input type="text" name="writer" size="50" value=<%=bv.getWriter() %>></td>
</tr>
<tr>
	<td colspan=2>
		<div>
		<input type="button" name ="btn" value="확인" onclick="check()"> 
		<input type="reset" value="취소" > 
		<input type=hidden name="bidx" value=<%=bv.getBidx() %>>
		</div>
	</td>
</tr>
</table>
</form>
</section>
<footer></footer>
</body>
</html>