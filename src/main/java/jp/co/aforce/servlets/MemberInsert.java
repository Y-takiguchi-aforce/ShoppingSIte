package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.DAO.MemberInfoDAO;
import jp.co.aforce.beans.MemberInfoBean;
import jp.co.aforce.tool.Page;

/**
 * Servlet implementation class MemberRegist
 */
@WebServlet("/views/MemberInsert")
public class MemberInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Page.header(out);
		
		//会員登録
		
		try {
			String memID = request.getParameter("member_id");
			String pw = request.getParameter("password");
			String lastName = request.getParameter("last_name");
			String firstName = request.getParameter("first_name");
			String birthYear =request.getParameter("birth_year");
			String birthMonth =request.getParameter("birth_month");
			String birthDay = request.getParameter("birth_day");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String pay = request.getParameter("pay");
			String method = request.getParameter("method");
			
			MemberInfoBean mb = new MemberInfoBean();
			mb.setMemId(memID);
			mb.setPw(pw);
			mb.setLname(lastName);
			mb.setFname(firstName);
			mb.setByear(birthYear);
			mb.setBmonth(birthMonth);
			mb.setBday(birthDay);
			mb.setAddress(address);
			mb.setPhone(phone);
			mb.setEmail(email);
			mb.setPay(pay);
			mb.setMethod(method);
			
			MemberInfoDAO dao = new MemberInfoDAO();
			int insertline = dao.insert(mb);
			
			if(insertline == 1) {
				request.setAttribute("success","会員登録しました。");
				request.getRequestDispatcher("memberInsert.jsp").forward(request, response);
			}
			
		}catch(Exception e) {
			request.setAttribute("failed", "このIDは既に使われています。");
			request.getRequestDispatcher("memberInsert.jsp").forward(request, response);
		
		}
		Page.footer(out);
		
	}

}
