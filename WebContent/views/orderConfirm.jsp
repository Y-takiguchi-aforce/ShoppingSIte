<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="jp.co.aforce.beans.ItemBean, java.util.List" %>
<%@page import="jp.co.aforce.beans.MemberInfoBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ご注文内容の確認</title>
</head>
<header>
<%@include file="menu.jsp" %>
</header>
<body>
<% String msg2 = (String) request.getAttribute("failed"); %>
<% if (msg2 != null) { %>
  <%= msg2 %>
<% } %>
<%
MemberInfoBean minfo = (MemberInfoBean) session.getAttribute("mb");
List<ItemBean> cartLast = (List<ItemBean>) session.getAttribute("cartLast");
%>

<%if(cartLast == null){ %>
<%response.sendRedirect("../index.jsp"); %>
<%}else{ %>

<main>
<section>
<form action="orderConfirm" method="post" name="order">
  <p>○ご注文の商品</p>
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

    <% int k = 0; %>
    <% for (ItemBean ib : cartLast) { %>
      <% k++; %>
      <tr>
        <td><input type="hidden" name="p_id" value="<%= ib.getPid() %>"></td>
        <td><input type="hidden" name="image" value="<%= ib.getImage() %>"><img src="../img/<%= ib.getImage() %>" width="93.25"></td>
        <td><input type="hidden" name="p_name" value="<%= ib.getPname() %>"><%= ib.getPname() %></td>
        <td><input type="hidden" name="price" value="<%= ib.getPrice() %>"><%= ib.getPrice() %>円</td>
        <td><input type="hidden" name="psc" value="<%= ib.getPsc() %>"><%= ib.getPsc() %>個</td>
        <td><input type="hidden" name="shoukei<%= k %>" value="<%= ib.getShoukei() %>" readonly><%= ib.getShoukei() %>円</td>
      </tr>
    <% } %>
  </table>

	<br>
  <p class="otodoke">○お届け先</p>
  <br>

  <div class="example2">・会員ID（変更不可）
  	<input type="text" name="member_id" value="<%= minfo.getMemId() %>" maxlength="20" readonly>
  </div>

  <div class="example2">・氏名
    姓<input type="text" name="last_name" value="<%= minfo.getLname() %>" maxlength="32" required>
    名<input type="text" name="first_name" value="<%= minfo.getFname() %>" maxlength="32" required>
  </div>

  <div class="example2">・住所
    <input type="text" name="address" value="<%= minfo.getAddress() %>" maxlength="128" required>
  </div>

  <div class="example2">・電話番号
    <input type="tel" name="phone" maxlength="32" pattern="\d{1,5}-\d{1,4}-\d{4,5}" title="電話番号は、市外局番からハイフン（-）を入れて入力してください。" value="<%= minfo.getPhone() %>" required>
  </div>

  <div class="example2">・メールアドレス
    <input type="email" name="mail_address" maxlength="128" title="メールアドレスの形式で入力してください。" value="<%= minfo.getEmail() %>" required>
  </div>

  <div class="example2">・支払方法
    <select name="pay" id="pay" required>
      <option value="0" <% if (minfo.getPay().equals("")) { %>selected<% } %>>-</option>
      <option value="200" <% if (minfo.getPay().equals("代引（手数料200円）")) { %>selected<% } %>>代引（手数料200円）</option>
      <option value="360" <% if (minfo.getPay().equals("コンビニ払い")) { %>selected<% } %>>コンビニ払い（手数料360円）</option>
      <option value="0" <% if (minfo.getPay().equals("銀行振込")) { %>selected<% } %>>銀行振込</option>
      <option value="0" <% if (minfo.getPay().equals("クレジットカード")) { %>selected<% } %>>クレジットカード</option>
      <option value="0" <% if (minfo.getPay().equals("QR決済")) { %>selected<% } %>>QR決済</option>
    </select>
  </div>
  
 
 
	  <br>
	

  <div class="example2">・配送方法
    <select name="method" id="method" required>
      <option value="0" <% if (minfo.getMethod().equals("")) { %>selected<% } %>>-</option>
      <option value="0" <% if (minfo.getMethod().equals("ゆうパック（送料無料）")) { %>selected<% } %>>ゆうパック（送料無料）</option>
      <option value="360" <% if (minfo.getMethod().equals("ヤマト運輸（送料360円）")) { %>selected<% } %>>ヤマト運輸（送料360円）</option>
      <option value="680" <% if (minfo.getMethod().equals("佐川急便（送料680円）")) { %>selected<% } %>>佐川急便（送料680円）</option>
    </select>
  </div>
  
   	  <br>
	  <br>
	

	<div class="total1">
	  	<tr>
		    <td class="total">合計（税10%込）
		    <input type="text" name="total" class="formpart" id="total" required readonly>円</td>
		 </tr>
	  </div>
	 <br>

  <input type="button" name="back" onclick="history.back()" value="戻る">
  
  <div class="purchase">
  <input type="submit" name="confirm" value="購入">
  </div>
</form>
</section>
</main>

<%--JS --%>
<script src="../js/_common/scripts/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
  var total = 0;
  <% for (ItemBean ib: cartLast) { %>
    total += <%= ib.getShoukei() %>;
  <% } %>
  document.order.total.value = Math.floor(total * 1.1); //税計算
});

