package com.hirehub2PointO.util;

import java.util.Random;

public class OTPGenerator {
    public String generateOtp() {
        Random ran = new Random();
        int otp = 100000 + ran.nextInt(900000);
        return String.valueOf(otp);
    }
}