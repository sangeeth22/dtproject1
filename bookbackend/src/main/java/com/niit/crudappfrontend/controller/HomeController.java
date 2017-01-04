package com.niit.crudappfrontend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String gotohome(Model model)
	{
		model.addAttribute("home","true");
		return "index";
	}
	
	@RequestMapping("/validate")
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
		
	}
	
	@RequestMapping("/login")
	public String login( Model model)
	{
		model.addAttribute("userClickedLogin","true");
		return "login";
	}
	@RequestMapping("/registration")
	public String registration( Model model)
	{
		model.addAttribute("userClickedregistration","true");
		return "registration";
	}
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
}
