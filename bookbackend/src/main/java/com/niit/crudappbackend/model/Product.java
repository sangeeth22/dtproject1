package com.niit.crudappbackend.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name="PRODUCT")
public class Product {

	@Id
	@GeneratedValue
	private int id;
	
	@Column
	@Size(min=2,max=10,message="Name has to be between 2 to 10 characters")
	private String name;
	
	@Column
	private double price;
	
	@Column
	@Size(min=2,max=10,message="Name has to be between 2 to 10 characters")
	private String description;
	
	@Transient
	public MultipartFile image;
	
	
	public int getId() {
		return id;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	

	
}
