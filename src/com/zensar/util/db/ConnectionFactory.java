package com.zensar.util.db;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionFactory {

	static Connection con = null;
	static {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
	}

	public static Connection getConnection() {
		try {
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/online_exam", "roshan",
					"hibuddy");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

}
