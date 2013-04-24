package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.Pais;

@Repository
@RemotingDestination
public class PaisService extends AbstractService {
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Pais> list() {
		return (List<Pais>) getSession().createQuery("from Pais order by sigla").list();
	}
	
	@Transactional
	public List<Pais> save(Pais t)
	{
		try {
			getSession().save(t);
			return list();
		}catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<Pais> update(Pais t)
	{
		try {
			getSession().merge(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<Pais> remove(Pais t)
	{
		try {
			getSession().delete(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}

}