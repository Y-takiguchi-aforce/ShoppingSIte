<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品一覧表</title>
</head>
<body>
<%@page import="jp.co.aforce.DAO.ItemSortDAO" %>
<%@page import="jp.co.aforce.beans.ProductInfoBean, java.util.List" %>


■商品一覧表
<%
ItemSortDAO dao = new ItemSortDAO();
String keyword = "";
List<ProductInfoBean> list = dao.itemsearch1(keyword); %>


<main>
<section>
<input type="button" name="back" onclick="history.back()" value="戻る">
<form action="ProductList" method="post" name="myform">

<table class="example">
	<tr>
		<th>商品ID</th>
		<th>商品名</th>
		<th>画像</th>
		<th>値段（税抜）</th>
		<th>在庫数</th>
		<th>カテゴリー1</th>
		<th>カテゴリー2</th>
		<th>選択</th>
	</tr>


<%for (ProductInfoBean pb: list){ %>

	<tr>
		<td>
		<input type="hidden" name="p_id" max-length="5" value="<%=pb.getPid() %>" readonly><%=pb.getPid() %>
		</td>
		
		<td>
		<input type="hidden" name="p_name" max-length="128" value="<%=pb.getPname() %>" readonly><%=pb.getPname() %>
		</td>
	
		<td>
		<input type="hidden" name="image" value="<%=pb.getImage()%>" readonly><%=pb.getImage()%>
		</td>
	
		<td>
		<input type="hidden" name="price" min="0" max-length="10" value="<%=pb.getPrice() %>" readonly><%=pb.getPrice() %>
		</td>
	
		<td>
		<input type="hidden" name="stock" min="0" max-length="10" value="<%=pb.getStock() %>" readonly><%=pb.getStock() %>
		</td>
	
		<td>
		<select name="category_1" disabled>
			
			<option value="おしゃれ"<%if(pb.getCategory1().equals("おしゃれ")){ %>selected<%} %>>おしゃれ</option>
			<option value="健康・美容"<%if(pb.getCategory1().equals("健康・美容")){ %>selected<%} %>>健康・美容</option>
			<option value="お手入れ簡単"<%if(pb.getCategory1().equals("お手入れ簡単")){ %>selected<%} %>>お手入れ簡単</option>
			<option value="スポーツ"<%if(pb.getCategory1().equals("スポーツ")){ %>selected<%} %>>スポーツ</option>
			<option value="省スペース"<%if(pb.getCategory1().equals("省スペース")){ %>selected<%} %>>省スペース</option>
		</select>
		</td>
	
		<td>
		<select name="category_2" disabled>
			<option value=""<%if(pb.getCategory2().equals("")){ %>selected<%} %>></option>
			<option value="おしゃれ"<%if(pb.getCategory2().equals("おしゃれ")){ %>selected<%} %>>おしゃれ</option>
			<option value="健康・美容"<%if(pb.getCategory2().equals("健康・美容")){ %>selected<%} %>>健康・美容</option>
			<option value="お手入れ簡単"<%if(pb.getCategory2().equals("お手入れ簡単")){ %>selected<%} %>>お手入れ簡単</option>
			<option value="スポーツ"<%if(pb.getCategory2().equals("スポーツ")){ %>selected<%} %>>スポーツ</option>
			<option value="省スペース"<%if(pb.getCategory2().equals("省スペース")){ %>selected<%} %>>省スペース</option>
		</select>
		</td>
	
	
	
		<td>
		<input type="button" name="update" onclick="location.href='ProductUpdateSearch?p_name=<%=pb.getPname() %>'" value="更新">
							
		<input type="button" name="delete" onclick="location.href='ProductDeleteSearch?p_name=<%=pb.getPname() %>'" value="削除">
		</td>
	</tr>
<%} %>
</table>
</form>
</section>
</main>

<%--JS --%>
<script>
function updateProduct(productId) {
    var form = document.createElement('form');
    form.method = 'POST';
    form.action = 'ProductUpdate'; // 必要に応じてアクションURLを変更

    var input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'p_id';
    input.value = productId;
    form.appendChild(input);

    document.body.appendChild(form);
    form.submit();
}
</script>


<%--CSS --%>
<style>
section{
	 
	 margin-top: 50px;
	 width:80%;
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

table {
    border-collapse:  collapse;
	
    }
    
.example{
    width: auto;
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

</style>

</body>
</html>