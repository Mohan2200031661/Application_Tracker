package com.mb.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mb.project.model.OTP;
import java.util.List;


public interface OTPRepository extends JpaRepository<OTP, Integer> {
	
	public List<OTP> findByEmail(String email);
	public void removeByAllIgnoreCaseEmail(String email);
	
	@Query("select o from OTP o where o.email=?1")
	public void deleteByEmail(String email);
	
	public OTP findByEmailAndOtp(String email,int otp);
	

}
