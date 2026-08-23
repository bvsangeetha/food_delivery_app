package com.food.DAOImpl;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.OrderTableDAO;
import com.food.model.OrderTable;
import com.food.utility.DBConnection;

public class OrderTableDAOImpl implements OrderTableDAO {

	String INSERT_QUERY = "INSERT INTO ordertable(userId, restaurantId, orderDate, totalAmount, status, paymentMethod)"
			+ " VALUES (?, ?, ?, ?, ?, ?)";

//	@Override
//	public void addOrder(OrderTable orderTable) {
//
//		Connection connection = DBConnection.getConnection();
//
//		try {
//
//			PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);
//
//			pstmt.setInt(1, orderTable.getUserId());
//			pstmt.setInt(2, orderTable.getRestaurantId());
//			pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
//			pstmt.setDouble(4, orderTable.getTotalAmount());
//			pstmt.setString(5, orderTable.getStatus());
//			pstmt.setString(6, orderTable.getPaymentMethod());
//
//			int i = pstmt.executeUpdate();
//			System.out.println(i);
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//	}

	
	
	@Override
	public int addOrder(OrderTable orderTable) {

		Connection connection = DBConnection.getConnection();

		int orderId = 0;

		try {

			PreparedStatement pstmt = connection.prepareStatement(
					INSERT_QUERY,
					Statement.RETURN_GENERATED_KEYS);

			pstmt.setInt(1, orderTable.getUserId());
			pstmt.setInt(2, orderTable.getRestaurantId());
			pstmt.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			pstmt.setDouble(4, orderTable.getTotalAmount());
			pstmt.setString(5, orderTable.getStatus());
			pstmt.setString(6, orderTable.getPaymentMethod());

			int i = pstmt.executeUpdate();
			System.out.println(i);

			// Get the automatically generated orderId
			ResultSet rs = pstmt.getGeneratedKeys();

			if (rs.next()) {
				orderId = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return orderId;
	}
	
	
	@Override
	public OrderTable getOrder(int orderId) {

		String GET_QUERY = "SELECT * FROM ordertable WHERE orderId=?";

		OrderTable orderTable = null;

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(GET_QUERY);

			pstmt.setInt(1, orderId);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("orderId");
				int userId = rs.getInt("userId");
				int restaurantId = rs.getInt("restaurantId");
				Timestamp orderDate = rs.getTimestamp("orderDate");
				double totalAmount = rs.getFloat("totalAmount");
				String status = rs.getString("status");
				String paymentMethod = rs.getString("paymentMethod");

				orderTable = new OrderTable(id, userId, restaurantId, orderDate,
						totalAmount, status, paymentMethod);
			}

			return orderTable;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void updateOrder(OrderTable orderTable) {

		String UPDATE_QUERY = "UPDATE ordertable SET userId=?, restaurantId=?, totalAmount=?, status=?, paymentMethod=? WHERE orderId=?";

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);

			pstmt.setInt(1, orderTable.getUserId());
			pstmt.setInt(2, orderTable.getRestaurantId());
			pstmt.setDouble(3, orderTable.getTotalAmount());
			pstmt.setString(4, orderTable.getStatus());
			pstmt.setString(5, orderTable.getPaymentMethod());
			pstmt.setInt(6, orderTable.getOrderId());

			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteOrder(int orderId) {

		String DELETE_QUERY = "DELETE FROM ordertable WHERE orderId=?";

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, orderId);

			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<OrderTable> getAllOrders() {

		String GET_ALL_QUERY = "SELECT * FROM ordertable";

		ArrayList<OrderTable> list = new ArrayList<OrderTable>();

		Connection connection = DBConnection.getConnection();

		try {

			Statement stmt = connection.createStatement();

			ResultSet rs = stmt.executeQuery(GET_ALL_QUERY);

			while (rs.next()) {

				OrderTable orderTable = extractOrderTableFromResultSet(rs);

				list.add(orderTable);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public static OrderTable extractOrderTableFromResultSet(ResultSet rs) throws SQLException {

		int orderId = rs.getInt("orderId");
		int userId = rs.getInt("userId");
		int restaurantId = rs.getInt("restaurantId");
		Timestamp orderDate = rs.getTimestamp("orderDate");
		double totalAmount = rs.getFloat("totalAmount");
		String status = rs.getString("status");
		String paymentMethod = rs.getString("paymentMethod");

		OrderTable orderTable = new OrderTable(orderId, userId, restaurantId,
				orderDate, totalAmount, status, paymentMethod);

		return orderTable;
	}

}