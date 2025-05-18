package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import com.DAO.ItemDAOimpl;
import com.entity.ItemDetails;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.MultipartConfig;

@WebServlet("/addItems")
@MultipartConfig
public class AddProducts extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String productName = req.getParameter("pName");
            String price = req.getParameter("price");
            Part part = req.getPart("picture");
            String productImage = part.getSubmittedFileName();

            ItemDetails item = new ItemDetails(productName, price, productImage);

            // Get a database connection from DBConnect (non-static)
            DBConnect dbConnect = new DBConnect();
            ItemDAOimpl dao = new ItemDAOimpl(dbConnect);

            boolean isSuccess = dao.addItems(item);
            HttpSession session = req.getSession();

            if (isSuccess) {
                // Set your local path to the webapp/images folder here
                String imagePath = "C:/Users/amanj/eclipse-workspace/Part-phurja/src/main/webapp/bikeitems";

                File uploadDir = new File(imagePath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Write file
                part.write(imagePath + File.separator + productImage);
                System.out.println("Image saved to: " + imagePath + File.separator + productImage);

                session.setAttribute("succMsg", "Item added successfully");
                resp.sendRedirect("admin/addItems.jsp");
            } else {
                session.setAttribute("failedMsg", "Couldn't add item.");
                resp.sendRedirect("admin/addItems.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("failedMsg", "Exception: " + e.getMessage());
            resp.sendRedirect("admin/addItems.jsp");
        }
    }
}
