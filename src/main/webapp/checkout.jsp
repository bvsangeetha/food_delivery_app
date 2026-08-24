<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.Map"%>
<%@ page import="com.food.model.Cart"%>
<%@ page import="com.food.model.CartItem"%>
<%@ page import="com.food.model.Restaurant" %>
<%@ page import="com.food.DAOImpl.RestaurantDAOImpl" %>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>FoodLounge - Secure Checkout</title>


    <style>

        /* =========================================
           GLOBAL
        ========================================= */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f8f8f8;
            color: #222;
        }

        .checkout-page {
            width: 90%;
            max-width: 1250px;
            margin: 40px auto;
        }


        /* =========================================
           PAGE HEADER
        ========================================= */

        .checkout-header {
            margin-bottom: 25px;
        }

        .checkout-header h1 {
            font-size: 32px;
            color: #222;
            margin-bottom: 7px;
            font-weight: 700;
        }

        .checkout-header p {
            color: #777;
            font-size: 14px;
        }


        /* =========================================
           MAIN TWO COLUMN LAYOUT
        ========================================= */

        .checkout-layout {
            display: grid;
            grid-template-columns: 1.6fr 1fr;
            gap: 25px;
            align-items: start;
        }


        /* =========================================
           COMMON CARD
        ========================================= */

        .checkout-card {
            background: #ffffff;
            border-radius: 14px;
            border: 1px solid #eeeeee;
            padding: 25px;

            box-shadow:
                0 4px 15px rgba(0, 0, 0, 0.06);
        }


        /* =========================================
           SECTION HEADING
        ========================================= */

        .section-heading {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 23px;
        }

        .section-number {
            width: 32px;
            height: 32px;

            background: #ff4d2d;
            color: white;

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 14px;
            font-weight: 600;
        }

        .section-heading h2 {
            font-size: 21px;
            color: #222;
            font-weight: 650;
        }


        /* =========================================
           DELIVERY INFORMATION
        ========================================= */

        .delivery-section {
            padding-bottom: 25px;
            border-bottom: 1px solid #eeeeee;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            font-weight: 600;
            color: #333;
            margin-bottom: 7px;
        }

        .required {
            color: #ff4d2d;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;

            border: 1px solid #dddddd;
            border-radius: 8px;

            padding: 12px 13px;

            font-size: 13px;

            outline: none;

            background: #fff;
            color: #333;

            transition: 0.2s;
        }

        .form-group input {
            height: 45px;
        }

        .form-group textarea {
            height: 90px;
            resize: none;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #ff4d2d;

            box-shadow:
                0 0 0 2px rgba(255, 77, 45, 0.08);
        }

        .form-group input::placeholder,
        .form-group textarea::placeholder {
            color: #999;
        }


        /* =========================================
           SAVE ADDRESS
        ========================================= */

        .save-address-title {
            font-size: 13px;
            font-weight: 600;

            margin-bottom: 10px;

            color: #333;
        }

        .address-options {
            display: flex;
            gap: 10px;
        }

        .address-option {
            border: 1px solid #dddddd;

            border-radius: 25px;

            padding: 9px 18px;

            font-size: 13px;

            color: #555;

            cursor: pointer;

            background: white;

            transition: 0.2s;
        }

       .address-option:hover {
	    background: #ff4d2d;
	    border-color: #ff4d2d;
	    color: white;
		}

        .address-option.active {
            background: #ff4d2d;
            border-color: #ff4d2d;
            color: white;
        }


        /* =========================================
           PAYMENT SECTION
        ========================================= */

        .payment-section {
            margin-top: 25px;
        }

        .payment-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .payment-card {
            border: 1px solid #dddddd;

            border-radius: 10px;

            padding: 16px;

            display: flex;
            align-items: center;

            gap: 13px;

            cursor: pointer;

            transition: 0.2s;

            min-height: 85px;
        }

        .payment-card:hover {
            border-color: #ff4d2d;
            background: #fff8f5;
        }

        .payment-card.selected {
            border: 2px solid #ff4d2d;
            background: #fff8f5;
        }

        .payment-icon {
            width: 42px;
            height: 42px;

            border-radius: 9px;

            background: #fff0eb;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 20px;
        }

        .payment-details h3 {
            font-size: 14px;
            margin-bottom: 4px;
            color: #222;
        }

        .payment-details p {
            font-size: 11px;
            color: #777;
            line-height: 1.4;
        }


        /* =========================================
           RIGHT SIDE ORDER SUMMARY
        ========================================= */

        .order-summary {
            position: sticky;
            top: 20px;
        }


        /* =========================================
           RESTAURANT INFORMATION
        ========================================= */

        .restaurant-info {
            display: flex;

            align-items: flex-start;

            gap: 15px;

            padding-bottom: 20px;

            margin-bottom: 0;

            border-bottom: 1px solid #eeeeee;
        }

        .restaurant-image {
            width: 70px;
            height: 70px;

            object-fit: cover;

            border-radius: 4px;

            flex-shrink: 0;
        }

        .restaurant-details {
            flex: 1;
        }

        .restaurant-details h3 {
            font-size: 18px;

            color: #222;

            line-height: 1.3;

            margin-bottom: 4px;

            font-weight: 650;
        }

        .restaurant-details p {
            font-size: 13px;

            color: #777;

            margin-bottom: 14px;
        }

        .restaurant-line {
            width: 50px;
            height: 3px;

            background: #222;
        }


        /* =========================================
           CART ITEMS
        ========================================= */

        .cart-items {
            border-bottom: 1px solid #eeeeee;
        }

        .cart-item {
            display: flex;

            align-items: center;

            gap: 12px;

            padding: 17px 0;

            border-bottom: 1px solid #eeeeee;
        }

        .cart-item:last-child {
            border-bottom: none;
        }


        /* =========================================
           VEG / NON VEG ICON
        ========================================= */

        .food-type {
            width: 16px;
            height: 16px;

            border: 2px solid;

            border-radius: 3px;

            display: flex;

            align-items: center;

            justify-content: center;

            flex-shrink: 0;
        }

        .food-type::after {
            content: "";

            width: 6px;
            height: 6px;

            border-radius: 50%;
        }


        /* VEG */

        .veg {
            border-color: #159447;
        }

        .veg::after {
            background: #159447;
        }


        /* NON VEG */

        .non-veg {
            border-color: #e63946;
        }

        .non-veg::after {
            background: #e63946;
        }


        /* =========================================
           CART ITEM DETAILS
        ========================================= */

        .cart-item-details {
            flex: 1;
            min-width: 0;
        }

        .food-name {
            font-size: 14px;

            font-weight: 600;

            color: #222;

            margin-bottom: 4px;
        }

        .food-description {
            font-size: 11px;

            color: #777;

            margin-bottom: 5px;
        }

        .quantity {
            display: inline-block;

            font-size: 11px;

            background: #fff0eb;

            color: #ff4d2d;

            padding: 3px 8px;

            border-radius: 10px;

            font-weight: 600;
        }

        .food-price {
            font-size: 14px;

            font-weight: 600;

            color: #ff4d2d;

            white-space: nowrap;
        }


        /* =========================================
           BILL DETAILS
        ========================================= */

        .bill-section {
            margin-top: 22px;
        }

        .bill-section h2 {
            font-size: 18px;

            margin-bottom: 17px;
        }

        .bill-row {
            display: flex;

            justify-content: space-between;

            margin-bottom: 12px;

            font-size: 13px;
        }

        .bill-row .label {
            color: #666;
        }

        .bill-row .value {
            color: #333;

            font-weight: 500;
        }

        .discount .label,
        .discount .value {
            color: #20a66a;
        }


        /* =========================================
           GRAND TOTAL
        ========================================= */

        .grand-total {
            display: flex;

            justify-content: space-between;

            align-items: center;

            border-top: 1px solid #dddddd;

            margin-top: 17px;

            padding-top: 18px;
        }

        .grand-total span:first-child {
            font-size: 20px;

            font-weight: 700;
        }

        .grand-total span:last-child {
            font-size: 22px;

            font-weight: 700;

            color: #ff4d2d;
        }


        /* =========================================
           DELIVERY TIME
        ========================================= */

        .delivery-time {
            margin-top: 20px;

            padding: 15px;

            border-radius: 10px;

            background: #f4f8ff;

            border: 1px solid #d5e5ff;

            display: flex;

            align-items: center;

            gap: 13px;
        }

        .delivery-time-icon {
            width: 45px;
            height: 45px;

            border-radius: 50%;

            background: #e8f1ff;

            color: #1565c0;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 22px;
        }

        .delivery-time h3 {
            font-size: 13px;

            margin-bottom: 3px;

            color: #222;
        }

        .delivery-time p {
            font-size: 11px;

            color: #777;
        }


        /* =========================================
           PLACE ORDER
        ========================================= */

        .place-order {
            width: 100%;

            border: none;

            background: #ff4d2d;

            color: white;

            padding: 14px;

            border-radius: 8px;

            margin-top: 20px;

            font-size: 15px;

            font-weight: 600;

            cursor: pointer;

            transition: 0.2s;
        }

        .place-order:hover {
            background: #e63e20;
        }


        /* =========================================
           RESPONSIVE - TABLET
        ========================================= */

        @media (max-width: 900px) {

            .checkout-layout {
                grid-template-columns: 1fr;
            }

            .order-summary {
                position: static;
            }
        }


        /* =========================================
           RESPONSIVE - MOBILE
        ========================================= */

        @media (max-width: 600px) {

            .checkout-page {
                width: 94%;

                margin: 25px auto;
            }

            .checkout-header h1 {
                font-size: 25px;
            }

            .checkout-card {
                padding: 18px;
            }

            .form-row {
                grid-template-columns: 1fr;

                gap: 0;
            }

            .payment-grid {
                grid-template-columns: 1fr;
            }

            .restaurant-image {
                width: 65px;
                height: 65px;
            }

            .restaurant-details h3 {
                font-size: 16px;
            }

            .grand-total span:first-child {
                font-size: 18px;
            }

            .grand-total span:last-child {
                font-size: 20px;
            }
        }

    </style>

