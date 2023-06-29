<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインしてください</title>
</head>
<header>
<%@include file="menu.jsp" %>
</header>
<body>
<main>
<section>
<a href="login.jsp">ログイン</a>してください。
</section>
</main>

<footer class="footer">
	<div>
	<p>Copyright©2023,Tumbler's</p>
	</div>
</footer>


<%--CSS --%>
<style>
section{
	 margin: auto;
	 margin-top: 50px;
	 text-align:center;
	 font-family: 'Agdasima', sans-serif;
font-family: 'Shippori Mincho', serif;
}
.footer {
  background-color: #f6f6f6;
  height: 100px;
  display: flex;
}

</style>
</body>
</html>