$('#pay').change(function() {
  var selectedPay = $(this).val(); // 選択された支払方法の値を取得
  var currentTotal = parseInt(document.order.total.value); // 現在の合計値を整数に変換
  var additionalAmount = parseInt(selectedPay); // 選択された支払方法の値を整数に変換
  var newTotal = currentTotal + additionalAmount; // 合計値に追加金額を加算
  document.order.total.value = newTotal.toString(); // 加算後の合計値を文字列に変換してフォームに表示

  // 選択を変更したとき足した分を取り消し
  var prevAdditionalAmount = $(this).data('prevAdditionalAmount');
  if (prevAdditionalAmount) {
    var prevTotal = newTotal - prevAdditionalAmount;
    document.order.total.value = prevTotal.toString();
  }

  $(this).data('prevAdditionalAmount', additionalAmount); 
});


$('#method').change(function() {
  var selectedMethod = $(this).val(); // 選択された配送方法の値を取得
  var currentTotal = parseInt(document.order.total.value); // 現在の合計値を整数に変換
  var additionalAmount = parseInt(selectedMethod); // 選択された配送方法の値を整数に変換
  var newTotal = currentTotal + additionalAmount; // 合計値に追加金額を加算
  document.order.total.value = newTotal.toString(); // 加算後の合計値を文字列に変換してフォームに表示

//選択を変更したとき足した分を取り消し
  var prevAdditionalAmount = $(this).data('prevAdditionalAmount');
  if (prevAdditionalAmount) {
    var prevTotal = newTotal - prevAdditionalAmount;
    document.order.total.value = prevTotal.toString();
  }

  $(this).data('prevAdditionalAmount', additionalAmount); 
});

document.order.confirm.addEventListener('click', function(){
	var result = window.confirm('各種手数料・税10%込の合計額を今一度ご確認ください。購入しますか？');
	

	if(result){
		return true;

		}else{
			window.alert('キャンセルしました。');
		return false;
			}
	
})


</script>

<footer class="footer">
<div>
  <p>Copyright©2023, Tumbler's</p>
</div>
</footer>


<%--CSS --%>
<style>
.purchase{
	text-align:right;
}
section{
	 margin: auto;
	 margin-top: 50px;
	 
	 font-family: 'Agdasima', sans-serif;
font-family: 'Shippori Mincho', serif;

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

tr:nth-child(even) {
  background: white;
}

tr:nth-child(odd) {
  background: #EEEEEE;
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

.example2{
    margin: 10px;
}

.total1{
	
	text-align:right;
}

.otodoke{
	text-align:left;
}

main{
	height:auto;
}

</style>

<%} %>

</body>
</html>
