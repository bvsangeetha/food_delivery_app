package com.food.DAO;

import java.util.List;

import com.food.model.OrderTable;

public interface OrderTableDAO {

	int addOrder(OrderTable orderTable);

	OrderTable getOrder(int orderId);

	void updateOrder(OrderTable orderTable);

	void deleteOrder(int orderId);

	List<OrderTable> getAllOrders();

}