<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品登録画面</title>
</head>
<body>





■商品登録画面<br>
<%String msg1 = (String)request.getAttribute("success"); %>
<%if (msg1 != null){%>
<%=msg1 %>
<%} %>
<%String msg2 = (String)request.getAttribute("failed"); %>
<%if (msg2 != null){%>
<%=msg2 %>
<%} %>

<form action="ProductInsert" method="post" name="myform">

	<p>・商品名<br>
		<input type="text" name="p_name" max-length="128" value="${param.p_name }" required>
	<br></p>
	
	<p>・画像<br>
		<input type="file" id="myfile" name="image" accept="image/*" value="${param.image }" required>
		
	<br></p>
	
	<p>・値段（税抜）<br>
		<input type="number" name="price" min="0" max-length="10" required value="${param.price }">円
	<br></p>
	
	<p>・在庫数<br>
		<input type="number" name="stock" min="0" max-length="10" required value="${param.stock }">個
	<br></p>
	
	<p>・カテゴリー1<br>
		<select name="category_1">
			<option value="${param.category_1 }">${param.category_1 }</option>
			<option value="おしゃれ">おしゃれ</option>
			<option value="健康・美容">健康・美容</option>
			<option value="お手入れ簡単">お手入れ簡単</option>
			<option value="スポーツ">スポーツ</option>
			<option value="省スペース">省スペース</option>
		</select>
	<br></p>
	
	<p>・カテゴリー2<br>
		<select name="category_2">
			<option value=""></option>
			<option value="${param.category_2 }">${param.category_2 }</option>
			<option value="おしゃれ">おしゃれ</option>
			<option value="健康・美容">健康・美容</option>
			<option value="お手入れ簡単">お手入れ簡単</option>
			<option value="スポーツ">スポーツ</option>
			<option value="省スペース">省スペース</option>
		</select>
	<br></p>
	
	<input type="button" name="back" onclick="history.back()" value="戻る">
	<input type="submit" name="insert" value="登録">

</form>

<%--JS --%>
<script>
'use strict';

document.myform.insert.addEventListener('click', function(){
	var result = window.confirm('登録してよろしいですか？');

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