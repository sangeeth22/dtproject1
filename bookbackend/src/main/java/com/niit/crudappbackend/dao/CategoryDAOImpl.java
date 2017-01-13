package com.niit.crudappbackend.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.crudappbackend.model.Category;



@Repository("CategoryDAO")

@Transactional
@EnableTransactionManagement

public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired(required=true)
	SessionFactory sessionFactory;

	public void addCategory(Category p) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.persist(p);
		
	}

	public void updateCategory(Category p) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.update(p);
	}

	public List<Category> listCategory() {
		Session session=sessionFactory.getCurrentSession();
		List<Category> Categorys=session.createQuery("from Category").getResultList();
		return Categorys;
	}

	public Category getCategoryById(int id) {
		Session session=sessionFactory.getCurrentSession();
		Category Category=(Category)session.createQuery("from Category where id="+id).getSingleResult();
		return Category;
	}

	public void removeCategory(int id) {
		Session session=sessionFactory.getCurrentSession();
		Category Category=(Category)session.createQuery("from Category where id="+id).getSingleResult();
		session.delete(Category);
		
	}

}
