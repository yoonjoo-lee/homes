<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="homes.domain.*" %>    
<%@page import = "java.util.*" %>
<% String bidx = (String)request.getAttribute("bidx"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/basicstyle.css">
 <script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<script>
function yesdelete(){
	var fm = document.frm;
	
		fm.action = "<%=request.getContextPath()%>/board/boardDeleteAction.do";
		fm.method = "post"; 
		fm.submit(); 
		
	return;
}
</script>
</head>
<body>
<script>
//js 세션으로 컬러모드 값 받아와서 class로 추가하기
function changecolor(){
	var mode =sessionStorage.getItem("colormode");
	$('body').addClass(mode);
} 
window.onload = changecolor();
</script>
<h3>삭제하시겠습니까?</h3>
<form name='frm'>
<input type="button" name="yes" value="확인" onclick="yesdelete()">
<input type="button" name="no" value="취소">
<input type="hidden" name="bidx" value=<%=bidx %>>
</form>

</body>
</html>