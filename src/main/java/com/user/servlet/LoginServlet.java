package com.user.servlet;

import java.io.IOException;

//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
//import javax.servlet.http.HttpSession;
//import javax.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			DBConnect conn = new DBConnect();
			UserDAOImpl dao = new UserDAOImpl(conn);
			
			
			HttpSession session = req.getSession();
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			
			//check if it's admin or a normal user
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User us =  new User();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");
			} else {
				
				
				User us = dao.login(email, password);
				if(us!=null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("failedMsg", "Incorrect Login Credentials. Please try again.");
					resp.sendRedirect("login.jsp");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
