package com.niit.crudappfrontend.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

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

import com.niit.crudappbackend.dao.PersonDAO;
import com.niit.crudappbackend.model.Person;

@Controller
public class PersonController {
	
	@Autowired
	PersonDAO personDAO;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String listPersons(Model model)
	{
		model.addAttribute("person",new Person());
		System.out.println("inside controller");
		
		model.addAttribute("listPersons",personDAO.listPersons());
		return "index";
	}

	@RequestMapping(value= "/person/add", method = RequestMethod.POST)
	public String addPerson(@Valid @ModelAttribute("person") Person person,BindingResult result,HttpServletRequest request)
	{
		
		String filename = null;
		byte[] bytes;
		
		if (!person.getImage().isEmpty()) {

			try {
				
				bytes = person.getImage().getBytes();
				personDAO.addPerson(person);
				System.out.println("Data Inserted");
				String path = request.getSession().getServletContext().getRealPath("/resources/images/" + person.getId() + ".jpg");
				System.out.println("Path = " + path);
				System.out.println("File name = " + person.getImage().getOriginalFilename());
				File f = new File(path);
				BufferedOutputStream bs = new BufferedOutputStream(new FileOutputStream(f));
				bs.write(bytes);
				bs.close();
				System.out.println("Image uploaded");
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
			}
		}
		
		if(result.hasErrors())
		{
			return "index";
		}
		else{
			if (person.getId() == 0) {
				personDAO.addPerson(person);
			} else {
				personDAO.updatePerson(person);
			}

			return "redirect:/";
		}
	}
	
	
	@RequestMapping("/remove/{id}")
	public String removePerson(@PathVariable("id") int id)
	{
		personDAO.removePerson(id);
		return "redirect:/";
	}
	
	@RequestMapping("/edit/{id}")
	public String editPerson(@PathVariable("id") int id, Model model)
	{
		model.addAttribute("person", personDAO.getPersonById(id));
        model.addAttribute("listPersons", personDAO.listPersons());
        return "index";
	}
	
}
