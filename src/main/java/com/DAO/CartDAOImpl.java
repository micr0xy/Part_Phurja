package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.ItemDetails;


public class CartDAOImpl implements CartDAO{
	
	private Connection connection = null;
	
	public  CartDAOImpl(DBConnect dbConnect) {
		this.connection = dbConnect.getConn();
	}

	

	@Override
	public List<Cart> getItemByUser(int userId){
	if (connection == null) {
		System.out.println("Connection is null!");
	}

	System.out.println("Connection success!");
		
	
		List<Cart> list = new ArrayList<Cart>();
		Cart c = null;
		double total_price = 0;
		try {
			
			String sql = "select * from cart where uid=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setProductName(rs.getString(4));
				c.setPrice(rs.getDouble(5));
				
				total_price = total_price + rs.getDouble(5);
				c.setTotalPrice(total_price);
				list.add(c);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public boolean deleteItem(int pid, int uid) {
		boolean f = false;
		
		try {
			
			String sql = "delete from cart where pid=? and uid=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, pid);
			ps.setInt(2, uid);
			
			int ch = ps.executeUpdate();
			if (ch==1) {
				f = true;	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	
	
	@Override
	public boolean addCart(Cart c) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into cart(pid, uid, productName, price, totalPrice) values(?,?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, c.getPid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getProductName());
			ps.setDouble(4, c.getPrice());
			ps.setDouble(5, c.getTotalPrice());
			
			int ch = ps.executeUpdate();
			
			if(ch == 1) {
				
				f = true;

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
}
