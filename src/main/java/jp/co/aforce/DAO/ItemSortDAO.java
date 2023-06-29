package jp.co.aforce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.beans.ProductInfoBean;

public class ItemSortDAO extends DAO{

	//ユーザー側商品一覧画面（キーワード）
		public List<ProductInfoBean> itemsearch1(String keyword)throws Exception{
			List<ProductInfoBean> itemlist = new ArrayList<>();
			
			Connection con = getConnection();
			
			PreparedStatement st = con.prepareStatement(
					"SELECT * FROM product_info WHERE p_name like ?" );
			st.setString(1, "%" + keyword + "%");
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				ProductInfoBean p = new ProductInfoBean();
				p.setPid(rs.getString("p_id"));
				p.setPname(rs.getString("p_name"));
				p.setImage(rs.getString("image"));
				p.setPrice(rs.getInt("price"));
				p.setStock(rs.getInt("stock"));
				p.setCategory1(rs.getString("category_1"));
				p.setCategory2(rs.getString("category_2"));
				itemlist.add(p);
			}
			
			st.close();
			con.close();
			return itemlist;
		}

		
		//新着順並べ替え
		public List<ProductInfoBean> itemsearch2()throws Exception{
			List<ProductInfoBean> itemlist = new ArrayList<>();
			
			Connection con = getConnection();
			
			PreparedStatement st = con.prepareStatement(
					"SELECT * FROM product_info ORDER BY p_id DESC" );
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				ProductInfoBean p = new ProductInfoBean();
				p.setPid(rs.getString("p_id"));
				p.setPname(rs.getString("p_name"));
				p.setImage(rs.getString("image"));
				p.setPrice(rs.getInt("price"));
				p.setStock(rs.getInt("stock"));
				p.setCategory1(rs.getString("category_1"));
				p.setCategory2(rs.getString("category_2"));
				itemlist.add(p);
			}
			
			st.close();
			con.close();
			return itemlist;
		}
		
		
		
		//価格順並べ替え
				public List<ProductInfoBean> itemsearch3()throws Exception{
					List<ProductInfoBean> itemlist = new ArrayList<>();
					
					Connection con = getConnection();
					
					PreparedStatement st = con.prepareStatement(
							"SELECT * FROM product_info ORDER BY price ASC");
					ResultSet rs = st.executeQuery();
					while(rs.next()) {
						ProductInfoBean p = new ProductInfoBean();
						p.setPid(rs.getString("p_id"));
						p.setPname(rs.getString("p_name"));
						p.setImage(rs.getString("image"));
						p.setPrice(rs.getInt("price"));
						p.setStock(rs.getInt("stock"));
						p.setCategory1(rs.getString("category_1"));
						p.setCategory2(rs.getString("category_2"));
						itemlist.add(p);
					}
					
					st.close();
					con.close();
					return itemlist;
				}
				
				
				//商品名順並べ替え
				public List<ProductInfoBean> itemsearch4()throws Exception{
					List<ProductInfoBean> itemlist = new ArrayList<>();
					
					Connection con = getConnection();
					
					PreparedStatement st = con.prepareStatement(
							"SELECT * FROM product_info ORDER BY p_name ASC");
					ResultSet rs = st.executeQuery();
					while(rs.next()) {
						ProductInfoBean p = new ProductInfoBean();
						p.setPid(rs.getString("p_id"));
						p.setPname(rs.getString("p_name"));
						p.setImage(rs.getString("image"));
						p.setPrice(rs.getInt("price"));
						p.setStock(rs.getInt("stock"));
						p.setCategory1(rs.getString("category_1"));
						p.setCategory2(rs.getString("category_2"));
						itemlist.add(p);
					}
					
					st.close();
					con.close();
					return itemlist;
				}
				
				
				//カテゴリー検索
				
				public List<ProductInfoBean> itemsearchByCategory(String category) throws Exception {
				    List<ProductInfoBean> itemlist = new ArrayList<>();
				    Connection con = getConnection();
				    PreparedStatement st = con.prepareStatement(
				            "SELECT * FROM product_info WHERE category_1 = ? OR category_2 = ?");
				    st.setString(1, category);
				    st.setString(2, category);
				    ResultSet rs = st.executeQuery();

				    while (rs.next()) {
				        ProductInfoBean p = new ProductInfoBean();
				        p.setPid(rs.getString("p_id"));
				        p.setPname(rs.getString("p_name"));
				        p.setImage(rs.getString("image"));
				        p.setPrice(rs.getInt("price"));
				        p.setStock(rs.getInt("stock"));
				        p.setCategory1(rs.getString("category_1"));
				        p.setCategory2(rs.getString("category_2"));
				        itemlist.add(p);
				    }

				    rs.close();
				    st.close();
				    con.close();
				    return itemlist;
				}

				
				

}
