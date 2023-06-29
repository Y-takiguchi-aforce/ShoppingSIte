package jp.co.aforce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jp.co.aforce.beans.ProductInfoBean;

public class ProductInfoDAO extends DAO {
	//商品情報の登録
	public int insert(ProductInfoBean info)throws Exception{
		Connection con = getConnection();
		//自動コミットモードのオフ
		con.setAutoCommit(false);
		PreparedStatement st = con.prepareStatement(
				"INSERT INTO product_info values(null,?,?,?,?,?,?)" );
		st.setString(1, info.getPname());
		st.setString(2, info.getImage());
		st.setInt(3, info.getPrice());
		st.setInt(4, info.getStock());
		st.setString(5, info.getCategory1());
		st.setString(6, info.getCategory2());
		st.executeUpdate();
		
		//同じ名前の商品は登録しない
		st = con.prepareStatement(
				"SELECT * FROM product_info WHERE p_name = ?" );
		st.setString(1, info.getPname());
		ResultSet rs = st.executeQuery();
		int insertline = 0;
		while(rs.next()) {
			insertline ++ ;
		}
		
		if (insertline == 1) {
			con.commit();
		}else {
			con.rollback();
		}
		//自動コミットモードのオン
		con.setAutoCommit(true);
		
		st.close();
		con.close();
		
		return insertline;
		
	}
	
	
	//商品情報変更・削除時の検索
	public List<ProductInfoBean> search(String productName)throws Exception{
		List<ProductInfoBean> searchlist = new ArrayList<>();
		
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM product_info WHERE p_name = ?" );
		st.setString(1, productName);
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
			searchlist.add(p);
		}
		
		st.close();
		con.close();
		return searchlist;
	}
	
	
	//商品情報の更新
	public int update(ProductInfoBean info)throws Exception{
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"UPDATE product_info "
				+ "SET p_name = ?,image = ? ,price = ?,stock = ?,category_1 = ?,category_2 = ? "
				+ "WHERE p_id = ?");
		st.setString(1, info.getPname());
		st.setString(2, info.getImage());
		st.setInt(3, info.getPrice());
		st.setInt(4, info.getStock());
		st.setString(5, info.getCategory1());
		st.setString(6, info.getCategory2());
		st.setString(7, info.getPid());
		int updateline = st.executeUpdate();
		
		st.close();
		con.close();
		return updateline;
		
	}
	
	
	
	//商品情報の削除
	public int delete(ProductInfoBean info)throws Exception{
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"DELETE FROM product_info WHERE p_id = ?");
		st.setString(1, info.getPid());
		int deleteline = st.executeUpdate();
		
		st.close();
		con.close();
		return deleteline;
	}
}
