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
 * Servlet implementation class ProductUpdate
 */
@WebServlet("/views/ProductUpdate")
public class ProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Page.header(out);
		
		//登録商品の更新
		
		try {
		//更新情報の入力
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
		int updateline = dao.update(pb);
		
		if(updateline > 0) {
//			request.getRequestDispatcher("productUpdateSuccess.jsp").forward(request, response);
			response.sendRedirect("productUpdateSuccess.jsp");
		}else {
			out.println("情報更新に失敗しました。");
		}
		}catch(Exception e) {
			e.printStackTrace(out);
		}
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
			//更新情報の入力
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
			int updateline = dao.update(pb);
			
			if(updateline > 0) {
				request.getRequestDispatcher("productUpdateSuccess.jsp").forward(request, response);
			}else {
				out.println("情報更新に失敗しました。");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace(out);
		}
	}

}
