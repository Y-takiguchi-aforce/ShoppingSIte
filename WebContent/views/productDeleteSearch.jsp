<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品情報検索</title>
</head>
<body>
<%String err = (String)request.getAttribute("error"); %>
<%if (err != null){%>
<%=err %>
<%} %>

<form action="ProductDeleteSearch" method="post">
■商品情報検索(完全一致)<br>
	<input type="text" name="p_name" pattern=".*\S+.*" required>
	<input type="submit" name="search" value="検索"
	<br>
	<input type="button" name="back" onclick="history.back()" value="戻る">
	<br>
	
	

</form>

</body>
</html>