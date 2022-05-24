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

<title>�۸��</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<!-- ��Ʈ��Ʈ�� css CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<header>
<h1>��������</h1>
</header>
<nav></nav>
<section>
<form name="frm" action="<%=request.getContextPath()%>/board/boardList.do" method="post">
<table class="searchtable">
<tr>
<td>
<select name="searchType">
<option value="subject">����</option>
<option value="writer">�ۼ���</option>
</select>
 
<input type="text" name="keyword" size="10">
 
<input type="submit" name="submit" value="�˻�"> <!--submit ��ư Ŭ����  searchType�� keyword�� action�� �ּҷ� ���� -->
</td>
</tr>
</table>
</form>




<table class="table table-hover">
<thead>
<tr>
<th>bidx��ȣ</th>
<th>���� </th>
<th>�ۼ��� </th>
<th>�ۼ���</th> 
</tr>
</thead>


<% for (BoardVo bv : alist) {%>
<tbody>
<tr>
<td><%=bv.getBidx() %></td>
<td>
<%
for(int i = 1; i <= bv.getLevel_(); i++){
	out.print("&nbsp;&nbsp;");
	if (i==bv.getLevel_()){
		out.println("��");
	}
}
%>
<a href="<%=request.getContextPath() %>/board/boardContent.do?bidx=<%=bv.getBidx() %>"><%=bv.getSubject() %></a>
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
	out.println("<a href='"+request.getContextPath()+ "/board/boardList.do?page="+(pm.getStartPage()-1) + "&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+ pm.getScri().getSearchType()+"'>��</a>");
}
	%>
 
<%
for (int i=pm.getStartPage(); i <= pm.getEndPage(); i++) {
	out.println("<a href='"+request.getContextPath()+"/board/boardList.do?page="+ i +"&keyword=" +pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>"+i+"</a>");
}
%>
 
<% if (pm.isNext() && pm.getEndPage()>0){
	out.println("<a href='"+request.getContextPath()+"/board/boardList.do?page="+(pm.getEndPage()+1)+"&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>��</a>");
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
</html>