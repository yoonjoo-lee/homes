<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
</head>
<body>
<header>
<h1>회원가입</h1>
</header>
<nav></nav>
<section>
<a href="<%=request.getContextPath()%>/member/memberJoinManager.do">임대인</a>
<a href="<%=request.getContextPath()%>/member/memberJoinUser.do">임차인</a>
</section>
<aside></aside>
<footer></footer>
</body>
</html>