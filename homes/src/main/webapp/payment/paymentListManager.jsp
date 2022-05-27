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
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<!-- 부트스트랩 css CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 아이콘 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">

<!-- <script>
function paymentcount(int year,int month, int day, int paidcount){
	let today = new Date();
	/* 전년과 올해 입주일만 있다는 가정하에 납부횟수 계산 */
	var paycount = 0;
	
	//전년입주시
	if(today.getMonth()+1 < month ){
		
		for(var i=month; i<=12; i++){	//12월까지
			paycount+=1;
		}
		for(var i=1; i<=today.getMonth();i++){	//1월부터 지난달까지
			paycount+=1;
		}
	}
	else{
		//올해입주시 입주달부터 지난달까지
		for(var i=month; i<=today.getMonth();i++){
			paycount+=1;
		}
	}
	//이번달 납부일이 지났는 경우
	if(month!=today.getMonth()+1){
		if(today.getDate() >= day){
			paycount+=1;
		}	
	}
	
	/* document.write(paycount-paidcount);  */
	return paycount-paidcount;

}
</script> -->
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
<table  class="table table-hover">
<thead>
<tr>
<th>세대</th>
<th>성함</th>
<th>납부일</th>
<th>연체횟수</th>

</tr>
</thead>
<% 
for (MemberVo mv : alist) {%>
<tbody>
<tr onclick="location.href='<%=request.getContextPath() %>/payment/paymentContent.do?midx=<%=mv.getMidx() %>'">
<td><%=mv.getMidx() %>호</td>
<td><%=mv.getMembername() %></td>

<td><%
String[] dayandtime=mv.getEnterdate().split(" ");
String[] yeartoday = dayandtime[0].split("-");
%>
<%=yeartoday[2]%>일
</td>

<td>
<script>
function paymentcount(){
	let today = new Date();
	/* 전년과 올해 입주일만 있다는 가정하에 납부횟수 계산 */
	var paycount = 0;
	
	//전년입주시
	if(today.getMonth()+1 < <%=(yeartoday[1])%> ){
		
		for(var i=<%=(yeartoday[1])%>; i<=12; i++){	//12월까지
			paycount+=1;
		}
		for(var i=1; i<=today.getMonth();i++){	//1월부터 지난달까지
			paycount+=1;
		}
	}
	else{
		//올해입주시 입주달부터 지난달까지
		for(var i=<%=(yeartoday[1])%>; i<=today.getMonth();i++){
			paycount+=1;
		}
	}
	//이번달 납부일이 지났는 경우
	if(<%=(yeartoday[1])%>!=today.getMonth()+1){
		if(today.getDate() >= <%=(yeartoday[2])%>){
			paycount+=1;
		}	
	}
	delaycount = paycount-<%=mv.getPaymentcount() %>;
	
	if (delaycount > 0){
		document.write(delaycount); 
		document.write("번 연체");
	}else{
		document.write("납부");
	}
	
	return paycount-<%=mv.getPaymentcount() %>;
} 

<%-- function test(){
	document.write(paymentcount(<%=(yeartoday[0])%>,<%=(yeartoday[1])%>,<%=(yeartoday[2])%>,<%=mv.getPaymentcount() %>););
} --%>
window.onload = paymentcount();
</script>

</td>
</tr>
</tbody>
<% } %>
</table>
</section>
<footer></footer>
</body>
</html>












