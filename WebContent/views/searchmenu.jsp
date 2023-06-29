<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品検索</title>
</head>
<header>
<%@include file="menu.jsp" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Agdasima&family=Shippori+Mincho&display=swap" rel="stylesheet">

</header>
<body>


<div class="searchview">
<p>■商品検索</p>
	<form action="SearchMenu" method="post" id="form">
	<br>
	<p>・キーワード検索</p>
	<div class="example2">
	<input type="text" name="p_name" value="">
	<input type="submit" name="search" value="検索">
	</div>
	
	
	<p>・商品を並べ替える</p>
	<div class="example2">
	<select name="sort">
		<option value="検索">-</option>
		<option value="新着順">新着順</option>
		<option value="価格の安い順">価格の安い順</option>
		<option value="商品名順(A~)">商品名順(A~)</option>
		<option value="${param.sort }" selected>選択中:${param.sort }</option>
	</select>
	<input type="submit" name="search" value="検索">
	
	</div>
	
	<p>・カテゴリー検索</p>
	<div class="example2">
	<select name="sort2">
		<option value="検索">-</option>
		<option value="おしゃれ">おしゃれ</option>
		<option value="健康・美容">健康・美容</option>
		<option value="お手入れ簡単">お手入れ簡単</option>
		<option value="スポーツ">スポーツ</option>
		<option value="省スペース">省スペース</option>
		<option value="${param.sort2 }"　selected>選択中:${param.sort2 }</option>
	</select>
	<input type="submit" name="search" value="検索">
	</div>

</form>

</div>

<%--CSS --%>
<style>
body{
	background-color:#CCCCCC;
	font-family: 'Agdasima', sans-serif;
	font-family: 'Shippori Mincho', serif;
}
.searchview{
	margin-top: 100px; /* （※）の高さに合わせる */
 	padding-left: 10px;
 	
}
.example2{
    margin: 10px;
}
</style>

<%--JS --%>



</body>
</html>