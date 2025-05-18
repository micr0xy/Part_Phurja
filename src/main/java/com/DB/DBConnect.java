package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

// Creating a method to connect to the database

public class DBConnect {

	public Connection getConn() {
		Connection conn;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/part-purja", "root", "");
			return conn;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
