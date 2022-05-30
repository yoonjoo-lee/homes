<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@page import = "java.util.*" %>
<%@page import = "homes.domain.*" %>
<%
ArrayList<BoardVo> alist = (ArrayList<BoardVo>)request.getAttribute("alist");
PageMaker pm = (PageMaker)request.getAttribute("pm");
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>글목록</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<!-- 부트스트랩 css CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 아이콘 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
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
<form name="frm" action="<%=request.getContextPath()%>/board/boardList.do" method="post">
<table class="searchtable">
<tr>
<td>
<select name="searchType">
<option value="subject">제목</option>
<option value="writer">작성자</option>
</select>
 
<input type="text" name="keyword" size="10">
 
<input type="submit" name="submit" value="검색"> <!--submit 버튼 클릭시  searchType과 keyword를 action의 주소로 보냄 -->
</td>
</tr>
</table>
</form>

<table class="maintable">
<thead>
<tr>
<th>bidx번호</th>
<th>제목 </th>
<th>작성자 </th>
<th>작성일</th> 
</tr>
</thead>


<% for (BoardVo bv : alist) {%>
<tbody>
<tr onclick="location.href='<%=request.getContextPath() %>/board/boardContent.do?bidx=<%=bv.getBidx() %>'">
<td><%=bv.getBidx() %></td>
<td>
<%
for(int i = 1; i <= bv.getLevel_(); i++){
	out.print("&nbsp;&nbsp;");
	if (i==bv.getLevel_()){
		out.println("ㄴ");
	}
}
%>
<%=bv.getSubject() %>
</td>
<td><%=bv.getWriter() %></td>
<td><%=bv.getWriteday() %></td>
</tr>

</tbody>
<% } %>

<tfoot  style="text-align:center;">
<tr>
<th colspan=4>
<% if (pm.isPrev() == true){
	out.println("<a href='"+request.getContextPath()+ "/board/boardList.do?page="+(pm.getStartPage()-1) + "&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+ pm.getScri().getSearchType()+"'>◀</a>");
}
	%>
 
<%
for (int i=pm.getStartPage(); i <= pm.getEndPage(); i++) {
	out.println("<a href='"+request.getContextPath()+"/board/boardList.do?page="+ i +"&keyword=" +pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>"+i+"</a>");
}
%>
 
<% if (pm.isNext() && pm.getEndPage()>0){
	out.println("<a href='"+request.getContextPath()+"/board/boardList.do?page="+(pm.getEndPage()+1)+"&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>▶</a>");
}
%>
</th>
</tr>
</tfoot>
</table>
</section>
<aside></aside>
<footer></footer>
</body>

<script>
//js 세션으로 컬러모드 값 받아와서 body, table 클래스 명 추가 
function changecolor(){
	var mode =sessionStorage.getItem("colormode");
	
	if(mode=="dark"){
		$(".maintable").attr("class","table table-dark table-hover");
	}else{
		$(".maintable").attr("class","table table-hover");
	}
	$('body').addClass(mode);
} 
window.onload = changecolor();

</script>
</html>