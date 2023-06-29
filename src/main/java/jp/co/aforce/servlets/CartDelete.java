package jp.co.aforce.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.beans.ItemBean;

/**
 * Servlet implementation class CartDelete
 */
@WebServlet("/views/CartDelete")
public class CartDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "unchecked", "unused" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemId = request.getParameter("p_id");
        
		
		//カートの個別削除
		
        //カートを取得
        HttpSession session = request.getSession();
        List<ItemBean> cart = (List<ItemBean>) session.getAttribute("cart");
        
        if (cart != null) {
            //指定したIDの商品をcartから探す
            ItemBean itemToRemove = null;
            for (ItemBean item : cart) {
                if (item.getPid().equals(itemId)) {
                    itemToRemove = item;
                    break;
                }
            }
            
            //カートから商品を取り除く
            if (itemToRemove != null) {
                cart.remove(itemToRemove);
                
                //カートのセッションを更新する
                session.setAttribute("cart", cart);
                
               
                request.setAttribute("delete", "アイテムが削除されました。");
            }
        }
        
        request.getRequestDispatcher("cart.jsp").forward(request, response);
        
        if(cart == null) {
        	response.sendRedirect("preview-error-cart.jsp");
        }
    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    }
	

}
