package com.food.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static final String URL="jdbc:mysql://localhost:3306/food_delivery_db?useUnicode=true&characterEncoding=UTF-8";
	private static final String USERNAME="root";
	private static final String PASSWORD="Sangeetha@2004";
	
	public static Connection getConnection(){
		 Connection connection=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection(URL, USERNAME,PASSWORD);
		
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
	
}
