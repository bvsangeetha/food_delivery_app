<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.Map"%>
<%@ page import="com.food.model.Cart"%>
<%@ page import="com.food.model.CartItem"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>FoodLounge - Cart</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
      rel="stylesheet">

<style>

/* ================= GENERAL ================= */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Poppins', sans-serif;
    background: #f8f8f8;
    color: #222;
}


/* ================= HEADER ================= */

.header {
    height: 72px;
    background: white;

    display: flex;
    align-items: center;
    justify-content: space-between;

    padding: 0 7%;

    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
}

.logo {
    text-decoration: none;
    font-size: 28px;
    font-weight: 700;
    color: #ff4d2d;
}

.logo span {
    color: #222;
}

.nav {
    display: flex;
    gap: 30px;
}

.nav a {
    text-decoration: none;
    color: #333;
    font-size: 15px;
    font-weight: 500;
}

.nav a:hover {
    color: #ff4d2d;
}

.cart-link {
    color: #ff4d2d !important;
    font-weight: 600 !important;
}


/* ================= CART PAGE ================= */

.cart-page {
    width: 86%;
    max-width: 1200px;
    margin: 45px auto;
}

.page-title {
    margin-bottom: 30px;
}

.page-title h1 {
    font-size: 32px;
    font-weight: 700;
}

.page-title p {
    color: #777;
    font-size: 14px;
    margin-top: 5px;
}


/* ================= CART CARD ================= */

.cart-items {
    background: white;
    padding: 25px;
    border-radius: 18px;

    box-shadow: 0 5px 20px rgba(0,0,0,0.06);
}


/* ================= CART HEADING ================= */

.cart-heading {
    display: grid;

    grid-template-columns: 2fr 1fr 1fr 1.4fr 1fr;

    align-items: center;

    padding: 0 0 18px 0;

    border-bottom: 1px solid #eee;

    font-size: 13px;
    font-weight: 600;

    color: #555;
}


/* ================= CART ITEM ================= */

.cart-item {
    display: grid;

    grid-template-columns: 2fr 1fr 1fr 1.4fr 1fr;

    align-items: center;

    gap: 20px;

    padding: 22px 0;

    border-bottom: 1px solid #eee;
}


/* ================= ITEM DETAILS ================= */

.item-details {
    flex: 1;
}

.item-name {
    font-size: 17px;
    font-weight: 600;
    margin-bottom: 5px;
}

.item-price {
    color: #777;
    font-size: 14px;
}


/* ================= PRICE ================= */

.item-price-column {
    color: #ff4d2d;

    font-size: 15px;

    font-weight: 600;
}


/* ================= ITEM TOTAL ================= */

.item-total {
    font-size: 16px;
    font-weight: 600;

    color: #ff4d2d;
}


/* ================= QUANTITY ================= */

.quantity-box {
    display: flex;
    align-items: center;

    justify-content: flex-start;

    gap: 5px;
}

.quantity-box form {
    margin: 0;
    padding: 0;
}

.qty-btn {
    width: 36px;
    height: 36px;

    border: none;

    background: white;

    color: #ff4d2d;

    font-size: 20px;
    font-weight: 600;

    cursor: pointer;

    border-radius: 8px;
}

.qty-btn:hover {
    background: #fff1ed;
}

.quantity {
    width: 38px;

    text-align: center;

    font-size: 14px;
    font-weight: 600;
}


/* ================= ACTION ================= */

.item-action {
    display: flex;

    justify-content: flex-start;
}

.item-action form {
    margin: 0;
}

.remove-btn {
    border: 1px solid #ff4d2d;

    background: transparent;

    color: #ff4d2d;

    padding: 8px 16px;

    border-radius: 20px;

    font-family: 'Poppins', sans-serif;

    font-size: 12px;

    font-weight: 600;

    cursor: pointer;

    transition: 0.3s;
}

.remove-btn:hover {
    background: #ff4d2d;

    color: white;
}


/* ================= GRAND TOTAL ================= */

.grand-total {
    display: flex;

    justify-content: space-between;

    align-items: center;

    padding-top: 22px;

    font-size: 18px;

    font-weight: 700;
}

