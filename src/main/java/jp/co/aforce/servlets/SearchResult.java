package jp.co.aforce.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.beans.ItemBean;
import jp.co.aforce.beans.MemberInfoBean;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/views/searchresult")
public class SearchResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public SearchResult() {
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
	
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        //カートに追加する機能

        // ログイン情報の確認
        MemberInfoBean minfo = (MemberInfoBean) session.getAttribute("mb");
        if (minfo == null) {
            // ログインしていない場合、促す
            request.getRequestDispatcher("preview-error-login.jsp").forward(request, response);
            return;
        }

        try {
            String pId = request.getParameter("p_id");
            String image = request.getParameter("image");
            String pName = request.getParameter("p_name");
            int price = Integer.parseInt(request.getParameter("price" + pId));
            int psc = Integer.parseInt(request.getParameter("psc" + pId));
            int shoukei = Integer.parseInt(request.getParameter("shoukei" + pId));

            List<ItemBean> cart = (List<ItemBean>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
                session.setAttribute("cart", cart);
            }

            // 既にカートに同じ商品が存在するか確認する
            boolean isExistingItem = false;
            for (ItemBean existingItem : cart) {
                if (existingItem.getPid().equals(pId)) {
                    // 同じ商品が存在する場合は数量を更新する
                    existingItem.setPsc(existingItem.getPsc() + psc);
                    existingItem.setShoukei(existingItem.getShoukei() + shoukei);
                    isExistingItem = true;
                    break;
                }
            }

            if (!isExistingItem) {
                // カートに同じ商品が存在しない場合は新たに追加する
                ItemBean item = new ItemBean();
                item.setPid(pId);
                item.setImage(image);
                item.setPname(pName);
                item.setPrice(price);
                item.setPsc(psc);
                item.setShoukei(shoukei);

                cart.add(item);
            }

            response.sendRedirect("cart.jsp");
        } catch (Exception e) {
            e.printStackTrace();
             }
    }
}