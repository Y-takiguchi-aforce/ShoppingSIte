<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報登録</title>
</head>

<header>
<%@include file="menu.jsp" %>
</header>

<body>

<main>
<section>
■会員情報登録<br>
<%String msg1 = (String)request.getAttribute("success"); %>
<%if (msg1 != null){%>
<p class="success">
<%=msg1 %>
<%} %>
</p>
<%String msg2 = (String)request.getAttribute("failed"); %>
<%if (msg2 != null){%>
<p class="used">
<%=msg2 %>
</p>
<%} %>

<form action="MemberInsert" method="post">
	<p>・会員ID（20文字以内）
	<input type="text" class="example2" name="member_id" max-lendth="20" value="${param.member_id }" required>
	</p>
	
	<p>・パスワード（20文字以内）
	<input type="password" class="example2" name="password" max-length="20" required>
	</p>
	
	<p>・氏名
	姓<input type="text" class="example2" name="last_name" max-length="32" value="${param.last_name }" required>
	名<input type="text" class="example2" name="first_name" max-length="32" value="${param.first_name }" required>
	</p>
	
	<p>・生年月日
	<select name="birth_year" class="field-year" value="${param.birth_year }" required >
			<option value="${param.birth_year }">${param.birth_year }</option>
			<%for (int i = 1920; i <= 2020; i++){ %>
			<option value="<%=i%>"> <%=i %> </option>
			<%} %>
	</select>年
	<select name="birth_month" class="field-month"  required>
			<option value="${param.birth_month }">${param.birth_month }</option>
			<%for (int i = 1; i <= 12; i++){ %>
			<option value="<%=i%>"> <%=i %> </option>
			<%} %>
	</select>月
	<select name="birth_day" class="field-day"  required>
			<option value="${param.birth_day }">${param.birth_day }</option>
			<%for (int i = 1; i <= 31; i++){ %>
			<option value="<%=i%>"> <%=i %> </option>
			<%} %>
	</select>日
	</p>

	<p>・住所
	<input type="text" class="example2" name="address" max-length="128" value="${param.address }" required>
	</p>
	
	<p>・電話番号
	<input type="tel" class="example2" name="phone" max-length="32" value="${param.phone }"
			pattern="\d{1,5}-\d{1,4}-\d{4,5}" title="電話番号は、市外局番からハイフン（-）を入れて入力してください。" required>
	</p>
	
	<p>・メールアドレス
	<input type="email" class="example2" name="email" max-length="128" value="${param.email }"
		title="メールアドレスの形式で入力してください。"required>
	<br></p>
	
	<p>・いつも使う支払方法(あとから変更できます)<br>
	<div class="example2">
	<select name="pay" required >
		<option value="${param.pay }">${param.pay }</option>
		<option value="代引（手数料200円）">代引（手数料200円）</option>
		<option value="コンビニ払い（手数料360円）">コンビニ払い（手数料360円）</option>
		<option value="銀行振込">銀行振込</option>
		<option value="クレジットカード">クレジットカード</option>
		<option value="QR決済">QR決済</option>
	</select>
	</p>
	</div>
	
	
	<p>・いつも使う配送方法(あとから変更できます)<br>
	<div class="example2">
	<select name="method" required>
		<option value="${param.method }">${param.method }</option>
		<option value="ゆうパック（送料無料）">ゆうパック（送料無料）</option>
		<option value="ヤマト運輸（送料360円）">ヤマト運輸（送料360円）</option>
		<option value="佐川急便（送料680円）">佐川急便（送料680円）</option>
	</select>
	</p>
	</div>
	
	<input type="button" name="back" onclick="history.back()" value="戻る">
	<input type="submit" name="insert" value="登録">
	
<br>

</form>
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
	 margin-top: 80px;
	 text-align:left;
	 
}
.footer {
  background-color: #f6f6f6;
  height: 100px;
  display: flex;
}
.example2{
    margin: 10px;
}

.used{
	color:red;
}

.success{
	color:blue;}

</style>

</body>
</html>