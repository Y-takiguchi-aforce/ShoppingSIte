<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カートは空です</title>
</head>
<header>
<%@include file="menu.jsp" %>
</header>
<body>
<main>
<section>
<p>カートは空です。</p>
	<input type="button" name="top" onclick="location.href='listview.jsp'" value="商品一覧へ">
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