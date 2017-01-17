package com.niit.bookbackend.dao;

import com.niit.bookbackend.model.ShippingAddress;

public interface ShippingAddressDAO {
	void saveOrUpdate(ShippingAddress shippingAddress);
	
	void deleteShippingAddress(String shippingAddressId);

	ShippingAddress getShippingAddress(String shippingAddressId);



}
