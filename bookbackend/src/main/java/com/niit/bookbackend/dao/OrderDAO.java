package com.niit.bookbackend.dao;

import com.niit.bookbackend.model.UserOrder;

public interface OrderDAO {
	void addOrder(UserOrder userOrder);
    double getOrderGrandTotal(int cartId);
}

