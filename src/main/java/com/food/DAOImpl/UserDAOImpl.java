package com.food.DAOImpl;

import java.sql.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.food.DAO.UserDAO;
import com.food.model.User;
import com.food.utility.DBConnection;

public class UserDAOImpl implements UserDAO{

	String INSERT_QUERY="INSERT INTO user(userName,email,password,address,role, createdDate, lastLoginDate)"
			+" VALUES (?, ?, ?, ?, ?, ?, ?)";

	@Override
	public int addUser(User user) {
		Connection connection = DBConnection.getConnection();

		try {
			PreparedStatement pstmt = connection.prepareStatement(INSERT_QUERY);

			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getAddress());
			pstmt.setString(5, user.getRole());
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			pstmt.setTimestamp(7, new Timestamp(System.currentTimeMillis()));


			int i = pstmt.executeUpdate();
			return i;


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
		


	}

	@Override
	public  User getUser(int userId) {
		
		String GET_QUERY="SELECT * FROM User WHERE userId=?";

		User user=null;
		Connection connection = DBConnection.getConnection();
		try {

			PreparedStatement pstmt = connection.prepareStatement(GET_QUERY);
			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				int id= rs.getInt("userId");
				String name = rs.getString("username");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String address = rs.getString("address");
				String role = rs.getString("role");
				Timestamp createdDate = rs.getTimestamp("createdDate");
				Timestamp lastLoginDate = rs.getTimestamp("lastLoginDate");

				user = new User(id, name, email, password, address, role, createdDate, lastLoginDate);
			}
			return user;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	
	@Override
	public User getUserByEmail(String email) {

	    String GET_USER_BY_EMAIL_QUERY =
	            "SELECT * FROM user WHERE email=?";

	    User user = null;

	    Connection connection = DBConnection.getConnection();

	    try {

	        PreparedStatement pstmt =
	                connection.prepareStatement(
	                        GET_USER_BY_EMAIL_QUERY
	                );

	        pstmt.setString(1, email);

	        ResultSet rs = pstmt.executeQuery();

	        while (rs.next()) {

	            int id = rs.getInt("userId");

	            String name =
	                    rs.getString("userName");

	            String userEmail =
	                    rs.getString("email");

	            String password =
	                    rs.getString("password");

	            String address =
	                    rs.getString("address");

	            String role =
	                    rs.getString("role");

	            Timestamp createdDate =
	                    rs.getTimestamp("createdDate");

	            Timestamp lastLoginDate =
	                    rs.getTimestamp("lastLoginDate");

	            user = new User(
	                    id,
	                    name,
	                    userEmail,
	                    password,
	                    address,
	                    role,
	                    createdDate,
	                    lastLoginDate
	            );
	        }

	        return user;

	    } catch (SQLException e) {

	        e.printStackTrace();

	    }

	    return null;
	}

	@Override
	public void updateUser(User user) {
		String UPDATE_QUERY="UPDATE USER SET userName =?, password=?, email=?, address=?, lastLogindate=? "
				+"WHERE userId=? ";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = connection.prepareStatement(UPDATE_QUERY);
		
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getAddress());
			pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pstmt.setInt(6, user.getUserId());
		
			int i = pstmt.executeUpdate();
			System.out.println(i);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public void deleteUser(int userId) {
		 String DELETE_QUERY = "DELETE FROM user WHERE userId=?";

		    Connection connection = DBConnection.getConnection();

		    try {
		        PreparedStatement pstmt = connection.prepareStatement(DELETE_QUERY);

		        pstmt.setInt(1, userId);

		        int i = pstmt.executeUpdate();

		        System.out.println(i);

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

	}

	@Override
	public List<User> getAllUser() {

		String GET_ALL_QUERY="SELECT * FROM user";
		ArrayList<User> list = new ArrayList<User>();

		Connection connection = DBConnection.getConnection();
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(GET_ALL_QUERY);

			while(rs.next()) {
				User user = extractUserFromResultSet(rs);
				list.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	public static User extractUserFromResultSet(ResultSet rs) throws SQLException{
			int id= rs.getInt("userId");
			String name = rs.getString("username");
			String email = rs.getString("email");
			String password = rs.getString("password");
			String address = rs.getString("address");
			String role = rs.getString("role");
			Timestamp createdDate = rs.getTimestamp("createdDate");
			Timestamp lastLoginDate = rs.getTimestamp("lastLoginDate");

			User user = new User(id, name, email, password, address, role, createdDate, lastLoginDate);
			return user;
		}
	
}




