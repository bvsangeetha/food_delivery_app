# 🍴 Food Delivery Web Application

A full-stack **Food Delivery Web Application** developed using Java web technologies. The application allows users to browse restaurants, view menus, manage their cart, place orders, and manage their profiles.

## 🚀 Live Demo

**[🍴 Open Food Delivery App](https://food-delivery-app-supf.onrender.com/food/)**

> The application is deployed on Render and uses a cloud-hosted MySQL database.

---

## 📌 Features

### 👤 User Features

* User registration and login
* Secure password hashing using BCrypt
* View and edit user profile
* Browse available restaurants
* View restaurant menus
* Add food items to cart
* Update cart quantities
* Remove items from cart
* Checkout and place orders
* View order-related information

### 🏪 Restaurant Features

* Display restaurant information
* Display restaurant menus
* Restaurant-specific food items
* Restaurant status and ratings

### 🛒 Cart & Order Management

* Add items to cart
* Update item quantity
* Remove items from cart
* Calculate total price
* Checkout functionality
* Order management

---

## 🛠️ Technologies Used

| Technology        | Usage                                  |
| ----------------- | -------------------------------------- |
| **Java**          | Backend development                    |
| **JSP**           | Dynamic web pages                      |
| **Servlets**      | Request handling and application logic |
| **JDBC**          | Database connectivity                  |
| **MySQL**         | Database                               |
| **BCrypt**        | Password hashing                       |
| **HTML**          | Frontend structure                     |
| **CSS**           | Styling                                |
| **JavaScript**    | Client-side functionality              |
| **Apache Tomcat** | Application server                     |
| **Eclipse**       | Development environment                |
| **Git & GitHub**  | Version control                        |
| **Render**        | Application deployment                 |
| **Aiven**         | Cloud MySQL database hosting           |

---

## 🏗️ Project Architecture

The application follows a layered architecture:

```text
User
 │
 ▼
JSP / HTML
 │
 ▼
Servlets
 │
 ▼
DAO / DAO Implementation
 │
 ▼
JDBC
 │
 ▼
MySQL Database
```

### Main Layers

```text
src/
├── main/
│   ├── java/
│   │   └── com.food/
│   │       ├── DAO/
│   │       ├── DAOImpl/
│   │       ├── model/
│   │       ├── servlets/
│   │       └── utility/
│   │
│   └── webapp/
│       ├── index.jsp
│       ├── login.html
│       ├── restaurant.jsp
│       ├── menu.jsp
│       ├── cart.jsp
│       ├── checkout.jsp
│       ├── profile.jsp
│       ├── editProfile.jsp
│       └── ...
```

---

## 🗄️ Database

The application uses **MySQL** as its relational database.

The database is hosted remotely using **Aiven**, allowing the deployed application to access the database from the cloud.

### Database

```text
food_delivery_db
```

The database contains tables for managing:

* Users
* Restaurants
* Menu items
* Cart
* Orders
* Order items
* Other application-related data

---

## 🔐 Security

* User passwords are hashed using **BCrypt** before being stored in the database.
* Database credentials are kept outside the source code when deployed.
* Sensitive credentials and certificates are **not included in this repository**.

---

## 🌐 Deployment

The application is deployed using:

**Application Server:** Apache Tomcat
**Hosting Platform:** Render
**Database:** Aiven MySQL

### Production URL

```text
https://food-delivery-app-supf.onrender.com/food/
```

---

## 💻 Running the Project Locally

### Prerequisites

Make sure you have the following installed:

* Java JDK
* Eclipse IDE
* Apache Tomcat
* MySQL
* MySQL Connector/J
* Git

### Steps

#### 1. Clone the repository

```bash
git clone https://github.com/bvsangeetha/food_delivery_app.git
```

#### 2. Open the project in Eclipse

Import the project into Eclipse and configure the required Java and Tomcat settings.

#### 3. Configure the database

Create the required MySQL database:

```sql
CREATE DATABASE food_delivery_db;
```

Import the required tables and data.

#### 4. Configure database connection

Update the database connection configuration with your local MySQL credentials.

**Do not commit passwords or other sensitive credentials to GitHub.**

#### 5. Configure Tomcat

Add the project to an Apache Tomcat server and start the server.

#### 6. Open the application

The application can then be accessed through the Tomcat server URL.

---

## 📷 Application Pages

The application includes pages such as:

* Login
* Registration
* Restaurant listing
* Menu
* Cart
* Checkout
* User Profile
* Edit Profile

---

## 📂 Project Structure

```text
food_delivery_app/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── com.food/
│       │       ├── DAO/
│       │       ├── DAOImpl/
│       │       ├── model/
│       │       ├── servlets/
│       │       └── utility/
│       │
│       └── webapp/
│           ├── index.jsp
│           ├── login.html
│           ├── restaurant.jsp
│           ├── menu.jsp
│           ├── cart.jsp
│           ├── checkout.jsp
│           ├── profile.jsp
│           ├── editProfile.jsp
│           └── ...
│
├── pom.xml
└── README.md
```

---

## 🎯 Learning Outcomes

Through this project, I gained practical experience in:

* Java web application development
* Servlets and JSP
* MVC-style application architecture
* JDBC and database integration
* DAO design pattern
* CRUD operations
* Session management
* Password hashing
* MySQL database management
* Git and GitHub
* Cloud database integration
* Deploying Java web applications

---

## 🔮 Future Enhancements

Some possible improvements include:

* Online payment integration
* Order tracking
* Restaurant admin dashboard
* User order history
* Improved responsive UI
* Search and filter functionality
* Email notifications
* Improved authentication and authorization

---

## 👩‍💻 Developer

**Sangeetha B V**

Bachelor of Engineering – Information Science & Engineering

---

## ⭐ Support

If you find this project useful, consider giving the repository a ⭐ on GitHub.
