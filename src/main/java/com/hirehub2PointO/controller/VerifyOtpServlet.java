package com.hirehub2PointO.controller;

import com.hirehub2PointO.model.User;
import com.hirehub2PointO.services.OTPServices;
import com.hirehub2PointO.services.UserServices;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/verifyOtpServlet")
public class VerifyOtpServlet extends HttpServlet {

    private UserServices userServices;
    private OTPServices otpServices;

    @Override
    public void init() {
        userServices = new UserServices();
        otpServices = new OTPServices();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String from = (String) session.getAttribute("from");
        String enteredOtp = req.getParameter("otp");
        String sessionOtp = (String) session.getAttribute("otp");
        LocalDateTime expireOtp = (LocalDateTime) session.getAttribute("otpExpire");

        if (otpServices.isExpireOTP(expireOtp)) {
            session.setAttribute("sessionExpire", true);
            resp.sendRedirect(from);
            return;
        } else if (!enteredOtp.equals(sessionOtp)) {
            session.setAttribute("wrongOtp", true);
            resp.sendRedirect("otpVerification.jsp");
            return;
        }

        if ("signup.jsp".equals(from)) {
            // Create user
            User user = new User();
            user.setUsername((String) session.getAttribute("tempUsername"));
            user.setUserMail((String) session.getAttribute("tempEmail"));
            user.setPassword((String) session.getAttribute("tempPassword"));
            user.setUserStatus((String) session.getAttribute("tempUserStatus"));

            userServices.saveUser(user);

            session.setAttribute("signupSuccess", true);
            resp.sendRedirect("login.jsp");
        } else if ("forgotPassword.jsp".equals(from) && userServices.isUserExist((String) session.getAttribute("tempEmail"))) {
            req.setAttribute("tempEmail", session.getAttribute("tempEmail"));
            resp.sendRedirect("resetPassword.jsp");
        }
    }
}
