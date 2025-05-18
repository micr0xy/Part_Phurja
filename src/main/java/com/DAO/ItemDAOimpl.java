package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DB.DBConnect;
import com.entity.ItemDetails;

public class ItemDAOimpl implements ItemDAO {

	private final Connection connection;

	public ItemDAOimpl(DBConnect dbConnect) {
		this.connection = dbConnect.getConn();
	}

	@Override
	public List<ItemDetails> getAllItems() {
		if (connection == null) {
			System.out.println("Connection is null!");
		}

		System.out.println("Connection success!");

		List<ItemDetails> list = new ArrayList<ItemDetails>();
		ItemDetails i = null;

		try {

			String sql = "select * from item_details";
			PreparedStatement ps = connection.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				i = new ItemDetails();
				i.setItemId(rs.getInt(1));
				i.setProductName(rs.getString(2));
				i.setPrice(rs.getString(3));
				i.setProductImage(rs.getString(4));
				list.add(i);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		return list;

	}

	@Override
	public boolean updateEditItems(ItemDetails i) {

		boolean f = false;
		try {

			String sql = "update item_details set productName=?, price=? where itemId=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, i.getProductName());
			ps.setString(2, i.getPrice());
			ps.setInt(3, i.getItemId());

			int ch = ps.executeUpdate();
			if (ch == 1) {

				f = true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteItems(int id) {
		boolean f = false;
		try {

			String sql = "delete from item_details where itemId=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			int ch = ps.executeUpdate();

			if (ch == 1) {
				f = true;
			}

		} catch (Exception e) {

		}
		return f;
	}

	@Override
	public ItemDetails getItemById(int id) {

		ItemDetails i = null;
		try {

			String sql = "select * from item_details where itemId=?";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				i = new ItemDetails();
				i.setItemId(rs.getInt(1));
				i.setProductName(rs.getString(2));
				i.setPrice(rs.getString(3));
				i.setProductImage(rs.getString(4));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;

	}

	@Override
	public boolean addItems(ItemDetails i) {

		boolean f = false;
		try {
			String sql = "insert into item_details(productName, price, productImage) values(?,?,?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, i.getProductName());
			ps.setString(2, i.getPrice());
			ps.setString(3, i.getProductImage());

			int ch = ps.executeUpdate();

			if (ch == 1) {
				f = true;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return f;
	}

	@Override
	public List<ItemDetails> getFeaturedItems() {

		List<ItemDetails> list = new ArrayList<ItemDetails>();
		ItemDetails i = null;
		try {
			String sql = "select * from item_details";
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			int c = 1;
			while (rs.next() && c <= 8) {

				i = new ItemDetails();
				i.setItemId(rs.getInt(1));
				i.setProductName(rs.getString(2));
				i.setPrice(rs.getString(3));
				i.setProductImage(rs.getString(4));
				list.add(i);
				c++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

}
