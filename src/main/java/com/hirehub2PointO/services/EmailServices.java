package com.hirehub2PointO.services;

import com.hirehub2PointO.util.EmailUtil;

import java.time.LocalDate;

public class EmailServices {

    private final OTPServices otpServices = new OTPServices();
    private final EmailUtil emailUtil = new EmailUtil();

    public String sendOTP(String email) {
        String otp = otpServices.getOtp();
        if (emailUtil.send(email, otp)) {
            return otp;
        }
        return null;
    }

    public boolean sendFeedback(String name, String email, String subject, String message) {
        return emailUtil.send(name, email, subject, message);
    }

    public boolean sendNotification(String email, String title, String companyName, String location, LocalDate postedDate) {
        return emailUtil.send(email, title, companyName, location, postedDate);
    }
}
