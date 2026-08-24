package com.food.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL = System.getenv().getOrDefault(
            "DB_URL",
            "jdbc:mysql://localhost:3306/food_delivery_db"
    );

    private static final String USERNAME = System.getenv().getOrDefault(
            "DB_USERNAME",
            "root"
    );

    private static final String PASSWORD = System.getenv().getOrDefault(
            "DB_PASSWORD",
            ""
    );

    public static Connection getConnection() {

        Connection connection = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(
                    URL,
                    USERNAME,
                    PASSWORD
            );

        } catch (ClassNotFoundException e) {
            e.printStackTrace();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return connection;
    }
}