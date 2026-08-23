package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.RestaurantDAO;
import com.food.model.Restaurant;
import com.food.utility.DBConnection;

public class RestaurantDAOImpl implements RestaurantDAO {

	String INSERT_QUERY = "INSERT INTO restaurant(name, cuisineType, deliveryTime, address, adminUserId, rating, isActive, imagePath, offer, description)"
	        + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	@Override
	public void addRestaurant(Restaurant restaurant) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);

			pstmt.setString(1, restaurant.getName());
			pstmt.setString(2, restaurant.getCuisineType());
			pstmt.setInt(3, restaurant.getDeliveryTime());
			pstmt.setString(4, restaurant.getAddress());
			pstmt.setInt(5, restaurant.getAdminUserId());
			pstmt.setFloat(6, restaurant.getRating());
			pstmt.setBoolean(7, restaurant.isActive());
			pstmt.setString(8, restaurant.getImagePath());
			pstmt.setString(9, restaurant.getOffer());
			pstmt.setString(10, restaurant.getDescription());

			int i = pstmt.executeUpdate();
			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public Restaurant getRestaurant(int restaurantId) {

		String GET_QUERY = "SELECT * FROM restaurant WHERE restaurantId=?";

		Restaurant restaurant = null;

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(GET_QUERY);

			pstmt.setInt(1, restaurantId);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {

				restaurant = extractRestaurantFromResultSet(rs);

			}

			return restaurant;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void updateRestaurant(Restaurant restaurant) {

		String UPDATE_QUERY = "UPDATE restaurant SET name=?, cuisineType=?, deliveryTime=?, address=?, adminUserId=?, rating=?, isActive=?, imagePath=?, offer=?, description=? WHERE restaurantId=?";
		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);

			pstmt.setString(1, restaurant.getName());
			pstmt.setString(2, restaurant.getCuisineType());
			pstmt.setInt(3, restaurant.getDeliveryTime());
			pstmt.setString(4, restaurant.getAddress());
			pstmt.setInt(5, restaurant.getAdminUserId());
			pstmt.setFloat(6, restaurant.getRating());
			pstmt.setBoolean(7, restaurant.isActive());
			pstmt.setString(8, restaurant.getImagePath());
			pstmt.setString(9, restaurant.getOffer());
			pstmt.setString(10, restaurant.getDescription());
			pstmt.setInt(11, restaurant.getRestaurantId());
			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteRestaurant(int restaurantId) {

		String DELETE_QUERY = "DELETE FROM restaurant WHERE restaurantId=?";

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, restaurantId);

			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Restaurant> getAllRestaurants() {

		String GET_ALL_QUERY = "SELECT * FROM restaurant";

		ArrayList<Restaurant> list = new ArrayList<Restaurant>();

		Connection connection = DBConnection.getConnection();

		try {

			Statement stmt = connection.createStatement();

			ResultSet rs = stmt.executeQuery(GET_ALL_QUERY);

			while (rs.next()) {

				Restaurant restaurant = extractRestaurantFromResultSet(rs);

				list.add(restaurant);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public static Restaurant extractRestaurantFromResultSet(ResultSet rs) throws SQLException {

		int restaurantId = rs.getInt("restaurantId");
		String name = rs.getString("name");
		String cuisineType = rs.getString("cuisineType");
		int deliveryTime = rs.getInt("deliveryTime");
		String address = rs.getString("address");
		int adminUserId = rs.getInt("adminUserId");
		float rating = rs.getFloat("rating");
		boolean isActive = rs.getBoolean("isActive");
		String imagePath = rs.getString("imagePath");

		String offer = rs.getString("offer");
		String description = rs.getString("description");

		Restaurant restaurant = new Restaurant(
				restaurantId,
				name,
				cuisineType,
				deliveryTime,
				address,
				adminUserId,
				rating,
				isActive,
				imagePath
		);

		restaurant.setOffer(offer);
		restaurant.setDescription(description);

		return restaurant;
	}

}