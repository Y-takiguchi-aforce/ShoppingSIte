package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.DAO.ProductInfoDAO;
import jp.co.aforce.beans.ProductInfoBean;
import jp.co.aforce.tool.Page;

/**
 * Servlet implementation class ProductSearch
 */
@WebServlet("/views/ProductDeleteSearch")
public class ProductDeleteSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeleteSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Page.header(out);
		
		//登録商品の削除（検索）
		
		try {
			//検索したい商品名
			String productName = request.getParameter("p_name");
			
			ProductInfoDAO dao = new ProductInfoDAO();
			List<ProductInfoBean> searchlist = dao.search(productName);
			
			if(searchlist.size() >= 1) {
				request.setAttribute("productinfo", searchlist);
				request.getRequestDispatcher("productDelete.jsp").forward(request, response);
			}else {
				request.setAttribute("error", "商品が見つかりません");
				request.getRequestDispatcher("productDeleteSearch.jsp").forward(request, response);
			}
			
		}catch(Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Page.header(out);
		
		try {
			//検索したい商品名
			String productName = request.getParameter("p_name");
			
			ProductInfoDAO dao = new ProductInfoDAO();
			List<ProductInfoBean> searchlist = dao.search(productName);
			
			if(searchlist.size() >= 1) {
				request.setAttribute("productinfo", searchlist);
				request.getRequestDispatcher("productDelete.jsp").forward(request, response);
			}else {
				request.setAttribute("error", "商品が見つかりません");
				request.getRequestDispatcher("productDeleteSearch.jsp").forward(request, response);
			}
			
		}catch(Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
