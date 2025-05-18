package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.ItemDAOimpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.ItemDetails;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private Connection connection = null;
    private CartDAOImpl cartDAO; // Instance for CartDAOImpl
    private ItemDAOimpl itemDAO; // Instance for ItemDAOimpl

    // Constructor to initialize the database connection
    public CartServlet() {
    	DBConnect conn = new DBConnect();
        this.connection = conn.getConn();
    }

    @Override
    public void init() throws ServletException {
        // Initialize DAO objects with the connection
    	DBConnect conn = new DBConnect();
        this.cartDAO = new CartDAOImpl(conn);
        this.itemDAO = new ItemDAOimpl(conn);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        try {
            // Retrieve 'pid' (product ID) and 'uid' (user ID) from the request parameters
            String pidParam = req.getParameter("pid");
            String uidParam = req.getParameter("uid");

            if (pidParam == null || uidParam == null) {
                session.setAttribute("cartMessage", "Invalid Product or User ID.");
                resp.sendRedirect("index.jsp");
                return;
            }

            // Parse parameters to integers
            int pid = Integer.parseInt(pidParam);
            int uid = Integer.parseInt(uidParam);

            // Fetch item details using ItemDAO
            ItemDetails item = itemDAO.getItemById(pid);

            if (item == null) {
                session.setAttribute("cartMessage", "Item not found.");
                resp.sendRedirect("index.jsp");
                return;
            }

            // Create a Cart object and populate it
            Cart cart = new Cart();
            cart.setPid(pid);
            cart.setUid(uid);
            cart.setProductName(item.getProductName());
            cart.setPrice(Double.parseDouble(item.getPrice())); // Assuming price is stored as String
            cart.setTotalPrice(Double.parseDouble(item.getPrice())); // Assuming total price is same as price initially

            // Add the cart item using CartDAO
            boolean isAdded = cartDAO.addCart(cart);

            if (isAdded) {
                session.setAttribute("cartMessage", "Item added to cart successfully.");
            } else {
                session.setAttribute("cartMessage", "Failed to add item to cart.");
            }

            // Redirect back to the index page
            resp.sendRedirect("index.jsp");

        } catch (NumberFormatException e) {
            // Handle invalid 'pid' or 'uid' format
            e.printStackTrace();
            session.setAttribute("cartMessage", "Invalid Product or User ID format.");
            resp.sendRedirect("index.jsp");
        } catch (Exception e) {
            // General exception handling
            e.printStackTrace();
            session.setAttribute("cartMessage", "An error occurred while adding the item to the cart.");
            resp.sendRedirect("index.jsp");
        }
    }

    @Override
    public void destroy() {
        // Close the database connection when the servlet is destroyed
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}