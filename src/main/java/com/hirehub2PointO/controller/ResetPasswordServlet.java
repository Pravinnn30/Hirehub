package com.hirehub2PointO.controller;

import com.hirehub2PointO.services.UserServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {

    private UserServices userServices;

    @Override
    public void init() throws ServletException {
        userServices = new UserServices();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String newPassword = req.getParameter("newPassword");
        String email = (String) req.getSession().getAttribute("tempEmail");

        if (userServices.updatePassword(email, newPassword)) {
            req.getSession().setAttribute("passwordUpdated", true);
            resp.sendRedirect("login.jsp");
        } else {
            req.setAttribute("error", true);
            resp.sendRedirect("login.jsp");
        }
    }
}
