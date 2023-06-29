package jp.co.aforce.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import jp.co.aforce.beans.BuyHisBean;

public class BuyHisDAO extends DAO {
	public int insert(BuyHisBean buyhisbean)throws Exception{
		Connection con = getConnection();
		
		PreparedStatement st = con.prepareStatement(
				"INSERT INTO buy_history values(?, ?, ?, ?, ?, ?, ?. ?, ?, ?, ?, ?, ?, ?)");
		st.setString(1, buyhisbean.getOid());
		st.setString(2, buyhisbean.getPid());
		st.setString(3, buyhisbean.getPname());
		st.setInt(4, buyhisbean.getPrice());
		st.setInt(5, buyhisbean.getPsc());
		st.setInt(6, buyhisbean.getTotal());
		st.setString(7, buyhisbean.getMemId());
		st.setString(8, buyhisbean.getLname());
		st.setString(9, buyhisbean.getFname());
		st.setString(10, buyhisbean.getAddress());
		st.setString(11, buyhisbean.getPhone());
		st.setString(12, buyhisbean.getEmail());
		st.setString(13, buyhisbean.getPay());
		st.setString(14, buyhisbean.getMethod());
		int insertline = st.executeUpdate();
		
		st.close();
		con.close();
		
		return insertline ;
		
	}
}
