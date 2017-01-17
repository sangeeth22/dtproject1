	package com.niit.bookfrontend.controller;
	
	import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndView;

import com.niit.bookbackend.dao.UserDAO;
import com.niit.bookbackend.model.UserDetails;


	
	@Controller
	public class HomeController {
		@Autowired
		UserDetails userDetails;
		@Autowired(required=true)
		UserDAO userDAO;
		@RequestMapping("/")
		public String gotohome()
		{
			return "home";
					
		}
		@RequestMapping("/home")
		public String home()
		{
			return "home";
		}
		@RequestMapping("/under_construction")
		public String developing()
		{
			return "developing";
		}
		@RequestMapping("/welcome")
		public String logging(HttpSession Session)
		{
			Session.setAttribute("SuccessMessage","Login Successful");
			return "home";
		}
		@RequestMapping("/welcome1")
		public String validate(@RequestParam("userID")String userID,@RequestParam("password") String pwd,HttpSession Session)
		{
			if((userID.equals("niit") && pwd.equals("niit")))
			{
				Session.setAttribute("SuccessMessage","Login Successful");
			}
			else
			{
				if((userID.equals("admin")&&pwd.equals("admin")))
				{
					Session.setAttribute("SuccessMessage","Login Successful");
					return "admin";
				}
				else
				{
					Session.setAttribute("ErrorMessage","Invalid Credentials");
				}
				Session.setAttribute("ErrorMessage","Invalid Credentials");
			}
			return "index";
		}
		@RequestMapping("/suggestion_cart")
		public String suggestion()
		{
			return "suggestion";
		}
		@RequestMapping("/wedding_suggestion")
		public String wedding()
		{
			return "suggestion1";
		}
		@RequestMapping("/birthday_suggestion")
		public String birthday()
		{
			return "suggestion2";
		}
		@RequestMapping("/aboutus")
		public String aboutus()
		{
			return "aboutus";
		}
		@RequestMapping("/appliance_products")
		public String appliance()
		{
			return "product1";
		}
		@RequestMapping("/Books&More")
		public String books()
		{
			return "product2";
		}
		@RequestMapping("/contactus")
		public String contactus()
		{
			return "contactus";
		}
		@RequestMapping("/admin")
		public String admin()
		{
			return "admin";
		}
		@RequestMapping("/invalid")
		public String invalid(HttpSession Session)
		{
			Session.setAttribute("ErrorMessage","Invalid Credentials");
			return "index";
		}
		@RequestMapping("/login")
		public String login(HttpSession Session)
		{
			return "login";
		}
		@RequestMapping("/register")
		public ModelAndView registerhere()
		{
			ModelAndView mv = new ModelAndView("register");
			mv.addObject("userDetails", userDetails);
		
			return mv;
		}
		@RequestMapping(value="success",method = RequestMethod.POST)
		public ModelAndView registerUser(@ModelAttribute UserDetails userDetails)
		{
			ModelAndView mv;
			String msg;
			msg="You have registered successfully.Please log in to continue";
			userDAO.save(userDetails);
		  
			mv= new ModelAndView("/login");
			mv.addObject("msg",msg);
			return mv;
	}
		@RequestMapping("/logout")
		public String logout(HttpSession Session, HttpServletResponse response){
			response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
			response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
			response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
			response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
			Session.invalidate();
			return "home";
		}
	}
