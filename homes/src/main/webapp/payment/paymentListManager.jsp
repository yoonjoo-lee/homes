<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "homes.domain.*" %>
<%
ArrayList<MemberVo> alist = (ArrayList<MemberVo>)request.getAttribute("alist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>납부현황 임대인</h1>

<table border=1>
<thead>
<tr>
<th>세대</th>
<th>성함</th>
<th>현황</th>
<th>납부일</th>
<th>연체횟수</th>
</tr>
</thead>
<% 
for (MemberVo mv : alist) {%>
<tbody>
<tr>
<td><%=mv.getMidx() %>호</td>
<td><%=mv.getMembername() %></td>
<td></td>
<td><%
String[] dayandtime=mv.getEnterdate().split(" ");
String[] yeartoday = dayandtime[0].split("-");
%>
<%=yeartoday[2]%>일
</td>
<td></td>
</tr>
</tbody>
<% } %>
</table>
</body>
</html>