.grand-total-price {
    color: #ff4d2d;
}


/* ================= BOTTOM BUTTONS ================= */

.cart-actions {
    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-top: 20px;
}


/* ================= ADD MORE ITEMS ================= */

.add-items-btn {
    display: inline-block;

    padding: 12px 25px;

    border-radius: 9px;

    border: 1px solid #ff4d2d;

    background: transparent;

    color: #ff4d2d;

    text-decoration: none;

    font-size: 14px;

    font-weight: 600;
}

.add-items-btn:hover {
    background: #ff4d2d;

    color: white;
}


/* ================= CHECKOUT BUTTON ================= */

.checkout-btn {
    padding: 14px 25px;

    border: none;

    border-radius: 10px;

    background: #ff4d2d;

    color: white;

    font-family: 'Poppins', sans-serif;

    font-size: 15px;

    font-weight: 600;

    cursor: pointer;
    text-decoration: none;
}

.checkout-btn:hover {
    background: #e63e20;
}


/* ================= EMPTY CART ================= */

.empty-cart {
    background: white;

    padding: 70px 30px;

    border-radius: 18px;

    text-align: center;

    box-shadow: 0 5px 20px rgba(0,0,0,0.06);
}

.empty-cart h2 {
    font-size: 24px;

    margin-bottom: 8px;
}

.empty-cart p {
    color: #777;

    margin-bottom: 25px;
}

.browse-btn {
    display: inline-block;

    padding: 12px 25px;

    border-radius: 9px;

    background: #ff4d2d;

    color: white;

    text-decoration: none;

    font-size: 14px;

    font-weight: 600;
}

.browse-btn:hover {
    background: #e63e20;
}


/* ================= FOOTER ================= */

.footer {
    margin-top: 70px;

    padding: 25px;

    background: #222;

    text-align: center;

    color: white;

    font-size: 13px;
}

.footer span {
    color: #ff4d2d;
}


/* ================= MOBILE ================= */

@media (max-width: 900px) {

    .cart-heading {
        grid-template-columns: 2fr 1fr 1fr;
    }

    .cart-item {
        grid-template-columns: 2fr 1fr 1fr;

        gap: 15px;
    }

    .cart-heading div:nth-child(4),
    .cart-heading div:nth-child(5) {
        display: none;
    }

    .cart-item .quantity-box,
    .cart-item .item-action {
        grid-column: auto;
    }
}


@media (max-width: 600px) {

    .cart-page {
        width: 92%;
    }

    .cart-heading {
        display: none;
    }

    .cart-item {
        display: flex;

        flex-wrap: wrap;
    }

    .item-details {
        width: 100%;
        flex: none;
    }

    .item-price-column,
    .item-total {
        min-width: auto;
    }

    .quantity-box {
        margin-left: auto;
    }

    .nav {
        gap: 15px;
    }

    .nav a:not(.cart-link) {
        display: none;
    }

    .cart-actions {
        gap: 15px;
    }

    .add-items-btn,
    .checkout-btn {
        font-size: 12px;

        padding: 10px 15px;
    }
}

</style>

</head>


<body>


<!-- ================= HEADER ================= -->

<header class="header">

    <a href="restaurant.jsp" class="logo">

        Food<span>Lounge</span>

    </a>


    <nav class="nav">

        <a href="restaurant">
            Home
        </a>

        <a href="restaurant">
            Restaurants
        </a>

        <a href="cart.jsp" class="cart-link">
            Cart 🛒
        </a>

    </nav>

</header>



<!-- ================= CART PAGE ================= -->

<div class="cart-page">


    <div class="page-title">

        <h1>Your Cart</h1>

        <p>
            Review your items before placing your order
        </p>

    </div>


<%

Cart cart = (Cart) session.getAttribute("cart");


