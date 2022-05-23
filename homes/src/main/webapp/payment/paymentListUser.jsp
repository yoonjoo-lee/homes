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
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
</head>
<body>
<header>
<h1>납부현황 임차인</h1>
</header>
<nav></nav>
<section>
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
<!-- 0000-00-00 00:00:00 과 같은 형식으로 넘어오는 enterdate값을 각각 쪼개서 day에 해당하는 인덱스 하나만 출력하기 -->
<%String[] dayandtime=pv.getEnterdate().split(" "); 
String[] yeartoday = dayandtime[0].split("-");
%>
매월 <%=yeartoday[2]%>일
</td>
</tr>
<tr>
<td>잔액</td>
<td><%=pv.getMoney() %>원</td>
</tr>
</table>
<table>
<tr>
<td>
<input type="button" name="btn" value="납부하기" onClick="payFn()">
<input type="button" name="btn" value="연락하기">
</td>
</tr>
</table>
<form name="frm">
<input type="hidden" name="midx" value=<%=pv.getMidx() %>>
<input type="hidden" name="manager" value=<%=pv.getManager() %>>
</form>
</section>
<aside></aside>
<footer></footer>

<script>

//납부하기 클릭 시 함수 실행
function payFn(){
	if(confirm("월세 "+<%=pv.getRent() %>+"원 납부하시겠습니까?")){
		//월세금액보다 잔액이 더 클 경우 실행 
		if(parseInt(<%=pv.getRent() %>) < parseInt(<%=pv.getMoney() %>)){
			alert(<%=pv.getRent() %>+"원을 납부하였습니다." );
			
			var fm = document.frm;
			
			fm.action = "<%=request.getContextPath()%>/payment/paymentPayAction.do";
			fm.method = "post"; 
			fm.submit();
			
			return;
		}	else{
			alert("잔액이 부족합니다." );
		}
		
		
	}else{
		
	}
	
}

</script>
</body>
</html>