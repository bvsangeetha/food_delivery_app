package com.food.DAOImpl;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.MenuDAO;
import com.food.model.Menu;
import com.food.utility.DBConnection;

public class MenuDAOImpl implements MenuDAO {

	String INSERT_QUERY = "INSERT INTO menu(restaurantId,itemName,description,price,isAvailable,category,rating,imagePath,isVeg,createdAt,updatedAt,deletedAt)"
			+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	@Override
	public void addMenu(Menu menu) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);

			pstmt.setInt(1, menu.getRestaurantId());
			pstmt.setString(2, menu.getItemName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setBoolean(5, menu.isAvailable());
			pstmt.setString(6, menu.getCategory());
			pstmt.setDouble(7, menu.getRating());
			pstmt.setString(8, menu.getImagePath());
			pstmt.setBoolean(9, menu.isVeg());
			pstmt.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(11, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(12, null);

			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public Menu getMenu(int menuId) {

		String GET_QUERY = "SELECT * FROM menu WHERE menuId=?";

		Menu menu = null;

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(GET_QUERY);

			pstmt.setInt(1, menuId);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("menuId");
				int restaurantId = rs.getInt("restaurantId");
				String itemName = rs.getString("itemName");
				String description = rs.getString("description");
				double price = rs.getDouble("price");
				boolean isAvailable = rs.getBoolean("isAvailable");
				String category = rs.getString("category");
				double rating = rs.getDouble("rating");
				String imagePath = rs.getString("imagePath");
				boolean isVeg = rs.getBoolean("isVeg");
				Timestamp createdAt = rs.getTimestamp("createdAt");
				Timestamp updatedAt = rs.getTimestamp("updatedAt");
				Timestamp deletedAt = rs.getTimestamp("deletedAt");

				menu = new Menu(id, restaurantId, itemName, description, price,
				        isAvailable, category, rating, imagePath, isVeg,
				        createdAt, updatedAt, deletedAt);
			}

			return menu;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void updateMenu(Menu menu) {
		String UPDATE_QUERY = 
				"UPDATE menu SET restaurantId=?, itemName=?, description=?, price=?, isAvailable=?, category=?, rating=?, imagePath=?, isVeg=?, updatedAt=? WHERE menuId=?";
		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);

			pstmt.setInt(1, menu.getRestaurantId());
			pstmt.setString(2, menu.getItemName());
			pstmt.setString(3, menu.getDescription());
			pstmt.setDouble(4, menu.getPrice());
			pstmt.setBoolean(5, menu.isAvailable());
			pstmt.setString(6, menu.getCategory());
			pstmt.setDouble(7, menu.getRating());
			pstmt.setString(8, menu.getImagePath());
			pstmt.setBoolean(9, menu.isVeg());
			pstmt.setTimestamp(10, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(11, menu.getMenuId());
			
			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteMenu(int menuId) {

		String DELETE_QUERY = "DELETE FROM menu WHERE menuId=?";

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, menuId);

			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Menu> getAllMenu() {

		String GET_ALL_QUERY = "SELECT * FROM menu";

		ArrayList<Menu> list = new ArrayList<Menu>();

		Connection connection = DBConnection.getConnection();

		try {

			Statement stmt = connection.createStatement();

			ResultSet rs = stmt.executeQuery(GET_ALL_QUERY);

			while (rs.next()) {

				Menu menu = extractMenuFromResultSet(rs);

				list.add(menu);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public static Menu extractMenuFromResultSet(ResultSet rs) throws SQLException {

		int id = rs.getInt("menuId");
		int restaurantId = rs.getInt("restaurantId");
		String itemName = rs.getString("itemName");
		String description = rs.getString("description");
		double price = rs.getDouble("price");
		boolean isAvailable = rs.getBoolean("isAvailable");
		String category = rs.getString("category");
		Timestamp createdAt = rs.getTimestamp("createdAt");
		Timestamp updatedAt = rs.getTimestamp("updatedAt");
		Timestamp deletedAt = rs.getTimestamp("deletedAt");
		double rating = rs.getDouble("rating");
		String imagePath = rs.getString("imagePath");
		boolean isVeg = rs.getBoolean("isVeg");

		Menu menu = new Menu(id, restaurantId, itemName, description, price,
				isAvailable, category, rating, imagePath, isVeg,
				createdAt, updatedAt, deletedAt);
		
		return menu;
	}
	@Override
	public List<Menu> getMenuByRestaurantId(int restaurantId) {

	    String GET_BY_RESTAURANT_QUERY = "SELECT * FROM menu WHERE restaurantId=?";

	    List<Menu> list = new ArrayList<Menu>();

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt = connection.prepareStatement(GET_BY_RESTAURANT_QUERY);

	        pstmt.setInt(1, restaurantId);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            Menu menu = extractMenuFromResultSet(rs);

	            list.add(menu);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}

}