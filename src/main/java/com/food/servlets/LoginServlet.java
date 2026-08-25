package com.food.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println("Email entered: " + email);
        System.out.println("Password entered: " + password);

        UserDAOImpl userDAOImpl = new UserDAOImpl();

        User user = userDAOImpl.getUserByEmail(email);

        if (user == null) {

            System.out.println("USER NOT FOUND");

            resp.sendRedirect("login.html");

        } else {

            System.out.println("USER FOUND: " + user.getUserName());
            System.out.println("Stored password hash: " + user.getPassword());

            boolean passwordMatch =
                    BCrypt.checkpw(password, user.getPassword());

            System.out.println("Password match: " + passwordMatch);

            if (passwordMatch) {

                System.out.println("LOGIN SUCCESS");

                HttpSession session = req.getSession();
                session.setAttribute("user", user);

                resp.sendRedirect("restaurant");

            } else {

                System.out.println("PASSWORD INCORRECT");

                resp.sendRedirect("login.html");
            }
        }
    }
}