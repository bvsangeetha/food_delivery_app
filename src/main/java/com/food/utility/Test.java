package com.food.utility;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

public class Test {

	public static void main(String[] args) {
		
//		Testing the ADD Users()
//		User user = new User("Praveen", "praveen@gmail.com","prav@123","BTM","customer");
//		UserDAOImpl userDAOImpl = new UserDAOImpl();
//		userDAOImpl.addUser(user);
//		System.out.println("User Added");
		
		
//		Testing the GET Users()
//		UserDAOImpl userDAOImpl = new UserDAOImpl();
//		User user = userDAOImpl.getUser(1);
//
//		System.out.println(user);
		
		
//		Testing the UPDATE Users()
//		UserDAOImpl userDAOImpl = new UserDAOImpl();
//		User user = userDAOImpl.getUser(1);
//		user.setPassword("prav@123");
//		userDAOImpl.updateUser(user);
		
		
////		Testing the DELETE Users()
//		UserDAOImpl userDAOImpl = new UserDAOImpl();
//		userDAOImpl.deleteUser(1);
//
//		User user = userDAOImpl.getUser(1);
//		System.out.println(user);
		
		
		
		// Testing the ADD Restaurant()
		// Testing the ADD Restaurant()
		Restaurant restaurant = new Restaurant(
				"Empire Restaurant",
				"North Indian",
				30,
				"BTM Layout, Bangalore",
				1,
				4.5f,
				true,
				"images/empire.jpg");

		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
		restaurantDAOImpl.addRestaurant(restaurant);

		System.out.println("Restaurant Added");
	}

}
