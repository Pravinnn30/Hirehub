package com.hirehub2PointO.controller;

import com.hirehub2PointO.services.EmailServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/resendOTPServlet")
public class ResendOTPServlet extends HttpServlet {

    private EmailServices emailServices;

    @Override
    public void init() throws ServletException {
        emailServices = new EmailServices();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        String email = (String) session.getAttribute("tempEmail");
        String from = req.getParameter("from");

        String otp = emailServices.sendOTP(email);

        if (otp != null) {
            session.setAttribute("otp", otp);
            session.setAttribute("otpSend", true);
            session.setAttribute("otpExpire", LocalDateTime.now().plusMinutes(10));
        } else {
            session.setAttribute("otpNotSend", true);
        }
        resp.sendRedirect(from);
    }
}
