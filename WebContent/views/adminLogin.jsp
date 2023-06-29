<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者画面</title>
</head>
<body>

<%-- エラー --%>
<%String errormsg = (String)request.getAttribute("error"); %>
<%if(errormsg != null){ %>
<%=errormsg %>
<%}else{ %>
<%="" %>
<%} %>

<br>

<%--画面 --%>
■管理者画面

<form action="AdminLogin" method="post">
	<p>管理者ID：<br>
		<input type="text" name="admin_id" value="${param.admin_id }">
	<br></p>
	<p>管理者PW：<br>
		<input type="password" name="pass">
	<br></p>
	<input type="submit" name="login" value="ログイン">
	
	
	

</form>

</body>
</html>