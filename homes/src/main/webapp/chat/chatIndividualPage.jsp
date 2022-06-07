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

function chatListFunction(type){
	//alert(type);
	var midx = <%=session.getAttribute("midx")%>;
	
	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/chatListServlet",
		data: {
			listType: type,
			midx: midx
		},
		success: function (data){
			if(data == ""){
				return;
			}
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for(var i = 0; i < result.length; i++){
 			//	alert(result[i][2].value);
				addChat(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value, result[i][4].value ); 
 				
			}
			lastCidx = Number(parsed.last);
			/* alert(lastCidx); */
		}
	});
}

function chatListRecent(type){
	//alert(type);
	var midx = <%=session.getAttribute("midx")%>;
	
	$.ajax({
		type: "POST",
		url: "<%=request.getContextPath()%>/chatListServlet",
		data: {
			listType: "recentlist",
			midx: midx,
			cidx: type
		},
		success: function (data){
			if(data == ""){
				return;
			}
			var parsed = JSON.parse(data);
			var result = parsed.result;
			for(var i = 0; i < result.length; i++){
 			//	alert(result[i][2].value);
				addChat(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value, result[i][4].value ); 
 				
			}
			lastCidx = Number(parsed.last);
			/* alert(lastCidx); */
		}
	});
}


function addChat(chatName, chatContent,chatTime, userProfile, chatMidx ){
	
	if (userProfile!='null'){
	var profile = '<img  style = "border-radius:50%;"  src='+"<%=request.getContextPath()%>/img/" + userProfile + ' width="40px" height="40px" />';
	} else{
	var profile = '<img style = "border-radius:50%;" src="<%=request.getContextPath()%>/img/userProfile.jpg"  width="40px" height="40px" />';
	} 
	$('#chatList').append('<table border=1>' +
			'<tr height="50" >' +
			'<td >' +
			profile +
			'</td>' +
			'<td width="225">' +
			chatName +
			
			'<span  onclick="clicktest(' +
			chatMidx +
			')">' +
			chatMidx +
			'</span>' +
			
			'</td>' +
			'<td id="chattime" >' +
			chatTime +
			'</td>' +
			'</tr>' +
			'<tr>' +
			'<td>' +
			'</td>' +
			'<td id="chatname">' +
			chatContent +
			'</td>' +
			'</tr>' +
			'</table>'
			);
	$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
	
}
/* $('.number').mouseover(function(){
    var id_check = $(this).attr("id");
    console.log(id_check);
}); */

function clicktest(chatMidx){
	//위에서 상대방의 midx 가져와서 js 세션에 저장하기
	sessionStorage.setItem("chatMidx", chatMidx);
	var url = "<%=request.getContextPath()%>/chat/chatContent.do";
	var name = "message popup page";
	var option = "width = 400, height = 600, top = 100, left = 200, location = no";
	window.open(url,name, option); 
};
	
function getInfiniteChat(){
	setInterval(function(){
		chatListRecent(lastCidx);
	}, 1000);
}

	
</script>
</head>
<body>
	<h3>채팅</h3>
	<!-- overflow-y : auto; 는 아래로 글이 늘어났을 때 자동적으로 늘어남을 의미한다. -->
	<div  id="chatList"  style="overflow-y: auto; width: auto; height: 400px;">
		<!-- 여기에 채팅 테이블 리스트가 생성됨 -->
	</div>

<script>
	$(document).ready(function(){
		chatListFunction('list');
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