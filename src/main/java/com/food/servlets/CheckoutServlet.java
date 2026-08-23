package com.food.servlets;

import java.io.IOException;
import java.sql.Timestamp;

import com.food.DAOImpl.OrderItemDAOImpl;
import com.food.DAOImpl.OrderTableDAOImpl;
import com.food.model.Cart;
import com.food.model.CartItem;
import com.food.model.OrderItem;
import com.food.model.OrderTable;
import com.food.model.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			HttpSession session = req.getSession();
			User user = (User)session.getAttribute("user");
			Integer restaurantId = (Integer) session.getAttribute("restaurantId");
			Cart cart = (Cart)session.getAttribute("cart");
			
			double grandTotal = (double) session.getAttribute("grandTotal");
			
		if(user !=null) {
			
			if(cart!=null && !cart.getItems().isEmpty()) {
				
				int userId = user.getUserId();
				String paymentMethod = req.getParameter("paymentMethod");
				
				
				OrderTable orderTable = new OrderTable(userId,
						restaurantId,
						new Timestamp(System.currentTimeMillis()),
						grandTotal, 
						"Pending", 
						paymentMethod);
				

				OrderTableDAOImpl orderTableDAOImpl = new OrderTableDAOImpl();
				int orderId = orderTableDAOImpl.addOrder(orderTable);
				
//				
				for(CartItem cartItem:cart.getItems().values()) {
					int menuId = cartItem.getMenuId();
					int qty = cartItem.getQty();
					double price = cartItem.getPrice();
					
					OrderItem orderItem = new OrderItem(orderId, menuId, qty, price);
					OrderItemDAOImpl orderItemDAOImpl = new OrderItemDAOImpl();
					orderItemDAOImpl.addOrderItem(orderItem);
					
					
				}
				session.removeAttribute("restaurantId");
				session.removeAttribute("cart");
				session.removeAttribute("grandTotal");
				
				resp.sendRedirect("orderConfirmation.html");
				
				}
			
			
		}
		else {
			RequestDispatcher rd = req.getRequestDispatcher("login.html");
			rd.forward(req, resp);
		}
		
		}
}
