<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログアウト</title>
</head>
<%--画面 --%>
<body>
ログアウトしました。<br>
<a href="adminLogin.jsp">再ログイン</a>
<a href="../index.jsp">ショッピングサイト確認</a>

<%session.removeAttribute("ab"); %>
</body>
</html>