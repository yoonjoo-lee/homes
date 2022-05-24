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
</head>
<body>
<header>
<h1>회원가입</h1>
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