<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jp.co.aforce.beans.ItemBean, java.util.List" %>
<%@page import="jp.co.aforce.beans.MemberInfoBean" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ご注文完了</title>
</head>
<header>
<%@include file="menu.jsp" %>
</header>


<body>
<%String order = (String)session.getAttribute("order_id"); 
List<ItemBean>cartLast = (List<ItemBean>)session.getAttribute("cartLast");
%>
<%String failed = (String)request.getAttribute("failed"); %>
<%if(failed != null){ %>
<%=failed %>
<%}else{ %>
<%="" %>
<%} %>

<%if(cartLast == null){ %>
<%response.sendRedirect("../index.jsp"); %>
<%}else{ %>

<main>
<div class="list">
<section>

<p class="finished">ご注文が完了しました。</p>
<br>
<p class="order">〇ご注文番号：<%=order  %>(お控えください。)</p><br>
<p class="order">○ご注文の商品</p>
	<br>
	
		<table>
		<tr>
			<th></th>
			<th>画像</th>
			<th>商品名</th>
			<th>価格（税抜）</th>
			<th>個数</th>
			<th>小計（税抜）</th>
			
		</tr>
	
	
		<%for(ItemBean ib: cartLast) {%>
		
		<tr>
			<td><input type="hidden" name="p_id" value="<%=ib.getPid() %>"></td>
			<td><input type="hidden" name="image" value="<%=ib.getImage() %>"><img src="../img/<%=ib.getImage() %>" width="93.25"></td>
			<td><input type="hidden" name="p_name" value="<%=ib.getPname() %>"><%=ib.getPname() %></td>
			<td><input type="hidden" name="price" value="<%=ib.getPrice() %>"><%=ib.getPrice() %>円</td>
			<td><input type="hidden" name="psc" value="<%=ib.getPsc() %>"><%=ib.getPsc() %>個</td>
			<td><input type="hidden" name="shoukei" value="<%=ib.getShoukei() %>" readonly><%= ib.getShoukei() %>円</td>
			
		</tr>
		<%} %>
		
		
			<!-- <tr>
			<td><input type="hidden" name="pay" value="pay">円</td>
			<td><input type="hidden" name="method" value="">円</td>
			</tr> -->
			<tr>
			<td class="total" colspan="5">合計（各種手数料込・税10%込）</td>
			<td class="yen"><%= session.getAttribute("total") %>円</td>
			</tr>
			
		</table>


<br>
<ul>
	
	<li><a href="buyHistory.jsp">購入履歴はこちら</a></li>
	<li><a href="../index.jsp">トップへ戻る</a></li>
	<li><a href="logout.jsp">ログアウト</a></li>
	
</ul>
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
section{
	 margin: auto;
	 margin-top: 50px;
	 text-align:center;
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

table {
    border-collapse:  collapse;
}

.price{
	text-align:right;
}

.list{
	margin:auto;
	margin-top:50px;
	text-align:center;
}

tr{
	background: #f5f5f5;
}

</style>
<style>
section{
	 margin: auto;
	 margin-top: 50px;
	 text-align:center;
	 font-family: 'Agdasima', sans-serif;
font-family: 'Shippori Mincho', serif;
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

table {
    border-collapse:  collapse;
}

.price{
	text-align:right;
}

.list{
	margin:auto;
	margin-top:50px;
}

tr{
	background: #f5f5f5;
}

.order{
	text-align:left;
}

main{
height:auto;
text-align:center;
}

.finished{
	text-align:center;
}


</style>

<%} %>
<%  session.removeAttribute("cart");
	session.removeAttribute("cartLast");
	
	
		%>
</body>
</html>