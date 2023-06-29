<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jp.co.aforce.beans.MemberInfoBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログアウト</title>
</head>
<header>
<%@include file="menu.jsp" %>
</header>
<body>
<main>
<section>
<%String errormsg = (String)request.getAttribute("error"); %>
<%if(errormsg != null){ %>
<%=errormsg %>
<%}else{ %>
<%="" %>
<%} %>

<div class="loginnow">
<%MemberInfoBean mb = (MemberInfoBean)session.getAttribute("mb"); %>
<%if(mb != null){%>
<%=mb.getMemId() + "でログイン中です" %>

<form action="Logout" method="post" name="logout">
ログアウトする→<input type="submit" name="logout" value="ログアウト">
</form>

<%}else{ %>
<%="ログインしていません" %>

<%} %>
</div>
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

.loginnow{
color:red;
}

</style>


<%--JS --%>
<script>
'use strict';

document.logout.logout.addEventListener('click', function(){
	var result = window.confirm('ログアウトしてよろしいですか？');

	if(result){
		return true;

		}else{
			window.alert('キャンセルしました。');
		return false;
			}
	
})
</script>

</body>
</html>