if (cart == null || cart.getItems().isEmpty()) {

%>


    <!-- ================= EMPTY CART ================= -->

    <div class="empty-cart">

        <h2>Your cart is empty</h2>

        <p>
            Add some delicious food from our restaurants.
        </p>

        <a href="restaurant" class="browse-btn">
            Browse Restaurants
        </a>

    </div>


<%

} else {

    Map<Integer, CartItem> items = cart.getItems();

    int restaurantId = (int) session.getAttribute("restaurantId");
    
    double grandTotal = 0;


    for (CartItem item : cart.getItems().values()) {

        grandTotal += item.getTotalPrice();

    }

%>


    <!-- ================= CART ITEMS ================= -->

    <div class="cart-items">


        <!-- ================= COLUMN HEADINGS ================= -->

        <div class="cart-heading">

            <div>
                Item
            </div>

            <div>
                Price
            </div>

            <div>
                Total
            </div>

            <div>
                Quantity
            </div>

            <div>
                Action
            </div>

        </div>


<%

for (CartItem item : items.values()) {

%>


        <!-- ================= SINGLE CART ITEM ================= -->

        <div class="cart-item">


            <!-- ITEM -->

            <div class="item-details">

                <div class="item-name">

                    <%= item.getName() %>

                </div>

            </div>


            <!-- PRICE -->

            <div class="item-price-column">

                ₹<%= String.format("%.1f", item.getPrice()) %>

            </div>


            <!-- TOTAL -->

            <div class="item-total">

                ₹<%= String.format("%.1f", item.getTotalPrice()) %>

            </div>


            <!-- ================= QUANTITY ================= -->

            <div class="quantity-box">


                <!-- MINUS -->

                <form action="cartServlet" method="post">

                    <input type="hidden"
                           name="menuId"
                           value="<%= item.getMenuId() %>">

                    <input type="hidden"
                           name="restaurantId"
                           value="<%= item.getRestaurantId() %>">

                    <input type="hidden"
                           name="action"
                           value="update">

                    <input type="hidden"
                           name="qty"
                           value="<%= item.getQty() - 1 %>">

                    <button class="qty-btn"
                            type="submit">

                        −

                    </button>

                </form>


                <!-- CURRENT QUANTITY -->

                <span class="quantity">

                    <%= item.getQty() %>

                </span>


                <!-- PLUS -->

                <form action="cartServlet" method="post">

                    <input type="hidden"
                           name="menuId"
                           value="<%= item.getMenuId() %>">

                    <input type="hidden"
                           name="restaurantId"
                           value="<%= item.getRestaurantId() %>">

                    <input type="hidden"
                           name="action"
                           value="update">

                    <input type="hidden"
                           name="qty"
                           value="<%= item.getQty() + 1 %>">

                    <button class="qty-btn"
                            type="submit">

                        +

                    </button>

                </form>


            </div>


            <!-- ================= REMOVE BUTTON ================= -->

            <div class="item-action">

                <form action="cartServlet" method="post">

                    <input type="hidden"
                           name="menuId"
                           value="<%= item.getMenuId() %>">

                    <input type="hidden"
                           name="restaurantId"
                           value="<%= item.getRestaurantId() %>">

                    <input type="hidden"
                           name="action"
                           value="remove">

                    <button type="submit"
                            class="remove-btn">

                        Remove

                    </button>

                </form>

            </div>


        </div>


<%

}

%>


        <!-- ================= GRAND TOTAL ================= -->

        <div class="grand-total">

            <span>
                Grand Total
            </span>

            <span class="grand-total-price">

                ₹<%= String.format("%.1f", grandTotal) %>

            </span>

        </div>


    </div>



    <!-- ================= BOTTOM ACTIONS ================= -->

    <div class="cart-actions">


        <!-- ADD MORE ITEMS -->

        <a href="menu?restaurantId=<%=restaurantId %>"
           class="add-items-btn">

            Add More Items

        </a>


        <!-- PROCEED TO CHECKOUT -->


	<a href="checkout.jsp"
	           class="checkout-btn">
	
	            Proceed to Checkout
	
	        </a>


    </div>


<%

}

%>


</div>



<!-- ================= FOOTER ================= -->

<footer class="footer">

    © 2026 <span>FoodLounge</span>

    — Delicious food, delivered to you.

</footer>


</body>

</html>