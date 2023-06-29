<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入履歴</title>
</head>
<header>
<%@include file="menu.jsp" %>
</header>

<body>
<main>
<section>

■購入履歴
未実装
<%-- <form action="" method="post">
	<p>ご注文番号：<%= %></p><br>
	<table>
			<tr>
				<th></th>
				<th>商品名</th>
				<th>個数</th>
				<th>小計</th>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td><select>
					<option></option>
				</select>
				</td>
				<td></td>
				
			</tr>
			<tr>
				<td class="goukei" colspan="4">合計</td>
				<td class="yen"><input type="text" name="goukei" class="formpart" readonly>円</td>
			</tr>
			</table>
			
			
		<p>○お届け先</p>
		
			<p>・会員ID
				<input type="text" name="member_id" value="<%= %>" max-lendth="20" readonly>
			<br></p>
		
			<p>・氏名<br>
				姓<input type="text" name="last_name" value="<%= %>" max-length="32" readonly>
				名<input type="text" name="first_name" value="<%= %>" max-length="32" readonly>
			<br></p>
			
			<p>・住所<br>
				<input type="text" name="address" value="<%= %>" max-length="128" readonly>
			<br></p>
			
			<p>・電話番号<br>
				<input type="tel" name="phone_number" value="<%= %>" max-length="32" readonly>
			<br></p>
			
			<p>・メールアドレス<br>
				<input type="email" name="mail_address" value="<%= %>" max-length="128" readonly>
			<br></p>
			
			<p>・いつも使う支払方法<br>
				<select name="pay" disabled>
					<option value="">-</option>
					<option value="200">代引（手数料200円）</option>
					<option value="360">コンビニ払い（手数料360円）</option>
					<option value="0">銀行振込</option>
					<option value="0">クレジットカード</option>
					<option value="0">QR決済</option>
				</select>
			<br></p>
			
			<p>・いつも使う配送方法<br>
				<select name="method" disabled>
					<option value="">-</option>
					<option value="0">ゆうパック（送料無料）</option>
					<option value="360">ヤマト運輸（送料360円）</option>
					<option value="680">佐川急便（送料680円）</option>
				</select>
			<br></p>
		
			<input type="button" name="back" onclick="history.back()" value="戻る">
</form> --%>
</section>
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
	 font-family: 'Agdasima', sans-serif;
font-family: 'Shippori Mincho', serif;
}
.footer {
  background-color: #f6f6f6;
  height: 100px;
  display: flex;
}

</style>

</body>
</html>