package com.mb.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mb.project.service.SendEmailService;

import ch.qos.logback.core.model.Model;

@RestController
public class MailController {
	
	@GetMapping("emailsent")
	public ModelAndView emailSent()
	{
		ModelAndView mv=new ModelAndView("emailsent");
		return mv;
	}
	
	
}
