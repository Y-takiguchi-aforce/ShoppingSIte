<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品削除画面</title>
</head>
<body>

<%@page import="jp.co.aforce.beans.ProductInfoBean, java.util.List" %>


■商品削除画面
<%List <ProductInfoBean> searchlist = (List<ProductInfoBean>)request.getAttribute("productinfo"); %>
<%for (ProductInfoBean pb: searchlist){ %>

<p>○検索結果

<form action="ProductDelete" method="post" name="myform">

	<p>・商品ID<br>
		<input type="text" name="p_id" max-length="5" value="<%=pb.getPid() %>" readonly>
	<br></p>

	<p>・商品名<br>
		<input type="text" name="p_name" max-length="128" value="<%=pb.getPname() %>" readonly>
	<br></p>
	
	<p>・画像<br>
		now:<input type="hidden" name="imageprev" value="<%=pb.getImage()%>"><%=pb.getImage()%>
	<br></p>
	
	<p>・値段（税抜）<br>
		<input type="number" name="price" min="0" max-length="10" value="<%=pb.getPrice() %>" readonly>
	<br></p>
	
	<p>・在庫数<br>
		<input type="number" name="stock" min="0" max-length="10" value="<%=pb.getStock() %>" readonly>
	<br></p>
	
	<p>・カテゴリー1<br>
		<select name="category_1" disabled>
		
			<option value="おしゃれ"<%if(pb.getCategory1().equals("おしゃれ")){ %>selected<%} %>>おしゃれ</option>
			<option value="健康・美容"<%if(pb.getCategory1().equals("健康・美容")){ %>selected<%} %>>健康・美容</option>
			<option value="お手入れ簡単"<%if(pb.getCategory1().equals("お手入れ簡単")){ %>selected<%} %>>お手入れ簡単</option>
			<option value="スポーツ"<%if(pb.getCategory1().equals("スポーツ")){ %>selected<%} %>>スポーツ</option>
			<option value="省スペース"<%if(pb.getCategory1().equals("省スペース")){ %>selected<%} %>>省スペース</option>
		</select>
	<br></p>
	
	<p>・カテゴリー2<br>
		<select name="category_2" disabled>
		<option value=""<%if(pb.getCategory2().equals("")){ %>selected<%} %>></option>
			<option value="おしゃれ"<%if(pb.getCategory2().equals("おしゃれ")){ %>selected<%} %>>おしゃれ</option>
			<option value="健康・美容"<%if(pb.getCategory2().equals("健康・美容")){ %>selected<%} %>>健康・美容</option>
			<option value="お手入れ簡単"<%if(pb.getCategory2().equals("お手入れ簡単")){ %>selected<%} %>>お手入れ簡単</option>
			<option value="スポーツ"<%if(pb.getCategory2().equals("スポーツ")){ %>selected<%} %>>スポーツ</option>
			<option value="省スペース"<%if(pb.getCategory2().equals("省スペース")){ %>selected<%} %>>省スペース</option>
		</select>
	<br></p>
	
	
	<%} %>
	
	<input type="button" name="back" onclick="history.back()" value="戻る">
	<input type="submit" name="dele" value="削除">

</form>

<%--JS --%>
<script>
'use strict';

document.myform.dele.addEventListener('click', function(){
	var result = window.confirm('削除してよろしいですか？');

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