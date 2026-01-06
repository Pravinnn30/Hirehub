package com.hirehub2PointO.controller;

import com.hirehub2PointO.model.User;
import com.hirehub2PointO.services.UserServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserServices userService;

    @Override
    public void init() {
        userService = new UserServices();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userEmail = req.getParameter("email");
        String password = req.getParameter("password");

        User user = userService.validateUser(userEmail, password);
        HttpSession session = req.getSession();
        if (user != null) {
            session.setAttribute("session_user", user);
            req.getRequestDispatcher("home.jsp").forward(req, resp);
        } else {
            session.setAttribute("userNotExist", true);
            resp.sendRedirect("login.jsp");
        }

    }
}
