package jp.co.aforce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jp.co.aforce.beans.MemberInfoBean;

public class MemberInfoDAO extends DAO {

	//会員情報の登録
	public int insert(MemberInfoBean info)throws Exception{
		Connection con = getConnection();
		//自動コミットモードのオフ
		con.setAutoCommit(false);
		PreparedStatement st = con.prepareStatement(
				"INSERT INTO member_info values(?,?,?,?,?,?,?,?,?,?,?,?)"
				);
		st.setString(1, info.getMemId());
		st.setString(2, info.getPw());
		st.setString(3, info.getLname());
		st.setString(4, info.getFname());
		st.setString(5, info.getByear());
		st.setString(6, info.getBmonth());
		st.setString(7, info.getBday());
		st.setString(8, info.getAddress());
		st.setString(9, info.getPhone());
		st.setString(10, info.getEmail());
		st.setString(11, info.getPay());
		st.setString(12, info.getMethod());
		st.executeUpdate();
		
		//会員情報（会員ID）の重複がないかチェックする機能
		st = con.prepareStatement(
				"SELECT * FROM member_info "
				+ "WHERE member_id=?"
				);
		st.setString(1, info.getMemId());
		ResultSet rs = st.executeQuery();
		int line = 0;
		while (rs.next()) {
			line ++;
		}
		if (line == 1) {
			con.commit();
		}else {
			con.rollback();
		}
		//自動コミットモードのオン
		con.setAutoCommit(true);
		st.close();
		con.close();
		return line;
		
	}
	
}
