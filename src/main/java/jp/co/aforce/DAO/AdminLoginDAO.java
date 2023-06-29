package jp.co.aforce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jp.co.aforce.beans.AdminInfoBean;

//管理者ログイン
public class AdminLoginDAO extends DAO {
	
	public AdminInfoBean search(String admin_id, String pass) throws Exception{
		AdminInfoBean mb = null;
		
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM admin_info WHERE admin_id = ? and pass = ? ");
		st.setString(1, admin_id);
		st.setString(2, pass);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			mb = new AdminInfoBean();
			mb.setAdId(rs.getString("admin_id"));
			mb.setPw(rs.getString("pass"));
			
		}
		
		st.close();
		con.close();
		
		return mb;
		
	}
	
	

}