</head>


<body>


    <!-- =========================================
         CHECKOUT PAGE
    ========================================= -->

    <div class="checkout-page">


        <!-- =====================================
             PAGE HEADER
        ====================================== -->

        <div class="checkout-header">

            <h1>
                Secure Checkout
            </h1>

            <p>
                Enter your delivery information and select a payment method.
            </p>

        </div>



        <!-- =====================================
             TWO COLUMN LAYOUT
        ====================================== -->

        <div class="checkout-layout">


            <!-- =================================
                 LEFT COLUMN
            ================================== -->

            <div class="checkout-card">


                <!-- =================================
                     DELIVERY INFORMATION
                ================================== -->

                <form action="CheckoutServlet" method="post">

    				<div class="delivery-section">

                    <div class="section-heading">

                        <div class="section-number">
                            1
                        </div>

                        <h2>
                            Delivery Information
                        </h2>

                    </div>



                    <!-- FULL NAME + PHONE -->

                    <div class="form-row">


                        <div class="form-group">

                            <label>
                                Full Name
                                <span class="required">*</span>
                            </label>

                            <input
							    type="text"
							    name="fullName"
							    placeholder="Enter your full name"
							    required
							>

                        </div>


                        <div class="form-group">

                            <label>
                                Phone Number
                                <span class="required">*</span>
                            </label>

                            <input
                                type="tel"
							    name="phone"
							    placeholder="Enter 10 digit phone number"
							    required
                            >

                        </div>


                    </div>



                    <!-- EMAIL -->

                    <div class="form-group">

                        <label>
                            Email Address
                        </label>

                        <input
                            type="email"
                            name="email"
                            placeholder="Enter your email address"
                            
                        >

                    </div>



                    <!-- COMPLETE ADDRESS -->

                    <div class="form-group">

                        <label>

                            Complete Address

                            <span class="required">
                                *
                            </span>

                        </label>

                        <textarea
						    name="address"
						    placeholder="House number, building name, street and area"
						    required
						></textarea>

                    </div>



                    <!-- CITY + PINCODE -->

                    <div class="form-row">


                        <div class="form-group">

                            <label>

                                City

                                <span class="required">
                                    *
                                </span>

                            </label>

                            <input
							    type="text"
							    name="city"
							    placeholder="Enter city"
							    required
							>

                        </div>


                        <div class="form-group">

                            <label>

                                Pincode

                                <span class="required">
                                    *
                                </span>

                            </label>

                            <input
							    type="text"
							    name="pincode"
							    placeholder="Enter 6-digit pincode"
							    required
							>

                        </div>


                    </div>
                    
                    



                    <!-- SAVE ADDRESS -->

                    <div>


                        <div class="save-address-title">

                            Save Address As

                        </div>


                        <div class="address-options">


                            <div class="address-option">

                                🏠 Home

                            </div>


                            <div class="address-option">

                                💼 Work

                            </div>


                            <div class="address-option">

                                📍 Other

                            </div>


                        </div>


                    </div>


                </div>



                <!-- =================================
                     PAYMENT METHOD
                ================================== -->

                <div class="payment-section">


                    <div class="section-heading">

                        <div class="section-number">
                            2
                        </div>

                        <h2>
                            Payment Method
                        </h2>

                    </div>

	

                    <div class="payment-grid">

    <!-- UPI -->
    <label class="payment-card">

        <input
            type="radio"
            name="paymentMethod"
            value="Online"
            required
        >

        <div class="payment-icon">
            📱
        </div>

        <div class="payment-details">
            <h3>
                UPI Payment
            </h3>

            <p>
                Google Pay, PhonePe, Paytm or other UPI apps
            </p>
        </div>

    </label>


    <!-- CARD -->
    <label class="payment-card">

        <input
            type="radio"
            name="paymentMethod"
            value="Online"
        >

        <div class="payment-icon">
            💳
        </div>

        <div class="payment-details">
            <h3>
                Card Payment
            </h3>

            <p>
                Credit card or debit card
            </p>
        </div>

    </label>


    <!-- CASH ON DELIVERY -->
    <label class="payment-card">

        <input
            type="radio"
            name="paymentMethod"
            value="Cash"
        >

        <div class="payment-icon">
            💵
        </div>

        <div class="payment-details">
            <h3>
                Cash on Delivery
            </h3>

            <p>
                Pay when your food is delivered
            </p>
        </div>

    </label>


    <!-- NET BANKING -->
    <label class="payment-card">

        <input
            type="radio"
            name="paymentMethod"
            value="Online"
        >

        <div class="payment-icon">
            🏦
        </div>

        <div class="payment-details">
            <h3>
                Net Banking
            </h3>

            <p>
                Pay directly using your bank account
            </p>
        	</div>

    		</label>

		</div>

                    


                </div>


            </div>



            <!-- =================================
                 RIGHT COLUMN
            ================================== -->

            <div class="checkout-card order-summary">


                <!-- =================================
                     ORDER SUMMARY HEADING
                ================================== -->

                <div class="section-heading">


                    <div class="section-number">
                        3
                    </div>


                    <h2>
                        Order Summary
                    </h2>


                </div>



                <!-- =================================
                     RESTAURANT INFORMATION
                ================================== -->
				<%
					    Integer restaurantId = (Integer) session.getAttribute("restaurantId");
					
					    Restaurant restaurant = null;
					
					    if (restaurantId != null) {
					        RestaurantDAOImpl restaurantDAOImpl = new RestaurantDAOImpl();
					        restaurant = restaurantDAOImpl.getRestaurant(restaurantId);
					    }
				%>
				
				<%
					if (restaurant != null) {
				%>
                <div class="restaurant-info">


                    <!-- RESTAURANT IMAGE -->

                    <img
                        src="<%= restaurant.getImagePath() %>"
                        class="restaurant-image"
                        alt="<%= restaurant.getName() %>"
                    >


                    <!-- RESTAURANT DETAILS -->

                    <div class="restaurant-details">


                        <h3>
                             <%= restaurant.getName() %>

                        </h3>


                        <p>
                             <%= restaurant.getAddress() %>
                        </p>


                        <div class="restaurant-line"></div>


                    </div>


                </div>
                
              <%
				}
			%>  
                
                
        <%
        Cart cart= (Cart)session.getAttribute("cart");
        
        double itemTotal=0;
        double dc=30;
        double pf=10;
        double gst=42;
        double discount = 20;
        
        if(cart!=null && !cart.getItems().isEmpty()){
        			
        		for(CartItem item :cart.getItems().values()){
        			itemTotal = itemTotal + item.getTotalPrice();
        		}
        }
        
        double grandTotal = itemTotal + dc + pf + gst - discount;
        
        session.setAttribute("grandTotal", grandTotal);
        
        %>


                <!-- =================================
                     CART ITEMS
                ================================== -->

			<% 
					if(cart!=null && !cart.getItems().isEmpty()){
	        			
	        		for(CartItem item :cart.getItems().values()){
	        			
	        			
	        			%>
	        			  <div class="cart-items">


	                      <!-- =================================
	                           ITEM 1 - VEGETARIAN
	                      ================================== -->

	                      <div class="cart-item">


	                          <!-- VEG ICON -->

	                          <div class="food-type veg"></div>


	                          <div class="cart-item-details">


	                              <div class="food-name">
	                                  <%=item.getName() %>
	                              </div>

	                              <span class="quantity">
	                                  <%=item.getQty() %>
	                              </span>


	                          </div>


	                          <div class="food-price">
	                              ₹<%=item.getTotalPrice() %>
	                          </div>


	                      </div>
				<% 
	        		
	        		}
	       		 }
				
			%>
        
              


                   

                <!-- =================================
                     BILL DETAILS
                ================================== -->

                <div class="bill-section">


                    <h2>
                        Bill Details
                    </h2>



                    <div class="bill-row">


                        <span class="label">
                            Item Total
                        </span>


                        <span class="value">
                            ₹<%=itemTotal %>
                        </span>


                    </div>



                    <div class="bill-row">


                        <span class="label">
                            Delivery Charges
                        </span>


                        <span class="value">
                            ₹<%=dc %>
                        </span>


                    </div>



                    <div class="bill-row">


                        <span class="label">
                            Platform Fee
                        </span>


                        <span class="value">
                            ₹<%=pf %>
                        </span>


                    </div>



                    <div class="bill-row">


                        <span class="label">
                            GST and Restaurant Charges
                        </span>


                        <span class="value">
                            ₹<%=gst %>
                        </span>


                    </div>



                    <div class="bill-row discount">


                        <span class="label">
                            Discount
                        </span>


                        <span class="value">
                             ₹ <%= discount %>
                        </span>


                    </div>



                    <!-- GRAND TOTAL -->

                    <div class="grand-total">


                        <span>
                            Grand Total
                        </span>


                        <span>
                            ₹<%=grandTotal %>
                        </span>


                    </div>


                </div>



                <!-- =================================
                     ESTIMATED DELIVERY TIME
                ================================== -->

                <div class="delivery-time">


                    <div class="delivery-time-icon">

                        🛵

                    </div>


                    <div>


                        <h3>
                            Estimated Delivery Time
                        </h3>


                        <p>
                            Your order will arrive in 30–40 minutes.
                        </p>


                    </div>


                </div>



                <!-- =================================
                     PLACE ORDER
                ================================== -->

                <button type="submit" class="place-order">
   					 Place Order
				</button>
                </form>


            </div>


        </div>


    </div>


</body>

</html>