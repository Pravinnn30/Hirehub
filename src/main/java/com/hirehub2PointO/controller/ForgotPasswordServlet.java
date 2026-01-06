package com.hirehub2PointO.controller;

import com.hirehub2PointO.services.EmailServices;
import com.hirehub2PointO.services.UserServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/forgetPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    private EmailServices emailServices;
    private UserServices userServices;

    @Override
    public void init() {
        emailServices = new EmailServices();
        userServices = new UserServices();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userMail = req.getParameter("email");

        HttpSession session = req.getSession();

        if (userServices.getUserByEmail(userMail) == null) {
            session.setAttribute("userNotExist", true);
            resp.sendRedirect("forgotPassword.jsp");
            return;
        }

        String otp = emailServices.sendOTP(userMail);

        if (otp != null) {
            session.setAttribute("from", "forgotPassword.jsp");
            session.setAttribute("otp", otp);
            session.setAttribute("otpSend", true);
            session.setAttribute("otpExpire", LocalDateTime.now().plusMinutes(10));
            session.setAttribute("tempEmail", userMail);
            resp.sendRedirect("otpVerification.jsp");
        } else {
            session.setAttribute("otpNotSend",true);
            resp.sendRedirect("forgotPassword.jsp");
        }
    }
}
