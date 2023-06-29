package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.DAO.AdminLoginDAO;
import jp.co.aforce.beans.AdminInfoBean;
import jp.co.aforce.tool.Page;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/views/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		
		
		HttpSession session = request.getSession();
		
		String memId = request.getParameter("admin_id");
		String pw = request.getParameter("pass");
		
		AdminLoginDAO dao = new AdminLoginDAO();
		AdminInfoBean ab = new AdminInfoBean();
		
		try {
			ab = dao.search(memId, pw);
			
			if (ab != null) {
				session.setAttribute("ab", ab);
				request.getRequestDispatcher("admintoppage.jsp").forward(request, response);
			}else {
				
				request.setAttribute("error", "IDもしくはパスワードが違います。");
				request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
			}
			
		}catch(Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}

