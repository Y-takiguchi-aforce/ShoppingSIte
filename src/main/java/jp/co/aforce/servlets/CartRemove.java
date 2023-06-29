package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.tool.Page;

/**
 * Servlet implementation class CartRemove
 */
@WebServlet("/views/CartRemove")
public class CartRemove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartRemove() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Page.header(out);
		
		//カート内商品の全削除
		
		try {
		HttpSession session = request.getSession();
		
		session.removeAttribute("cart");
		
		request.setAttribute("remove", "カートを削除しました。");
		response.sendRedirect("cart.jsp");
		}catch(Exception e) {
		e.printStackTrace(out);
		}
		Page.footer(out);
}
}
