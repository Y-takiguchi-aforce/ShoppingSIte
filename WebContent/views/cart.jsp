<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="jp.co.aforce.beans.ItemBean, java.util.List"%>
<%@ page import="jp.co.aforce.beans.MemberInfoBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カート</title>
</head>
<header>
	<%@ include file="menu.jsp"%>
</header>


<body>

	<%
	List<ItemBean> cart = (List<ItemBean>) session.getAttribute("cart");
	%>

	<%
	String delete = (String) request.getAttribute("delete");
	if (delete != null) {
	%>
	<%=delete%>
	<%} else {%>
	<%}%>

	<%--画面 --%>
	<main>
		<div>
			<section>
				<h1 class="cart">■カート</h1>
				<p class="taxinfo">※税抜表示</p>
				<br>

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

					<%
					if (cart == null) {
					%>
					<%
					response.sendRedirect("preview-error-cart.jsp");
					%>
					<%
					} else {
					%>
					<form action="Cart" method="post" name="cart">
						<%
						int k = 0;
						%>
						<%
						int total = 0;
						%>
						<%
						for (ItemBean ib : cart) {
						%>

						<%
						k++;
						%>
						<tr>
							<td><input type="hidden" name="p_id"
								value="<%=ib.getPid()%>"></td>
							<td><input type="hidden" name="image<%=k%>"
								value="<%=ib.getImage()%>"><img
								src="../img/<%=ib.getImage()%>" width="93.25"></td>
							<td><input type="hidden" name="p_name<%=k%>"
								value="<%=ib.getPname()%>"><%=ib.getPname()%></td>
							<td class="price<%=k%>"><input type="hidden"
								id="price<%=k%>" name="price<%=k%>" value="<%=ib.getPrice()%>"><%=ib.getPrice()%>
								円</td>
							<td class="psc"><select name="psc<%=k%>"
								onchange="keisan<%=k%>()">
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="<%=ib.getPsc()%>" selected>選択中:<%=ib.getPsc()%></option>
							</select>個</td>
							<td><input type="text" name="shoukei<%=k%>"
								id="shoukei<%=k%>" value="<%=ib.getShoukei()%>" readonly>円</td>
							<td><input type="button" name="delete_<%=ib.getPid()%>"
								onclick="location.href='CartDelete?p_id=<%=ib.getPid()%>'"
								value="商品をカートから削除"></td>
						</tr>

						<%
						total += ib.getShoukei();
						%>

						<%
						}
						%>
						<%--  <tr>
                            <td class="total" colspan="5">合計</td>
                            <td class="yen"><input type="text" name="total" id="total" value="<%= total %>" readonly>円</td>
                        </tr> --%>
				</table>

				<div class="next">
					<input type="submit" name="next" value="オプション選択/注文内容確認へ">
				</div>

				</form>

				<%
				}
				%>

				<form action="CartRemove" method="post" name="order">


					<div class="back">
						<input type="button" name="back" onclick="history.back()"
							value="戻る"> <input type="submit" name="remove"
							value="カートを全削除">
					</div>
				</form>


			</section>
		</div>
	</main>

<%--JS --%>
	<script src="../js/_common/scripts/jquery-3.6.4.min.js"></script>
	<script>
    'use strict';

    <%if (cart != null) {%>
    <%int k = 0;%>
    <%int total = 0;%>
    <%for (ItemBean ib : cart) {%>

    <%k++;%>

    function keisan<%=k%>() {
        let psc = document.cart.psc<%=k%>.selectedIndex;
        let price = document.cart.price<%=k%>.value;
        let shoukei = psc * price;
        document.cart.shoukei<%=k%>.value = shoukei;

      
    }

    <%total += ib.getShoukei();%>
    <%}%>
    <%}%>
</script>


	<footer class="footer">
		<div>
			<p>Copyright©2023, Tumbler's</p>
		</div>
	</footer>

<%--CSS --%>
	<style>
.next {
	text-align: right;
}

.back {
	text-align: left;
}

section {
	margin: auto;
	margin-top: 50px;
	text-align: center;
	font-family: 'Agdasima', sans-serif;
	font-family: 'Shippori Mincho', serif;
	width: 80%;
}

main {
	height: auto;
	text-align: center;
}

.footer {
	background-color: #f6f6f6;
	height: 100px;
	display: flex;
}

th, td {
	border: solid 1px;
	padding: 10px;
}

th {
	background-color: #CCCCCC;
}

tr:nth-child(even) {
	background: white;
}

tr:nth-child(odd) {
	background: #EEEEEE;
}

table {
	border-collapse: collapse;
}

.price {
	text-align: right;
}

.list {
	margin: auto;
	margin-top: 50px;
}

tr {
	background: #f5f5f5;
}

.cart {
	text-align: left;
}

.taxinfo {
	text-align: right;
}
</style>

</body>
</html>
