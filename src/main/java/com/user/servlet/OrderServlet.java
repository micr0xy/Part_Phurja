package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;

import com.DAO.CartDAOImpl;
import com.DAO.ProductOrderImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.ItemDetails;
import com.entity.ProductOrder;
import com.mysql.cj.Session;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));

			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String address = req.getParameter("address");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String paymentMethod = req.getParameter("payment");

			String fullAdd = address + ", " + city + ", " + state;
			DBConnect conn = new DBConnect();
			CartDAOImpl dao = new CartDAOImpl(conn);
			List<Cart> list = dao.getItemByUser(id);

			if (list.isEmpty()) {
				session.setAttribute("failedMsg", "Oops! Cart is empty.");
				resp.sendRedirect("checkout.jsp");
				
			} else {
				
				ProductOrderImpl dao2 = new ProductOrderImpl(conn);
				ProductOrder o = null;
				int j = dao2.getOrderNo();

				ArrayList<ProductOrder> orderList = new ArrayList<ProductOrder>();
				for (Cart c : list) {

					o = new ProductOrder();
					o.setOrderId("PROD-ORD-S00" + j);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhone(phone);
					o.setFullAdd(fullAdd);
					o.setProdName(c.getProductName());
					o.setPrice(c.getPrice() + "");
					o.setPaymentMethod(paymentMethod);
					orderList.add(o);
					j++;

				}

				if ("noselect".equals(paymentMethod)) {
					session.setAttribute("failedMsg", "Choose payment method.");
					resp.sendRedirect("checkout.jsp");

				} else {
					boolean f = dao2.saveOrder(orderList);

					if (f) {
						resp.sendRedirect("orderPlaced.jsp");
					}
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
