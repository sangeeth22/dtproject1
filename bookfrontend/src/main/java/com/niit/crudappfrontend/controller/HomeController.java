package com.niit.crudappfrontend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.crudappbackend.dao.UserDAO;
import com.niit.crudappbackend.model.UserDetails;

@Controller
public class HomeController {
	@Autowired
	UserDetails userDetails;
	@Autowired(required=true)
	UserDAO userDAO;
	@RequestMapping("/")
	public String gotohome(Model model)
	{
		model.addAttribute("home","true");
		return "index";
	}
	
	/*@RequestMapping("/validate")
	public String validate(@RequestParam("userid")String id,@RequestParam("password") String pwd,Model model)
	{
		if(id.equals("niit") && pwd.equals("niit"))
		{
			model.addAttribute("SuccessMessage","Login Successful");
			return "index";
		}
		else if(id.equals("abc")&& pwd.equals("def"))
		{
			model.addAttribute("SuccessAdmin","successfully logged in");
			return "admin";
		}
		else
		{
			model.addAttribute("ErrorMessage","Invalid Credentials");
			return "index";
		}
		
	}*/
	
	/*@RequestMapping("/login")
	public String login( Model model)
	{
		model.addAttribute("userClickedLogin","true");
		return "login";
	}*/
	/*@RequestMapping("/registration")
	public String registration( Model model)
	{
		model.addAttribute("userClickedregistration","true");
		return "registration";
	}*/
	@RequestMapping("/aboutus")
	public String aboutus( Model model)
	{
		model.addAttribute("userClickedAboutus","true");
		return "aboutus";
	}
	@RequestMapping("/contactus")
	public String contactus( Model model)
	{
		model.addAttribute("userClickedcontactus","true");
		return "contactus";
	}
	
	@RequestMapping("/index")
	public String index( Model model)
	{
		model.addAttribute("userClickedhome","true");
		return "index";
	}
	@RequestMapping("/addcategory")
	public String addcategory( Model model)
	{
		model.addAttribute("userClickedcategory","true");
		return "addcategory";
	}
	@RequestMapping("/addproduct")
	public String addproduct( Model model)
	{
		model.addAttribute("userClickedproduct","true");
		return "addproduct";
	}
	@RequestMapping("/addsupplier")
	public String addsupplier( Model model)
	{
		model.addAttribute("userClickedaddsupplier","true");
		return "addsupplier";
	}
	@RequestMapping("/kids book")
	public String kidsbook( Model model)
	{
		model.addAttribute("userClickedaddsupplier","true");
		return "kids book";
	}
	@RequestMapping("/youngsters and teens book")
	public String youngstersandteensbook ( Model model)
	{
		model.addAttribute("userClickedaddsupplier","true");
		return "youngsters and teens book";
	}
	@RequestMapping("/text book")
	public String textbook( Model model)
	{
		model.addAttribute("userClickedaddsupplier","true");
		return "text book";
	}
	@RequestMapping("/Login")
	public ModelAndView Login()
	{
		System.out.println("login page");
		ModelAndView mv=new ModelAndView("Login");
		mv.addObject("userDetails",userDetails);
		return mv;
	}
	/*
     * Register method is used to handle user details  related functionality
     */
	@RequestMapping("/Register")
	public ModelAndView registerhere()
	{
		ModelAndView mv = new ModelAndView("Register");
		mv.addObject("userDetails", userDetails);
	
		return mv;
	}
	@RequestMapping(value="Success",method = RequestMethod.POST)
	public ModelAndView registerUser(@ModelAttribute UserDetails userDetails)
	{
		ModelAndView mv;
		String msg;
		msg="You have registered successfully.Please log in to continue";
		userDAO.save(userDetails);
	  
		mv= new ModelAndView("/Success");
		mv.addObject("msg",msg);
		return mv;
}
	
}
