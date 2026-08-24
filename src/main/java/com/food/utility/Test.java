//package com.food.utility;
//
//import com.food.DAOImpl.RestaurantDAOImpl;
//import com.food.model.Restaurant;
//
//public class Test {
//
//	public static void main(String[] args) {
//		
////		Testing the ADD Users()
////		User user = new User("Praveen", "praveen@gmail.com","prav@123","BTM","customer");
////		UserDAOImpl userDAOImpl = new UserDAOImpl();
////		userDAOImpl.addUser(user);
////		System.out.println("User Added");
//		
//		
////		Testing the GET Users()
////		UserDAOImpl userDAOImpl = new UserDAOImpl();
////		User user = userDAOImpl.getUser(1);
////
////		System.out.println(user);
//		
//		
////		Testing the UPDATE Users()
////		UserDAOImpl userDAOImpl = new UserDAOImpl();
////		User user = userDAOImpl.getUser(1);
////		user.setPassword("prav@123");
////		userDAOImpl.updateUser(user);
//		
//		
//////		Testing the DELETE Users()
////		UserDAOImpl userDAOImpl = new UserDAOImpl();
////		userDAOImpl.deleteUser(1);
////
////		User user = userDAOImpl.getUser(1);
////		System.out.println(user);
//		
//		
//		
//		// Testing the ADD Restaurant()
//		// Testing the ADD Restaurant()
//		Restaurant restaurant = new Restaurant(
//				"Empire Restaurant",
//				"North Indian",
//				30,
//				"BTM Layout, Bangalore",
//				1,
//				4.5f,
//				true,
//				"images/empire.jpg");
//
//		RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
//		restaurantDAOImpl.addRestaurant(restaurant);
//
//		System.out.println("Restaurant Added");
//	}
//
//}








//package com.food.utility;
//
//import com.food.DAOImpl.UserDAOImpl;
//import com.food.model.User;
//
//public class Test {
//
//    public static void main(String[] args) {
//
//        UserDAOImpl userDAOImpl = new UserDAOImpl();
//
//        User user = userDAOImpl.getUser(1);
//
//        if (user != null) {
//            System.out.println("User found!");
//            System.out.println(user);
//        } else {
//            System.out.println("User not found!");
//        }
//    }
//}

package com.food.utility;

import java.util.List;

import com.food.DAOImpl.RestaurantDAOImpl;
import com.food.model.Restaurant;

public class Test {

    public static void main(String[] args) {

        RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();

        // =====================================================
        // 1. TEST ADD RESTAURANT
        // =====================================================

        System.out.println("========== ADD RESTAURANT ==========");

        Restaurant restaurant = new Restaurant(
                "Test Restaurant",
                "North Indian",
                30,
                "BTM Layout, Bangalore",
                1,
                4.5f,
                true,
                "images/test_restaurant.jpg"
        );

        restaurantDAOImpl.addRestaurant(restaurant);

        System.out.println("Restaurant added successfully!");


        // =====================================================
        // 2. TEST GET ALL RESTAURANTS
        // =====================================================

        System.out.println("\n========== GET ALL RESTAURANTS ==========");

        List<Restaurant> restaurants =
                restaurantDAOImpl.getAllRestaurants();

        System.out.println("Total restaurants: " + restaurants.size());

        for (Restaurant r : restaurants) {
            System.out.println(r);
        }


        // =====================================================
        // 3. FIND THE TEST RESTAURANT
        // =====================================================

        int testRestaurantId = -1;

        for (Restaurant r : restaurants) {

            if (r.getName().equals("Test Restaurant")) {
                testRestaurantId = r.getRestaurantId();
                break;
            }
        }

        System.out.println("\nTest Restaurant ID: " + testRestaurantId);


        // =====================================================
        // 4. TEST GET RESTAURANT BY ID
        // =====================================================

        System.out.println("\n========== GET RESTAURANT ==========");

        if (testRestaurantId != -1) {

            Restaurant foundRestaurant =
                    restaurantDAOImpl.getRestaurant(testRestaurantId);

            if (foundRestaurant != null) {

                System.out.println("Restaurant found!");
                System.out.println(foundRestaurant);

            } else {

                System.out.println("Restaurant not found!");
            }

        } else {

            System.out.println("Test restaurant ID not found!");
        }


        // =====================================================
        // 5. TEST UPDATE RESTAURANT
        // =====================================================

        System.out.println("\n========== UPDATE RESTAURANT ==========");

        if (testRestaurantId != -1) {

            Restaurant restaurantToUpdate =
                    restaurantDAOImpl.getRestaurant(testRestaurantId);

            if (restaurantToUpdate != null) {

                restaurantToUpdate.setName(
                        "Test Restaurant Updated"
                );

                restaurantToUpdate.setCuisineType(
                        "South Indian"
                );

                restaurantToUpdate.setDeliveryTime(35);

                restaurantToUpdate.setRating(4.8f);

                restaurantDAOImpl.updateRestaurant(
                        restaurantToUpdate
                );

                System.out.println(
                        "Restaurant updated successfully!"
                );

            } else {

                System.out.println(
                        "Restaurant not found for update!"
                );
            }
        }


        // =====================================================
        // 6. VERIFY UPDATE
        // =====================================================

        System.out.println("\n========== VERIFY UPDATE ==========");

        if (testRestaurantId != -1) {

            Restaurant updatedRestaurant =
                    restaurantDAOImpl.getRestaurant(
                            testRestaurantId
                    );

            if (updatedRestaurant != null) {

                System.out.println(updatedRestaurant);

            } else {

                System.out.println(
                        "Restaurant not found!"
                );
            }
        }


        // =====================================================
        // 7. TEST DELETE RESTAURANT
        // =====================================================

        System.out.println("\n========== DELETE RESTAURANT ==========");

        if (testRestaurantId != -1) {

            restaurantDAOImpl.deleteRestaurant(
                    testRestaurantId
            );

            System.out.println(
                    "Restaurant deleted successfully!"
            );
        }


        // =====================================================
        // 8. VERIFY DELETE
        // =====================================================

        System.out.println("\n========== VERIFY DELETE ==========");

        if (testRestaurantId != -1) {

            Restaurant deletedRestaurant =
                    restaurantDAOImpl.getRestaurant(
                            testRestaurantId
                    );

            if (deletedRestaurant == null) {

                System.out.println(
                        "Restaurant successfully deleted!"
                );

            } else {

                System.out.println(
                        "Restaurant still exists!"
                );
            }
        }


        // =====================================================
        // 9. FINAL GET ALL RESTAURANTS
        // =====================================================

        System.out.println("\n========== FINAL RESTAURANT LIST ==========");

        List<Restaurant> finalRestaurants =
                restaurantDAOImpl.getAllRestaurants();

        System.out.println(
                "Total restaurants: "
                        + finalRestaurants.size()
        );

        for (Restaurant r : finalRestaurants) {
            System.out.println(r);
        }

        System.out.println("\n========== RESTAURANT CRUD TEST COMPLETED ==========");
    }
}