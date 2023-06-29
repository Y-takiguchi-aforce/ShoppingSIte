package jp.co.aforce.beans;


//管理画面ログイン
public class AdminInfoBean implements java.io.Serializable {

	private String admin_id;
	private String pass;
	
	//getメソッド
	public String getAdId() {
		return admin_id;
	}
	
	public String getPw() {
		return pass;
	}
	
	
	//setメソッド
	public void setAdId(String admin_id) {
		this.admin_id = admin_id;
	}
	
	public void setPw(String pass) {
		this.pass = pass;
	}
	

}