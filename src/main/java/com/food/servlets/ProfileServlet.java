package com.food.servlets;

import java.io.IOException;

import com.food.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        // Get the existing session
        HttpSession session = req.getSession(false);

        // Check whether the session exists
        if (session != null) {

            // Get the User object from the session
            User user = (User) session.getAttribute("user");

            // Check whether the User object is present
            if (user != null) {

                // Display the profile page
                req.getRequestDispatcher("profile.jsp")
                   .forward(req, resp);

            } else {

                // User is not logged in
                resp.sendRedirect("login.html");
            }

        } else {

            // Session does not exist
            resp.sendRedirect("login.html");
        }
    }
}