<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import = "java.util.*" %>
<%@page import = "homes.domain.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/chat.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<!-- 부트스트랩 css CDN-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<script type="text/javascript">
var lastCidx = 0;
function submitFunction(){
	var chatName = $('#chatName').val();
	var chatContent = $('#chatContent').val();
	var midx = <%=session.getAttribute("midx")%>;
	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/chatSubmitServlet",
		data: {
			chatName: chatName,
			chatContent: chatContent,
			midx: midx
		},
		success: function (result){
			if(result==1){
				autoClosingAlert('#successMessage', 2000);
			}else if (result==0){
				autoClosingAlert('#dangerMessage', 2000);
			}else{
				autoClosingAlert('#warningMessage', 2000);
			}
		}
	});
	$('#chatContent').val('');
}
function autoClosingAlert(selector, delay){
	var alert = $(selector).alert();
	alert.show();
	window.setTimeout(function() {alert.hide()}, delay);
}

function chatListFunction(type){
	//alert(type);
	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/chatListServlet",
		data: {
			listType: type,
		},
		success: function (data){
			if(data == ""){
				return;
			}
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for(var i = 0; i < result.length; i++){
 			//	alert(result[i][2].value);
				addChat(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value); 
 				
			}
			lastCidx = Number(parsed.last);
			/* alert(lastCidx); */
		}
	});
}


function addChat(chatName, chatContent, userProfile, chatTime ){
	if (userProfile!='null'){
	var profile = '<img  style = "border-radius:50%;"  src='+"<%=request.getContextPath()%>/img/" + userProfile + ' width="40px" height="40px" />';
	} else{
	var profile = '<img style = "border-radius:50%;" src="<%=request.getContextPath()%>/img/userProfile.jpg"  width="40px" height="40px" />';
	} 
	$('#chatList').append('<tr height="50">' +
			'<td width="200">' +
			profile +
			'&nbsp;' +
			chatContent +
			'<br>' +
			'<span id="chatname">' +
			chatName +
			'</span>' +
			'</td>' +
			'<td>' +
			'<span id="chattime">' +
			chatTime +
			'</span>' +
			'</td>' +
			'</tr>');
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
}
<%-- <%if (session.getAttribute("userProfile")!=null){%>
<img style = "border-radius:50%;" 
src="<%=request.getContextPath()%>/img/<%=session.getAttribute("userProfile")%>"  width="40px" height="40px" />
<%}else{ %>
<img style = "border-radius:50%;"
src="<%=request.getContextPath()%>/img/userProfile.jpg"  width="40px" height="40px" />	
<%} %> --%>

	
function getInfiniteChat(){
	setInterval(function(){
		chatListFunction(lastCidx);
	}, 500);
}

	
</script>
</head>
<body>
<div id="chat" >
	<h3>채팅</h3>
	<!-- overflow-y : auto; 는 아래로 글이 늘어났을 때 자동적으로 늘어남을 의미한다. -->
	
	<div  style="overflow-y: auto; width: auto; height: 400px;">
		<table  id="chatList"  class="maintable2">
			<tr >
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<table>
		<tr>
			<td>
				<%if (session.getAttribute("userProfile")!=null){%>
				<img style = "border-radius:50%;" 
				src="<%=request.getContextPath()%>/img/<%=session.getAttribute("userProfile")%>"  width="40px" height="40px" />
				<%}else{ %>
				<img style = "border-radius:50%;"
				src="<%=request.getContextPath()%>/img/userProfile.jpg"  width="40px" height="40px" />	
				<%} %>	
				
			</td>
			<td><textarea style="height:80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요" maxlength="100"></textarea></td>
			<td><button type="button" onclick="submitFunction()">전송</button></td>
		</tr>
	</table>
	<input type="hidden" id="chatName" value="<%=session.getAttribute("memberName")%>">
	
	<!-- <div id="chatList" style="overflow-y: auto; width: auto; height: 400px;">

	</div> 
	<div>
		<div>
			<div>
				<input type="hidden" id="chatName" value="<%=session.getAttribute("memberName")%>">
			</div>
		</div>
		<div style="height:90px">
			<div>
				<textarea style="height:80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요" maxlength="100"></textarea>
				<button type="button" onclick="submitFunction()">전송</button>
			</div> 
		</div>
	</div>-->
</div>
					
					
					
					
					
<%-- 	
	<input type="hidden" id="chatName"  value="<%=session.getAttribute("memberName")%>">
	<div class="alert alert-success" id="successMessage" style="display:none;">
		<strong>메시지 전송에 성공하였습니다. </strong>
	</div>
	<div class="alert alert-success" id="dangerMessage" style="display:none;">
		<strong>내용을 입력해주세요. </strong>
	</div>
	<div class="alert alert-success" id="warningMessage" style="display:none;">
		<strong>데이터베이스 오류가 발생했습니다. </strong>
	</div>
 --%>


<script>
	$(document).ready(function(){
		chatListFunction('ten');
		getInfiniteChat();
	});
	
	//js 세션으로 컬러모드 값 받아와서 body, table 클래스 명 추가 
	function changecolor(){
		var mode =sessionStorage.getItem("colormode");
		
		if(mode=="dark"){
			$(".maintable").attr("class","table table-dark ");
		}else{
			$(".maintable").attr("class","table");
		}
		$('body').addClass(mode);
	} 
	window.onload = changecolor();
	
</script>
</body>
</html>