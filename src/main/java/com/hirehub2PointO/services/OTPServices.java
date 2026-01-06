package com.hirehub2PointO.services;

import com.hirehub2PointO.util.OTPGenerator;

import java.time.LocalDateTime;

public class OTPServices {

    private final OTPGenerator otpGenerator = new OTPGenerator();

    public String getOtp() {
        return otpGenerator.generateOtp();
    }

    public boolean isExpireOTP(LocalDateTime otpExpireTime) {
        return otpExpireTime == null || LocalDateTime.now().isAfter(otpExpireTime);
    }

    private boolean isValidate(String sessionOTP, String enteredOTP) {
        return !isExpireOTP(LocalDateTime.now()) && sessionOTP.equals(enteredOTP);
    }
}
