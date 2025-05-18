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

import com.DB.DBConnect;
import com.entity.ItemDetails;
import com.DAO.ItemDAOimpl;


@WebServlet("/editParts")
public class EditPartsServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String productName = req.getParameter("pName");
			String price = req.getParameter("price");
			
			ItemDetails i = new ItemDetails();	
			i.setItemId(id);
			i.setProductName(productName);
			i.setPrice(price);
			
			DBConnect conn = new DBConnect();
			ItemDAOimpl dao = new ItemDAOimpl(conn);
			boolean f = dao.updateEditItems(i);
			HttpSession session = req.getSession();
			
			
			if (f) {
				
				session.setAttribute("succMsg", "Item Updated...");
				resp.sendRedirect("admin/allItems.jsp");
				
			}else {
				session.setAttribute("failedMsg", "Failed to update item.");
				resp.sendRedirect("admin/allItems.jsp");
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
	}

	
}
