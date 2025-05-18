package com.user.servlet;

//import javax.servlet.annotation.WebServlet;
import java.io.IOException;

//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;

import com.entity.User;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			String phone=req.getParameter("phone");
			String check=req.getParameter("check");
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPassword(password);
			us.setPhone(phone);
			
			
			HttpSession session = req.getSession();
			
			
			
			if(check!=null) {
				DBConnect conn = new DBConnect();
				UserDAOImpl dao = new UserDAOImpl(conn);
				boolean f = dao.userRegister(us);
				if(f) {
					
					session.setAttribute("succMsg", "Account Created Successfully!");
					resp.sendRedirect("register.jsp");
				}
				else {
					
					session.setAttribute("failedMsg", "Something went wrong. Try again!");
					resp.sendRedirect("register.jsp");
				}
			}
			
			else {
				session.setAttribute("failedMsg", "Please agree to our Terms & Conditions");
				resp.sendRedirect("register.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}

}
