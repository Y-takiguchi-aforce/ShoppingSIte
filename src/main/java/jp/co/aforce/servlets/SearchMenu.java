package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.DAO.ItemSortDAO;
import jp.co.aforce.beans.ProductInfoBean;
import jp.co.aforce.tool.Page;

/**
 * Servlet implementation class ListView
 */
@WebServlet("/views/SearchMenu")
public class SearchMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchMenu() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		Page.header(out);
		
		//ECサイト商品絞り込み画面
		
		HttpSession session = request.getSession();
	
		try {
		String keyword = request.getParameter("p_name");
		String sort = request.getParameter("sort");
		String sort2 = request.getParameter("sort2");
		
		ItemSortDAO dao = new ItemSortDAO();
		
		switch(sort) {
		case "検索":
			List<ProductInfoBean> searchResult = dao.itemsearch1(keyword);
			session.setAttribute("search", searchResult);
			request.getRequestDispatcher("searchresult.jsp").forward(request, response);
			break;
		
		case "新着順":
			List<ProductInfoBean> search2 = dao.itemsearch2();
			session.setAttribute("search", search2);
			request.getRequestDispatcher("searchresult.jsp").forward(request, response);
			break;
			
		case "価格の安い順":
			List<ProductInfoBean> search3 = dao.itemsearch3();
			session.setAttribute("search", search3);
			request.getRequestDispatcher("searchresult.jsp").forward(request, response);
			break;
			
		case "商品名順(A~)":
			List<ProductInfoBean> search4 = dao.itemsearch4();
			session.setAttribute("search", search4);
			request.getRequestDispatcher("searchresult.jsp").forward(request, response);
			break;
			
		
		}
		
		switch (sort2) {
		case "検索":
			List<ProductInfoBean> searchResult = dao.itemsearch1(keyword);
			session.setAttribute("search", searchResult);
			request.getRequestDispatcher("searchresult.jsp").forward(request, response);
			break;
			
	    case "おしゃれ":
	        List<ProductInfoBean> search5 = dao.itemsearchByCategory("おしゃれ");
	        session.setAttribute("search", search5);
	        request.getRequestDispatcher("searchresult.jsp").forward(request, response);
	        break;

	    case "健康・美容":
	        List<ProductInfoBean> search6 = dao.itemsearchByCategory("健康・美容");
	        session.setAttribute("search", search6);
	        request.getRequestDispatcher("searchresult.jsp").forward(request, response);
	        break;

	    case "お手入れ簡単":
	        List<ProductInfoBean> search7 = dao.itemsearchByCategory("お手入れ簡単");
	        session.setAttribute("search", search7);
	        request.getRequestDispatcher("searchresult.jsp").forward(request, response);
	        break;

	    case "スポーツ":
	        List<ProductInfoBean> search8 = dao.itemsearchByCategory("スポーツ");
	        session.setAttribute("search", search8);
	        request.getRequestDispatcher("searchresult.jsp").forward(request, response);
	        break;

	    case "省スペース":
	        List<ProductInfoBean> search9 = dao.itemsearchByCategory("省スペース");
	        session.setAttribute("search", search9);
	        request.getRequestDispatcher("searchresult.jsp").forward(request, response);
	        break;
	}

		
		
		
		
		} catch (Exception e) {
			e.printStackTrace(out);
		}

		Page.footer(out);

	}

}
