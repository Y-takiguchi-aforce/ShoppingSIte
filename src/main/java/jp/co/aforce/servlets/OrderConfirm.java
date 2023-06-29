package jp.co.aforce.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jp.co.aforce.beans.ItemBean;
import jp.co.aforce.tool.Page;

/**
 * Servlet implementation class OrderConfirm
 */
@WebServlet("/views/orderConfirm")
public class OrderConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderConfirm() {
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
		
		//注文送信
		
		try {
			//ご注文番号の生成
			//現在日付を取得する
			Calendar calendar = Calendar.getInstance();
			SimpleDateFormat format = new SimpleDateFormat("yyMMddHHmmss");
			String formattedDate = format.format(calendar.getTime());
			String numMake = "A" + formattedDate;
			System.out.print(numMake);
			
			//購入履歴情報（未実装）
			
			String oid = numMake;
			String pId = request.getParameter("p_id");
			String pName = request.getParameter("p_name");
			int price = Integer.parseInt(request.getParameter("price"));
			int psc = Integer.parseInt(request.getParameter("psc"));
			String memID = request.getParameter("member_id");
			String lastName = request.getParameter("last_name");
			String firstName = request.getParameter("first_name");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			String pay = request.getParameter("pay");
			String method = request.getParameter("method");
			int total = Integer.parseInt(request.getParameter("total"));
		
			HttpSession session = request.getSession();
			List<ItemBean> cartLast = (List<ItemBean>)session.getAttribute("cartLast");
			if(cartLast != null) {
				for(ItemBean ib : cartLast) {
					ib.getPid();
					ib.getImage();
					ib.getPname();
					ib.getPsc();
					ib.getPrice();
					ib.getTotal();
				}
				session.setAttribute("order_id", numMake);
				session.setAttribute("total", total); 
				response.sendRedirect("orderFinish.jsp");
				
			}else {
				request.setAttribute("failed", "エラー");
				}
			
			//購入履歴をDBに保存（未実装）
//			BuyHisBean bb = new BuyHisBean();
//			bb.setOid(orderID);
//			bb.setPid(pId);
//			bb.setPname(pName);
//			bb.setPrice(price);
//			bb.setPsc(psc);
//			bb.setMemId(memID);
//			bb.setLname(lastName);
//			bb.setFname(firstName);
//			bb.setAddredd(address);
//			bb.setPhone(phone);
//			bb.setEmail(email);
//			bb.setPay(pay);
//			bb.setMethod(method);
//			bb.setTotal(total);
//			
//			BuyHisDAO dao = new BuyHisDAO();
//			int insertline = dao.insert(bb);
//			
//			if(insertline == 1) {
//			request.setAttribute("order_id", orderID);
//			response.sendRedirect("orderFinish.jsp");
//			}else {
//			request.setAttribute("failed", "購入できませんでした。");
//			}
		
		}catch(Exception e) {
			e.printStackTrace(out);
		}
		Page.footer(out);

	}
	}
