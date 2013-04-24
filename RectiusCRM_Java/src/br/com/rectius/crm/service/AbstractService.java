package br.com.rectius.crm.service;

import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;

import br.com.rectius.crm.dao.MessagingDAO;

public class AbstractService extends MessagingDAO {
	
	private SessionFactory sessionFactory;
	@Autowired
	public void setSessionFactory(SessionFactory factory)
	{
		sessionFactory = factory;
	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

}
