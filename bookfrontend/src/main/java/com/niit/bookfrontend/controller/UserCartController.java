package com.niit.bookfrontend.controller;
import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.bookbackend.dao.UserDAO;
import com.niit.bookbackend.model.UserDetails;

	@Controller
	@RequestMapping("/categoryDropdown/productDisplay/usercart/cart")
	public class UserCartController {

	    @Autowired
	    private UserDAO userDAO;
	    
	   
	    @RequestMapping
	    public String getCartItems(Principal username,Model model){
	    	UserDetails userDetails = userDAO.get(username.getName());
	        int cartId = userDetails.getCart().getCartId();
	        
	        return "redirect:/user/cart/"+cartId;
	    }
	   
	    @RequestMapping("/{cartId}")
	    public String getNewUrl(@PathVariable (value = "cartId") int cartId, Model model) {
	        model.addAttribute("cartId", cartId);

	        return "cart";
	    }

	}

