package com.mb.project.controller;

import java.util.Random;

public class OtpHandler {
	
	public static int generateOtp() {
        Random random = new Random();
        int otpValue = 1000 + random.nextInt(9000); // Ensures a 4-digit OTP
        return otpValue;
    }

}
