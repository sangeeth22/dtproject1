package com.niit.crudappbackend;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

import com.niit.crudappbackend.config.AppContextConfig;
import com.niit.crudappbackend.dao.PersonDAO;
import com.niit.crudappbackend.model.Person;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	AbstractApplicationContext context=new AnnotationConfigApplicationContext(AppContextConfig.class);
        
        PersonDAO personDAO=(PersonDAO)context.getBean("personDAO");
        
        Person person=new Person();
        person.setName("Som");
        person.setCountry("India");
        
        personDAO.addPerson(person);
    }
}
