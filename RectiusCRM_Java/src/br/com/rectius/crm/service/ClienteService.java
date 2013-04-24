package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.Cliente;

@Repository
@RemotingDestination
public class ClienteService extends AbstractService {
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Cliente> list() {
		return (List<Cliente>) getSession().createQuery("from Cliente").list();
	}
	
	@Transactional
	public List<Cliente> save(Cliente t)
	{
		try {
			getSession().save(t);
			return list();
		}catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<Cliente> update(Cliente t)
	{
		try {
			getSession().merge(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<Cliente> remove(Cliente t)
	{
		try {
			getSession().delete(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}

}