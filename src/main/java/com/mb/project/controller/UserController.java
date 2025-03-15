package com.mb.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mb.project.model.JobLink;
import com.mb.project.model.User;
import com.mb.project.service.JobLinkServiceImpl;
import com.mb.project.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController 
{
	@Autowired
	private UserService userService;
	
	@Autowired
	private JobLinkServiceImpl jobLinkServiceImpl;
	
	@GetMapping("/")
	public ModelAndView start() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("start");
		return mv;
	}
	
	@GetMapping("userregis")
	public ModelAndView userregis()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("userregis");
		return mv;
	}
	
	@PostMapping("insertuser")
    public ModelAndView insertemp(HttpServletRequest request)
    {
		 String uid=request.getParameter("uid");
         String name = request.getParameter("uname");
         String password = request.getParameter("password");
         
         User us=new User();
         us.setId(uid);
         us.setName(name);
         us.setPassword(password);
         us.setEmail(uid+"@kluniversity.in");
         us.setUserType(User.UserType.USER);
         
         
         String msg = userService.addUser(us);
       
          ModelAndView mv = new ModelAndView("regsuccess");
          mv.addObject("message", msg);
     
          return mv;
    }
	
	@GetMapping("regsuccess")
	public ModelAndView regsuccess() 
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("regsuccess");
		return mv;
	}
	
	@PostMapping("checkuserlogin")
	public ModelAndView checkuserlogin(HttpServletRequest request,HttpServletResponse response)
	{
	    ModelAndView mv = new ModelAndView();

	    String uid = request.getParameter("uid");
	    String pwd = request.getParameter("password");

	    User u = userService.checkuserlogin(uid, pwd);
	    if (u != null)
	    {
	        HttpSession session = request.getSession();
	        session.setAttribute("u", u);

	        if (u.getUserType() == User.UserType.ADMIN) 
	        {
	            mv.setViewName("adminhome"); // Redirect to admin home
	        }
	        else
	        {
	            mv.setViewName("userhome"); 
	        }
	    }
	    else
	    {
	        mv.setViewName("loginfail");
	        mv.addObject("message", "Login Failed! Invalid credentials.");
	    }
	    return mv;
	}

	@GetMapping("login")
	public ModelAndView login()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@GetMapping("userhome")
	public ModelAndView userhome()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("userhome");
		return mv;
	}
	@GetMapping("adminhome")
	public ModelAndView adminhome()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("adminhome");
		return mv;
	}
	
	@GetMapping("userlogout")
	public ModelAndView userlogout(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		
		session.removeAttribute("u");
		
		ModelAndView mv=new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@GetMapping("usersessionfail")
	public ModelAndView usersessionfail()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("usersessionfail");
		return mv;
	}
	
	@GetMapping("viewprofile")
	public ModelAndView viewprofile()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("viewprofile");
		return mv;
	}
	
	 @GetMapping("userviewjobs")
		public ModelAndView userviewjobs() 
		{
		    ModelAndView mv = new ModelAndView();
		    List<JobLink> jl = jobLinkServiceImpl.viewalljoblinks();
		    long count = jobLinkServiceImpl.jobcount();
		    mv.setViewName("userviewjobs");
		    mv.addObject("jl", jl);
		    
			mv.addObject("count", count);
		    return mv;
		}
	
}
