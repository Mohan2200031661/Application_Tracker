package com.mb.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;


@Service
public class SendEmailService {
	
	    @Autowired
	    private JavaMailSender mailSender;

	    private static final String NO_REPLY_EMAIL = "$(spring.mail.username)";

	    public void sendFormattedEmail(String to, String subject, String content) throws MessagingException {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	        helper.setFrom(NO_REPLY_EMAIL);
	        helper.setTo(to);
	        helper.setSubject(subject);
	        helper.setText(content, true);

	        mailSender.send(message);
	    }

}
