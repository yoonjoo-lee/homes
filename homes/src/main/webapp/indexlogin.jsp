<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/homes/js/jquery-3.6.0.min.js"></script>
<style>
#container {
    position: relative;
    width: 1130px;
    padding: 20px 30px;
    margin: 0 auto;
    letter-spacing: -.2px;
    background: gray;
}

#header {
    position: relative;
    background: #666666;
    z-index: 2000;
}
#footer {
    background-color: #fafbfc;
    border-top: 1px solid #e4e8eb;
    clear: both;
}
div {
    display: block;
}
#footer .footer_inner {
    width: 1130px;
    padding: 0 30px 92px;
    margin: 0 auto;
}
#left-section {float: left;
    width: 750px; background: gray; border: 1px solid black;  border-radius: 0;}
#right-section {float: right;
    width: 350px; background: #666666; border: 1px solid black; border-radius: 0;}
.themed {
  display: block;
  width: 10em;
  height: 10em;
  background: black;
  color: white;
}

@media (prefers-color-scheme: light) {
  .themed {
    background: white;
    color: black;
  }
}

:root[color-theme='light'] {
  --background: #fff;
  --boxColor: #000;
}

:root[color-theme='dark'] {
  --background: #000;
  --boxColor: #fff;
}

html {
  background: var(--background);
}

.themed {
  display: block;
  width: 10em;
  height: 10em;
  background: var(--boxColor);
  color: var(--background);
  --boxColor-#footer: yellow;
}
</style>

</head>
<body>
<div id="header">ddd<br><br>
</div>
<div id="container">
<div id="left-section"><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></div>
<div id="right-section"><br><br><br><br><br>


<input class="check" type="checkbox" />
<div class="themed">Theme</div>


</div>
</div>
<div id="footer">
<div class="footer_inner">
<br><br><br><br><br><br><br><br>
</div>
</div>
<script>
const $checkbox = document.querySelector('.check');

$checkbox.addEventListener('click', e => {
  if (e.target.checked) {
    document.documentElement.setAttribute('color-theme', 'dark');
  } else {
    document.documentElement.setAttribute('color-theme', 'light');
  }
});
</script>
</body>
</html>