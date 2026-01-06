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

@WebServlet("/signupServlet")
public class SignupServlet extends HttpServlet {

    private UserServices userService;
    private EmailServices emailServices;

    @Override
    public void init() {
        userService = new UserServices();
        emailServices = new EmailServices();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String userStatus = req.getParameter("userStatus");
        String username = req.getParameter("name");
        String userMail = req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session = req.getSession();

//         check if user already exists
        if (userService.isUserExist(userMail)) {
            session.setAttribute("userAlreadyExist", true);
            resp.sendRedirect("signup.jsp");
            return;
        }

        String otp = emailServices.sendOTP(userMail);

        if (otp != null) {
            session.setAttribute("from", "signup.jsp");
            session.setAttribute("otp", otp);
            session.setAttribute("otpSend", true);
            session.setAttribute("otpExpire", LocalDateTime.now().plusMinutes(10));
            session.setAttribute("tempUserStatus", userStatus);
            session.setAttribute("tempUsername", username);
            session.setAttribute("tempEmail", userMail);
            session.setAttribute("tempPassword", password);

            resp.sendRedirect("otpVerification.jsp");
        } else {
            session.setAttribute("otpNotSend", true);
            resp.sendRedirect("signup.jsp");
        }
    }
}
