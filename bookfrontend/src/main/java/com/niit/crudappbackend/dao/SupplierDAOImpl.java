package com.niit.crudappbackend.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.niit.crudappbackend.model.Supplier;



@Repository("SupplierDAO")

@Transactional
@EnableTransactionManagement

public class SupplierDAOImpl implements SupplierDAO {
	
	@Autowired(required=true)
	SessionFactory sessionFactory;

	public void addSupplier(Supplier p) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.persist(p);
		
	}

	public void updateSupplier(Supplier p) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.update(p);
	}

	public List<Supplier> listSupplier() {
		Session session=sessionFactory.getCurrentSession();
		List<Supplier> Suppliers=session.createQuery("from Supplier").getResultList();
		return Suppliers;
	}

	public Supplier getSupplierById(int id) {
		Session session=sessionFactory.getCurrentSession();
		Supplier Supplier=(Supplier)session.createQuery("from Supplier where id="+id).getSingleResult();
		return Supplier;
	}

	public void removeSupplier(int id) {
		Session session=sessionFactory.getCurrentSession();
		Supplier Supplier=(Supplier)session.createQuery("from Supplier where id="+id).getSingleResult();
		session.delete(Supplier);
		
	}

}
