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
 * Servlet implementation class ProductDelete
 */
@WebServlet("/views/ProductDelete")
public class ProductDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDelete() {
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
		
		//登録商品の削除
		
		try {
			String pId = request.getParameter("p_id");
			String pName = request.getParameter("p_name");
			String image = request.getParameter("image");
			int price = Integer.parseInt(request.getParameter("price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String cat_1 = request.getParameter("category_1");
			String cat_2 = request.getParameter("category_2");
			
			ProductInfoBean pb = new ProductInfoBean();
			pb.setPid(pId);
			pb.setPname(pName);
			pb.setImage(image);
			pb.setPrice(price);
			pb.setStock(stock);
			pb.setCategory1(cat_1);
			pb.setCategory2(cat_2);
			ProductInfoDAO dao = new ProductInfoDAO();
			int deleteline = dao.delete(pb);
			if(deleteline > 0) {
				request.getRequestDispatcher("productDeleteSuccess.jsp").forward(request, response);
			}else {
				out.println("情報削除に失敗しました。");
			}
		} catch (Exception e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
