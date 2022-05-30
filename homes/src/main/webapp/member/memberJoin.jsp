<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<!-- 부트스트랩 아이콘 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
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
<nav></nav>
<section>
<%-- <a href="<%=request.getContextPath()%>/member/memberJoinManager.do">임대인</a>
<a href="<%=request.getContextPath()%>/member/memberJoinUser.do">임차인</a> --%>
<article>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-sm-2">
            <div class="serviceBox" onclick="location.href = '<%=request.getContextPath()%>/member/memberJoinManager.do'">
                <h3 class="title">임대인</h3>
            </div>
        </div>

        <div class="col-md-6 col-sm-2">
            <div class="serviceBox"  onclick="location.href='<%=request.getContextPath()%>/member/memberJoinUser.do'">
                <h3 class="title">임차인</h3>
            </div>
        </div>

    </div>
</div>
</article>
</section>
<aside></aside>
<footer></footer>
</body>
</html>