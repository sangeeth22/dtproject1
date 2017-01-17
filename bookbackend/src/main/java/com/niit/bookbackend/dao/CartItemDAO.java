package com.niit.bookbackend.dao;

import com.niit.bookbackend.model.Cart;
import com.niit.bookbackend.model.CartItem;

public interface CartItemDAO {
	void addCartItem(CartItem cartItem);

    void removeCartItem(CartItem cartItem);

    void removeAllCartItems(Cart cart);

    CartItem getCartItemByItemId (int itemId);

}
