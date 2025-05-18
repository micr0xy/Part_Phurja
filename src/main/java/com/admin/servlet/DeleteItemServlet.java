package com.admin.servlet;

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

import com.DAO.ItemDAOimpl;
import com.DB.DBConnect;

@WebServlet("/delete")
public class DeleteItemServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));  
			DBConnect conn = new DBConnect();
			ItemDAOimpl dao = new ItemDAOimpl(conn);
			boolean f = dao.deleteItems(id);
			
			HttpSession session = req.getSession();
			
			
			if (f) {
				
				session.setAttribute("succMsg", "Item Deleted.");
				resp.sendRedirect("admin/allItems.jsp");
				
			}else {
				session.setAttribute("failedMsg", "Failed to delete item.");
				resp.sendRedirect("admin/allItems.jsp");
				
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
			
		}
	}

	 
		
}
