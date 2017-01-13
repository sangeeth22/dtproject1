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

import com.niit.crudappbackend.dao.SupplierDAO;
import com.niit.crudappbackend.model.Supplier;


@Controller
public class SupplierController {

	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping(value="/addsupplier",method=RequestMethod.GET)
	public String listPersons(Model model)
	{
		model.addAttribute("supplier",new Supplier());
		System.out.println("inside suppliercontroller");
		
		model.addAttribute("listSupplier",supplierDAO.listSupplier());
		return "addsupplier";
	}
	
	@RequestMapping(value= "/supplier/add", method = RequestMethod.POST)
	public String addSupplier(@Valid @ModelAttribute("supplier") Supplier supplier,BindingResult result,HttpServletRequest request)
	{
			if (supplier.getId() == 0) {
				supplierDAO.addSupplier(supplier);
			} else {
				supplierDAO.updateSupplier(supplier);
			}

			return "redirect:/addsupplier";
		}

		@RequestMapping("/removeid2/{id}")
		public String removeSupplier(@PathVariable("id") int id)
		{
			supplierDAO.removeSupplier(id);
			return "redirect:/addsupplier";
		}
		
		@RequestMapping("/editid2/{id}")
		public String editSupplier(@PathVariable("id") int id, Model model)
		{
			model.addAttribute("supplier", supplierDAO.getSupplierById(id));
	        model.addAttribute("listSupplier", supplierDAO.listSupplier());
	        return "addsupplier";
		}

}
