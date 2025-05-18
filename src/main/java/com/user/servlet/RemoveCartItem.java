package com.user.servlet;

import java.io.IOException;

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
import com.DB.DBConnect;


@WebServlet("/remove_item")
public class RemoveCartItem extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int uid = Integer.parseInt(req.getParameter("uid"));
		int pid = Integer.parseInt(req.getParameter("pid"));
		DBConnect conn = new DBConnect();
		CartDAOImpl dao = new CartDAOImpl(conn);
		boolean f = dao.deleteItem(pid, uid);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Cart Item Removed");
			resp.sendRedirect("myCart.jsp");
		} else {
			session.setAttribute("failedMsg", "Something went wrong.");
			resp.sendRedirect("myCart.jsp");
		}
		
		
	}
	
	

}
