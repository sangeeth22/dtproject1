package com.niit.bookbackend.dao;

import java.io.IOException;

import com.niit.bookbackend.model.Cart;


public interface CartDAO {
	 Cart getCartById (int cartId);
Cart validate(int cartId) throws IOException;
	   void update(Cart cart);
}
