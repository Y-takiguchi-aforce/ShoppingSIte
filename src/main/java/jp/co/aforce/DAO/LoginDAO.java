package jp.co.aforce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jp.co.aforce.beans.MemberInfoBean;

public class LoginDAO extends DAO {
	
	public MemberInfoBean search(String member_id, String password) throws Exception{
		MemberInfoBean mb = null;
		
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"SELECT * FROM member_info WHERE member_id = ? and password = ? ");
		st.setString(1, member_id);
		st.setString(2, password);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			mb = new MemberInfoBean();
			mb.setMemId(rs.getString("member_id"));
			mb.setPw(rs.getString("password"));
			mb.setLname(rs.getString("last_name"));
			mb.setFname(rs.getString("first_name"));
			mb.setByear(rs.getString("birth_year"));
			mb.setBmonth(rs.getString("birth_month"));
			mb.setBday(rs.getString("birth_day"));
			mb.setAddress(rs.getString("address"));
			mb.setPhone(rs.getString("phone"));
			mb.setEmail(rs.getString("email"));
			mb.setPay(rs.getString("pay"));
			mb.setMethod(rs.getString("method"));
		}
		
		st.close();
		con.close();
		
		return mb;
		
	}
	
	

}
