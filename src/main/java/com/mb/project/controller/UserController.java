package com.mb.project.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mb.project.model.JobLink;
import com.mb.project.model.User;
import com.mb.project.service.JobLinkServiceImpl;
import com.mb.project.service.SendEmailService;
import com.mb.project.service.UserService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private JobLinkServiceImpl jobLinkServiceImpl;
	
	@Autowired
	private SendEmailService emailService;
	

	@GetMapping("/")
	public ModelAndView start() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@GetMapping("userregis")
	public ModelAndView userregis() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userregis");
		return mv;
	}

	 @PostMapping("insertuser")
	    public ModelAndView insertUser(HttpServletRequest request) {
	        String uid = request.getParameter("uid");
	        String name = request.getParameter("uname");
	        String email = uid + "@kluniversity.in";

	        // Get current host dynamically
	        String host = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();

	        // Generate a verification link based on the current host
	        String verificationLink = host + "/setpassword?uid=" + uid + "&uname=" + name;

	        // Email content
	        String subject = "User Registration - Set Your Password";
	        String content = "<p>Hello <b>" + name + "</b>,</p>"
	                        + "<p>Click the link below to set your password:</p>"
	                        + "<p><a href='" + verificationLink + "'>Set Password</a></p>"
	                        + "<p>Thank you.</p>";

	        try {
	            emailService.sendFormattedEmail(email, subject, content);
	        } catch (MessagingException e) {
	            e.printStackTrace();
	            return new ModelAndView("emailfail", "message", "Failed to send email.");
	        }

	        return new ModelAndView("emailsent", "message", "A verification email has been sent to " + email);
	    }

	    @GetMapping("setpassword")
	    public ModelAndView showSetPasswordPage(HttpServletRequest request) {
	        String uid = request.getParameter("uid");
	        String uname = request.getParameter("uname");

	        ModelAndView mv = new ModelAndView("setpassword");
	        mv.addObject("uid", uid);
	        mv.addObject("uname", uname);
	        return mv;
	    }

	 @PostMapping("setpassword")
	 public ModelAndView setPassword(HttpServletRequest request) {
	        String uid = request.getParameter("uid");
	        String name = request.getParameter("uname");
	        String password = request.getParameter("password");

	        User us = new User();
	        us.setId(uid);
	        us.setName(name);
	        us.setPassword(password);
	        us.setEmail(uid + "@kluniversity.in");
	        us.setUserType(User.UserType.USER);

	        userService.addUser(us);

	        return new ModelAndView("regsuccess", "message", "Registration successful!");
	        
	 }
	        
	@GetMapping("regsuccess")
	public ModelAndView regsuccess() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("regsuccess");
		return mv;
	}

	@PostMapping("checkuserlogin")
	public ModelAndView checkuserlogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();

		String uid = request.getParameter("uid");
		String pwd = request.getParameter("password");

		User u = userService.checkuserlogin(uid, pwd);
		if (u != null) {
			HttpSession session = request.getSession();
			session.setAttribute("u", u);

			if (u.getUserType() == User.UserType.ADMIN) {
				mv.setViewName("redirect:adminhome"); // Redirect to admin home
			} else {
				mv.setViewName("userhome");
			}
		} else {
			mv.setViewName("loginfail");
			mv.addObject("message", "Login Failed! Invalid credentials.");
		}
		return mv;
	}

	@GetMapping("login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@GetMapping("userhome")
	public ModelAndView userhome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("userhome");
		return mv;
	}

	@GetMapping("adminhome")
	public ModelAndView adminhome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		return mv;
	}

	@GetMapping("userlogout")
	public ModelAndView userlogout(HttpServletRequest request) {
		HttpSession session = request.getSession();

		session.removeAttribute("u");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}

	@GetMapping("usersessionfail")
	public ModelAndView usersessionfail() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("usersessionfail");
		return mv;
	}

	@GetMapping("viewprofile")
	public ModelAndView viewprofile() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewprofile");
		return mv;
	}

	@GetMapping("userviewjobs")
	public ModelAndView userviewjobs() {
		ModelAndView mv = new ModelAndView();
		List<JobLink> jl = jobLinkServiceImpl.viewalljoblinks();
		long count = jobLinkServiceImpl.jobcount();
		mv.setViewName("userviewjobs");
		mv.addObject("jl", jl);

		mv.addObject("count", count);
		return mv;
	}

	@PostMapping("updateuserprofile")
    public ModelAndView updateuserProfile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User sessionUser = (User) session.getAttribute("u");

        if (sessionUser == null) {
            return new ModelAndView("usersessionfail");
        }

        String name = request.getParameter("uname");
        String password = request.getParameter("password");

        User existingUser = userService.viewUserById(sessionUser.getId());

        if (existingUser != null) {
            existingUser.setName(name);
            existingUser.setPassword(password);  // Secure password storage
            userService.updateuser(existingUser);

            session.setAttribute("u", existingUser);  // Update session with new details

            ModelAndView mv = new ModelAndView("profileupdatesuccess");
            mv.addObject("message", "Profile Updated Successfully!");
            return mv;
        } else {
            return new ModelAndView("profileupdatefail", "message", "User Not Found!");
        }
    }

    @GetMapping("updateprofile")
    public ModelAndView updateprofile(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("u");

        if (u == null) {
            return new ModelAndView("usersessionfail");
        }

        ModelAndView mv = new ModelAndView("updateprofile");
        mv.addObject("user", u);
        return mv;
    }


}
