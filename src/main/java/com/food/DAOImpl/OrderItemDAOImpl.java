package com.food.DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.OrderItemDAO;
import com.food.model.OrderItem;
import com.food.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

	String INSERT_QUERY = "INSERT INTO orderitem(orderId, menuId, quantity, itemTotal)"
			+ " VALUES (?, ?, ?, ?)";

	@Override
	public void addOrderItem(OrderItem orderItem) {

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);

			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setInt(2, orderItem.getMenuId());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4, orderItem.getItemTotal());

			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public OrderItem getOrderItem(int orderItemId) {

		String GET_QUERY = "SELECT * FROM orderitem WHERE orderItemId=?";

		OrderItem orderItem = null;

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(GET_QUERY);

			pstmt.setInt(1, orderItemId);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int id = rs.getInt("orderItemId");
				int orderId = rs.getInt("orderId");
				int menuId = rs.getInt("menuId");
				int quantity = rs.getInt("quantity");
				float itemTotal = rs.getFloat("itemTotal");

				orderItem = new OrderItem(id, orderId, menuId, quantity, itemTotal);

			}

			return orderItem;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public void updateOrderItem(OrderItem orderItem) {

		String UPDATE_QUERY = "UPDATE orderitem SET orderId=?, menuId=?, quantity=?, itemTotal=? WHERE orderItemId=?";

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);

			pstmt.setInt(1, orderItem.getOrderId());
			pstmt.setInt(2, orderItem.getMenuId());
			pstmt.setInt(3, orderItem.getQuantity());
			pstmt.setDouble(4, orderItem.getItemTotal());
			pstmt.setInt(5, orderItem.getOrderItemId());

			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteOrderItem(int orderItemId) {

		String DELETE_QUERY = "DELETE FROM orderitem WHERE orderItemId=?";

		Connection connection = DBConnection.getConnection();

		try {

			PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);

			pstmt.setInt(1, orderItemId);

			int i = pstmt.executeUpdate();

			System.out.println(i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<OrderItem> getAllOrderItems() {

		String GET_ALL_QUERY = "SELECT * FROM orderitem";

		ArrayList<OrderItem> list = new ArrayList<OrderItem>();

		Connection connection = DBConnection.getConnection();

		try {

			Statement stmt = connection.createStatement();

			ResultSet rs = stmt.executeQuery(GET_ALL_QUERY);

			while (rs.next()) {

				OrderItem orderItem = extractOrderItemFromResultSet(rs);

				list.add(orderItem);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public static OrderItem extractOrderItemFromResultSet(ResultSet rs) throws SQLException {

		int orderItemId = rs.getInt("orderItemId");
		int orderId = rs.getInt("orderId");
		int menuId = rs.getInt("menuId");
		int quantity = rs.getInt("quantity");
		float itemTotal = rs.getFloat("itemTotal");

		OrderItem orderItem = new OrderItem(orderItemId, orderId, menuId, quantity, itemTotal);

		return orderItem;
	}

}