package com.niit.crudappfrontend.controller;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.crudappbackend.dao.CategoryDAO;
import com.niit.crudappbackend.model.Category;


@Controller
public class CategoryController {

	@Autowired
	CategoryDAO categoryDAO;
	
	@RequestMapping(value="/addcategory",method=RequestMethod.GET)
	public String listPersons(Model model)
	{
		model.addAttribute("category",new Category());
		System.out.println("inside categorycontroller");
		
		model.addAttribute("listCategory",categoryDAO.listCategory());
		return "addcategory";
	}
	
	@RequestMapping(value= "/category/add", method = RequestMethod.POST)
	public String addCategory(@Valid @ModelAttribute("category") Category category,BindingResult result,HttpServletRequest request)
	{
			if (category.getId() == 0) {
				categoryDAO.addCategory(category);
			} else {
				categoryDAO.updateCategory(category);
			}

			return "redirect:/addcategory";
		}

		@RequestMapping("/removeid1/{id}")
		public String removeCategory(@PathVariable("id") int id)
		{
			categoryDAO.removeCategory(id);
			return "redirect:/addcategory";
		}
		
		@RequestMapping("/editid1/{id}")
		public String editCategory(@PathVariable("id") int id, Model model)
		{
			model.addAttribute("category", categoryDAO.getCategoryById(id));
	        model.addAttribute("listCategory", categoryDAO.listCategory());
	        return "addcategory";
		}

}
