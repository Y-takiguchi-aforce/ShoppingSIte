package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jp.co.aforce.DAO.ProductInfoDAO;
import jp.co.aforce.beans.ProductInfoBean;
import jp.co.aforce.tool.Page;

/**
 * Servlet implementation class ProductInsert
 */
@WebServlet("/views/ProductInsert")
public class ProductInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductInsert() {
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
		
		//商品の登録
		
		try {
			String p_name = request.getParameter("p_name");
			String image = request.getParameter("image");
			int price = Integer.parseInt(request.getParameter("price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String category1 = request.getParameter("category_1");
			String category2 = request.getParameter("category_2");
			
			ProductInfoBean pb = new ProductInfoBean();
			pb.setPname(p_name);
			pb.setImage(image);
			pb.setPrice(price);
			pb.setStock(stock);
			pb.setCategory1(category1);
			pb.setCategory2(category2);
			
			ProductInfoDAO dao = new ProductInfoDAO();
			int insertline = dao.insert(pb);
			
			if (insertline == 1 ) {
				request.setAttribute("success", "商品を登録しました。");
				request.getRequestDispatcher("productInsert.jsp").forward(request, response);
			}else {
				request.setAttribute("failed", "商品の登録に失敗しました。");
				request.getRequestDispatcher("productInsert.jsp").forward(request, response);
			}
			
		}catch(Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
