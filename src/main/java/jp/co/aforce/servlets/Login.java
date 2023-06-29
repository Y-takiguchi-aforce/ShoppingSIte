package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.DAO.LoginDAO;
import jp.co.aforce.beans.MemberInfoBean;
import jp.co.aforce.tool.Page;

/**
 * Servlet implementation class Login
 */
@WebServlet("/views/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		PrintWriter out = response.getWriter();
		Page.header(out);
		
		//会員のログイン
		
		HttpSession session = request.getSession();
		
		String memId = request.getParameter("member_id");
		String pw = request.getParameter("password");
		
		LoginDAO dao = new LoginDAO();
		MemberInfoBean mb = new MemberInfoBean();
		
		try {
			mb = dao.search(memId, pw);
			
			if (mb != null) {
				session.setAttribute("mb", mb);
				response.sendRedirect("../index.jsp");
			}else {
				
				request.setAttribute("error", "IDもしくはパスワードが違います。");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}catch(Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
