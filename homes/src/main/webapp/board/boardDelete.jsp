<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="homes.domain.*" %>    
<% String bidx = (String)request.getAttribute("bidx"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/basicstyle.css">
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
<h3>삭제하시겠습니까?</h3>
<form name='frm'>
<input type="button" name="yes" value="확인" onclick="yesdelete()">
<input type="button" name="no" value="취소">
<input type="hidden" name="bidx" value=<%=bidx %>>
</form>

</body>
</html>