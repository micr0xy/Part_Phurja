package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.ProductOrder;

public class ProductOrderImpl implements ProductOrderDAO {

	private final Connection connection;

	public ProductOrderImpl(DBConnect dbConnect) {
		this.connection = dbConnect.getConn();
	}
	public List<ProductOrder> getProduct(String email) {
		if (connection == null) {
			System.out.println("Connection is null!");
		}

		System.out.println("Connection success!");

		List<ProductOrder> list = new ArrayList<ProductOrder>();
		ProductOrder o = null;

		try {

			String sql = "select * from product_order where email=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				o = new ProductOrder();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setProdName(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPaymentMethod(rs.getString(9));
				list.add(o);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	

	public int getOrderNo() {

		int c = 1;

		try {

			String sql = "select * from product_order";
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				c++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return c;
	}

	public boolean saveOrder(List<ProductOrder> list) {

		boolean f = false;

		try {

			String sql = "insert into product_order (order_id, user_name, email, address, phone, product_name, price, payment) values (?,?,?,?,?,?,?,?)";
			connection.setAutoCommit(false);
			PreparedStatement ps = connection.prepareStatement(sql);

			for (ProductOrder l : list) {

				ps.setString(1, l.getOrderId());
				ps.setString(2, l.getUserName());
				ps.setString(3, l.getEmail());
				ps.setString(4, l.getFullAdd());
				ps.setString(5, l.getPhone());
				ps.setString(6, l.getProdName());
				ps.setString(7, l.getPrice());
				ps.setString(8, l.getPaymentMethod());
				ps.addBatch();

			}

			int[] count = ps.executeBatch();
			connection.commit();
			f = true;
			connection.setAutoCommit(true);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<ProductOrder> getProduct() {
		
		List<ProductOrder> list = new ArrayList<ProductOrder>();
		ProductOrder o = null;
		
		try {

			String sql = "select * from product_order";
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				o = new ProductOrder();
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFullAdd(rs.getString(5));
				o.setPhone(rs.getString(6));
				o.setProdName(rs.getString(7));
				o.setPrice(rs.getString(8));
				o.setPaymentMethod(rs.getString(9));
				list.add(o);
			}
		}
			catch (Exception e) {
				e.printStackTrace();
			}
		
		
		return list;
	}
}
	
	
	
	
	

