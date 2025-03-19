package com.mb.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mb.project.model.OTP;
import com.mb.project.repository.OTPRepository;

@Service
public class OtpService {
	
	@Autowired
	private OTPRepository otpRepository;
	
	public OTP insertOtp(OTP otp)
	{
		if(otpRepository.findByEmail(otp.getEmail()).size()>0)
		{
			List<OTP> o=otpRepository.findByEmail(otp.getEmail());
			otpRepository.deleteById(o.get(0).getId());
		}
		
		return otpRepository.save(otp);
	}
	
	public OTP findOne(int id)
	{
		return otpRepository.findById(id).get();
	}
	
	public void VerifiedOtp(int id)
	{
		otpRepository.deleteById(id);
	}

}
