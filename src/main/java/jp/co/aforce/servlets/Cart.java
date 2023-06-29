package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
import jp.co.aforce.tool.Page;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/views/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cart() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		Page.header(out);
		
		try {
			HttpSession session = request.getSession();
			
			//ログイン情報の確認
			MemberInfoBean minfo = (MemberInfoBean)session.getAttribute("mb");
			if(minfo == null) {
				//ログインしていない場合、促す
				request.getRequestDispatcher("preview-error-login.jsp").forward(request, response);
				
			}else {
				//ログイン情報からデータを取得する
				MemberInfoBean mb = new MemberInfoBean();
				mb.getMemId();
				mb.getLname();
				mb.getFname();
				mb.getLname();
				mb.getAddress();
				mb.getPhone();
				mb.getEmail();
				mb.getPay();
				mb.getMethod();
				
			}
			
			//cartから数量・小計の変更を読み取り、cartLastに入れる
			session.removeAttribute("cartLast");
			List<ItemBean>cart = (List<ItemBean>)session.getAttribute("cart");
			int size = cart.size();
			for(int k = 1; k <= size; k++) {
			String pId = request.getParameter("p_id" + k);
			String image = request.getParameter("image" + k);
			String pName = request.getParameter("p_name" + k);
			int price = Integer.parseInt(request.getParameter("price" + k));
			int psc = Integer.parseInt(request.getParameter("psc" + k));
			int shoukei = Integer.parseInt(request.getParameter("shoukei" + k));

			List<ItemBean> cartLast = (List<ItemBean>)session.getAttribute("cartLast");
			if(cartLast == null) {
				cartLast = new ArrayList<ItemBean>();
				
			}
			
			ItemBean ib = new ItemBean();
			ib.setPid(pId);
			ib.setImage(image);
			ib.setPname(pName);
			ib.setPrice(price);
			ib.setPsc(psc);
			ib.setShoukei(shoukei);
			cartLast.add(ib);
			
			session.setAttribute("cartLast", cartLast);
			}
			
			//cartLastを注文確認画面で表示する
			List<ItemBean> cartLast = (List<ItemBean>)session.getAttribute("cartLast");
			if(cartLast != null) {
				for(ItemBean ib : cartLast) {
					ib.getPid();
					ib.getImage();
					ib.getPname();
					ib.getPsc();
					ib.getPrice();
					ib.getShoukei();
				}
				
				
				request.getRequestDispatcher("orderConfirm.jsp").forward(request, response);
				
			}
		}catch(Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);
	}

}
