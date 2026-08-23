package com.food.servlets;

import java.io.IOException;
import java.util.List;

import com.food.DAOImpl.MenuDAOImpl;
import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Menu;
import com.food.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int restaurantId =Integer.parseInt( req.getParameter("restaurantId"));
		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		
		List<Menu> allMenuByRestaurantId = menuDAOImpl.getMenuByRestaurantId(restaurantId);
			
		RestaurantDAOImpl restaurantDAOImpl =
				new RestaurantDAOImpl();

		Restaurant restaurant =
				restaurantDAOImpl.getRestaurant(restaurantId);

		// Send data to JSP
		req.setAttribute("allMenuByRestaurantId", allMenuByRestaurantId);

		req.setAttribute("restaurant", restaurant);

			RequestDispatcher rd = req.getRequestDispatcher("menu.jsp");
			rd.forward(req, resp);
		
	}
}
