<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jp.co.aforce.beans.MemberInfoBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
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

<%-- <%String loginMsg = (String)request.getAttribute("login"); %>
<%if(loginMsg != null){ %>
<%=loginMsg %>
<%}else{ %>
<%="" %>
<%} %> --%>
<div class="loginnow">
<%MemberInfoBean mb = (MemberInfoBean)session.getAttribute("mb"); %>
<%if(mb != null){%>
<%=mb.getMemId() + "でログイン中です。" %>

<%}else{ %>
<%="" %>


</div>
<br>
<form action="login" method="post">
	<p>ID（20文字以内）:
	<div class="login"><input type="text" name="member_id" value="${param.member_id }" required ></div></p>
	<p>パスワード（20文字以内）:
	<div class="login"><input type="password" name="password" required></div></p>
	<p><input type="submit" value="ログイン"></p>
	<br>
	<div>
	<a href="memberInsert.jsp">会員登録が済んでいない人はこちら</a>
	</div>
</form>
<%} %>
</main>
</section>

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

.login{
	margin: 10px;
}

</style>
</body>
</html>