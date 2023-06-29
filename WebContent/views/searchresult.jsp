<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@page import="jp.co.aforce.beans.ProductInfoBean, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品一覧</title>
</head>

<body>
<%@include file="searchmenu.jsp" %>

<%
List<ProductInfoBean> search = (List<ProductInfoBean>) session.getAttribute("search");
%>


<main>
<div class="list">
<section>

<p class="taxinfo">※税抜表示</p>
<table>


	<tr>
			<th></th>
			<th>画像</th>
			<th>商品名</th>
			<th>価格（税抜）</th>
			<th>購入数</th>
			<th>小計（税抜）</th>
			<th></th>
	</tr>
	
	<% for (ProductInfoBean pb: search) { %>
		<% String i = pb.getPid(); %>
		
		<tr>
			<form action="searchresult" method="post" name="form<%= i %>">
				<td><input type="hidden" name="p_id" value="<%= pb.getPid() %>"></td>
				<td><input type="hidden" name="image" value="<%= pb.getImage() %>"><img src="../img/<%= pb.getImage() %>" width="93.25"></td>
				<td><input type="hidden" name="p_name" value="<%= pb.getPname() %>"><%= pb.getPname() %></td>
				<td class="price"><input type="hidden" id="price<%= i %>" name="price<%= i %>" value="<%= pb.getPrice() %>"><%= pb.getPrice() %>円</td>
				<td>
					<select name="psc<%= i %>" onchange="updateSubtotal(<%= i %>)" required>
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>個
				</td>		
				<td><input type="text" id="shoukei<%= i %>" name="shoukei<%= i %>" value="" readonly>円</td>
				<td><input type="submit" name="add" value="カートに追加"></td>
			</form>	
		</tr>
		
	<% } %>
			
</table>


<input type="button" name="back" onclick="history.back()" value="戻る">

<button id="scroll-to-top-btn">≫</button>

</section>
</div>
</main>

<footer class="footer">
	<div>
	<p>Copyright©2023,Tumbler's</p>
	</div>
</footer>


<%--CSS --%>
<style>
main{
	height:auto;
}
section {
	margin: auto;
	margin-top: 50px;
	text-align: center;
	width:80%;
}

.footer {
	background-color: #f6f6f6;
	height: 100px;
	display: flex;
}

th, td{
	border:solid 1px;
	padding: 10px;
}
th{
	background-color:#CCCCCC;
}

tr:nth-child(even) {
  background: white;
}

tr:nth-child(odd) {
  background: #EEEEEE;
}


.price{
	text-align:right;
}

.list{
	margin:auto;
	margin-top:50px;
}

#scroll-to-top-btn{
	position: fixed;
	bottom: 10px;
	right: 10px;
	height: 50px;
	width: 50px;
	color: #FFF;
	font-size: 32px;
	background-color: #9E9E9E;
	border: none;
	border-radius: 50%;
	outline: none;
	transform: rotate(-90deg);
	
}

.taxinfo{
	text-align:right;
}

</style>


<%--JS --%>
<script>
'use strict';
function updateSubtotal(index) {
	var price = document.getElementById('price' + index).value;
	var quantity = document.forms['form' + index]['psc' + index].selectedIndex;
	var subtotal = price * quantity;
	document.getElementById('shoukei' + index).value = subtotal;
}

//ボタン
const scroll_to_top_btn = document.querySelector('#scroll-to-top-btn');

//クリックイベントを追加
scroll_to_top_btn.addEventListener('click', scroll_to_top);

function scroll_to_top(){
	window.scroll({top: 0, behavior: 'smooth'});

	

};

</script>

</body>
</html>
