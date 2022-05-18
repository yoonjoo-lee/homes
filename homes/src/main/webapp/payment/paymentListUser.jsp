<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="homes.domain.*" %>
<%
	MemberVo pv = (MemberVo)request.getAttribute("pv");
%>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>납부현황</title>
</head>
<body>
<h1>납부현황 임차인</h1>
<h2><%=pv.getMembername() %> 납부현황</h2>
<table border=1>
<tr>
<td>보증금</td>
<td><%=pv.getDeposit() %></td>
</tr>
<tr>
<td>월세</td>
<td><%=pv.getRent() %></td>
</tr>
<tr>
<td>연체</td>
<td></td>
</tr>
<tr>
<td>납부일자</td>
<td>
<%String[] dayandtime=pv.getEnterdate().split(" "); 
String[] yeartoday = dayandtime[0].split("-");
%>
매월 <%=yeartoday[2]%>일
</td>
</tr>
</table>
<table>
<tr>
<td>
<input type="button" name="btn" value="납부하기">
<input type="button" name="btn" value="연락하기">
</td>
</tr>
</table>
</body>
</html>