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
<!-- 부트스트랩 css CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 아이콘 cdn -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script>
<%
//0000-00-00 00:00:00 과 같은 형식으로 넘어오는 enterdate값을 각각 쪼개기
String[] dayandtime=pv.getEnterdate().split(" "); 
String[] yeartoday = dayandtime[0].split("-");
%>
function paymentcount(){
	let today = new Date();
	/* 전년과 올해 입주일만 있다는 가정하에 납부횟수 계산 */
	var paycount = 0;
	
	//전년입주시
	if(today.getMonth() < <%=(yeartoday[1])%> ){
		
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
	if(today.getDate() >= <%=(yeartoday[2])%>){
		paycount+=1;
	}
	
	<%-- document.write(paycount-<%=pv.getPaymentcount() %>); --%>
	return paycount-<%=pv.getPaymentcount() %>;

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
<section>
<h2><%=pv.getMembername() %> 납부현황</h2>
<table class="maintable">
<tr>
<td>보증금</td>
<td><%=pv.getDeposit() %>원</td>
</tr>
<tr>
<td>월세</td>
<td><%=pv.getRent() %>원</td>
</tr>
<tr>
<td>연체</td>
<td><b>
<script>
function test(){
	document.write(paymentcount());
}
window.onload = test();
</script>회
</b>
</td>
</tr>
<tr>
<td>납부일자</td>
<td>


<%-- console.log(<%out.println(yeartoday[0]+yeartoday[1]+yeartoday[2]);%>); --%>

<%-- <%String[] dayandtime=pv.getEnterdate().split(" "); 
String[] yeartoday = dayandtime[0].split("-");
%> --%>
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
<input type="button" name="btn" class="btn btn-primary mb-3" value="납부하기" onClick="payFn()">
<!-- <input type="button" name="btn" class="btn btn-primary mb-3" value="연락하기"> -->
</td>
</tr>
</table>
<form name="frm">
<input type="hidden" name="midx" value=<%=pv.getMidx() %>>
<input type="hidden" name="manager" value=<%=pv.getManager() %>>
</form>
</section>
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

//const date1 = new Date("2021-09-01");
//const date2 = new Date("2021-10-01");
   

<%-- console.log(<%out.println(yeartoday[0]+yeartoday[1]+yeartoday[2]);%>);
let enterdate = <%=(yeartoday[0]+yeartoday[1]+yeartoday[2])%>;
console.log(enterdate);

var monthdays = [31,28,31,30,31,30,31,31,30,31,30,31];
var daycount = 0;

console.log("연도", today.getFullYear());
if (today.getFullYear() != <%=(yeartoday[0])%>){
	daycount += monthdays[<%=(yeartoday[1])%>-1]-<%=(yeartoday[2])%>;
	for(var i=<%=(yeartoday[1])%>+1; i<=12; i++){
		daycount+=monthdays[i-1]
	}
	for(var i=1; i<=today.getMonth(); i++){
		daycount+=monthdays[i-1]
		console.log(monthdays[i-1]);
	}
	daycount+= today.getDate();
}else{
	
}

let tmp=<%=(yeartoday[0])%>;
tmp = tmp+"-";
tmp = tmp+<%=(yeartoday[1])%>;
tmp = tmp+"-";
tmp = tmp+<%=(yeartoday[2])%>;
tmp=new Date(tmp);
console.log(tmp);
const diffDate = today.getTime() - tmp.getTime();
  
const dateDays = Math.abs(diffDate / (1000 * 3600 * 24));
console.log(daycount);
document.write(dateDays); --%>
</script>

</body>
</html>