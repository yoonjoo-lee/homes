<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>
<body>
<form action="<%=request.getContextPath()%>/member/memberProfileUploadAction.do" method="post" enctype="multipart/form-data">
	<input class="form-control"  name="profilefilename" type="file" >
	<input type="submit" class="btn btn-primary mb-3" value="프로필 변경">
	
</form>
</body>
</html>