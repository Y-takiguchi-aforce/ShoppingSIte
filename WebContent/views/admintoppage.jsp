<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jp.co.aforce.beans.AdminInfoBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者画面</title>
</head>
<body>

<%--エラー --%>
<%AdminInfoBean ab = (AdminInfoBean)session.getAttribute("ab"); %>
<%if(ab != null){%>
<%=ab.getAdId() + "でログイン中です" %>
<%}else{ %>
<%response.sendRedirect("preview-error-adminlogin.jsp"); %>
<%} %>

<%--画面 --%>
<h1>管理者画面</h1>

	<a href="../index.jsp">ショッピングサイト確認</a>

	<ul>
		<li><a href="productInsert.jsp">商品登録</a></li>
		<li><a href="productlist.jsp">一覧から商品を変更・削除</a>
		
		<li>商品名で検索</li>
			<ul>
			<li><a href="productUpdateSearch.jsp">検索から商品を更新</a></li>
			<li><a href="productDeleteSearch.jsp">検索から商品を削除</a></li>
			</ul>
			
		<li><a href="adminlogout.jsp">ログアウト</a></li>
		
	</ul>




</body>
</html>