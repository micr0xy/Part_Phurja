package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DB.DBConnect;
import com.entity.User;

public class UserDAOImpl implements UserDAO {
	private final Connection connection;

	public UserDAOImpl(DBConnect dbConnect) {
		this.connection = dbConnect.getConn();
	}
	
	@Override
	public User login(String email, String password) {
		if (connection == null) {
			System.out.println("Connection is null!");
		}

		System.out.println("Connection success!");
		User us = null;
		try {
			String sql_q = "select * from user where email=? and password=?";
			PreparedStatement ps = connection.prepareStatement(sql_q);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				us = new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhone(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setCity(rs.getString(7));
				us.setState(rs.getString(8));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return us;
	}

	

	@Override
	public boolean userRegister(User us) {
		boolean f = false;
		
		try {
			String sql="insert into user(name, email, phone, password) values(?,?,?,?)";
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhone());
			ps.setString(4, us.getPassword());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return f;
	}
	
	
	
}
