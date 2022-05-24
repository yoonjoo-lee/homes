<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" />
<!-- 부트스트랩 css 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script>

function check(){
	  	
	  	var fm = document.frm;
	  	
	  	if (fm.subject.value ==""){
	  		alert("제목을 입력하세요");
	  		fm.subject.focus();
	  		return;
	  	}else if (fm.content.value ==""){
	  		alert("내용을 입력하세요");
	  		fm.content.focus();
	  		return;
	  	}else if (fm.writer.value ==""){
	  		alert("작성자를 입력하세요");
	  		fm.writer.focus();
	  		return;
	  	} 
	  		
	  	
 	  		fm.action = "<%=request.getContextPath()%>/board/boardWriteAction.do";
	  		fm.method = "post"; 
	  		fm.enctype = "multipart/form-data";
	  		fm.submit(); 

	  
	   return;
	  }

</script>

</head>
<body>
<header>
<h1>글쓰기</h1>
</header>
<nav></nav>
<section>
<div id="left-section">
<form name="frm"> 
<table id="main-form">
<tr>
	<td><!-- <input type="text" name="subject" size="50"> -->
	<div class="mb-3">
	  <input type="text" name="subject" class="form-control" placeholder="제목을 입력해주세요">
	</div>
	</td>
</tr>
<tr>
	<td>
	<div class="mb-3">
	  <textarea class="form-control" name="content" placeholder="내용을 입력해주세요" cols="100%" rows="10"></textarea>
	</div>
	<!-- <textarea placeholder="내용을 입력해주세요." name="content" cols="100" rows="20" ></textarea> --></td>
</tr>
<tr>
	<!-- 로그인 정보로 작성자 이름 불러오기(수정 못하게 readonly) -->
	<td>
	<%-- <input type="text" name="writer" size="50" value="<%=session.getAttribute("memberName") %>" readonly="readonly"> --%>
	<input type="text" name="writer" class="form-control"  value="<%=session.getAttribute("memberName") %>" readonly="readonly">
	</td>
</tr>

<tr>
	<td>
	<!-- <input type="file" name="filename"> -->
	<div class="mb-3">
	  <input class="form-control"  name="filename" type="file" >
	</div>
	</td>
</tr>

<tr>
	<td colspan=2>
		<input type="button" name ="btn" class="btn btn-primary mb-3" value="확인" onclick="check();">
		<input type="reset" class="btn btn-primary mb-3" value="취소">
		<!-- <input type="button" name ="btn" value="확인" onclick="check();">  -->
		<!-- <input type="reset" value="취소" >  -->
	</td>
</tr>
</table>
 </form>
</div>
<div id="right-section"></div>
 </section>
 <aside></aside>
 <footer></footer>
</body>
</html>