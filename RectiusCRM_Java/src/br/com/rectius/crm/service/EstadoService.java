package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.Estado;
import br.com.rectius.crm.vo.Pais;

@Repository
@RemotingDestination
public class EstadoService extends AbstractService {
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Estado> list() {
		return (List<Estado>) getSession().createQuery("from Estado order by sigla").list();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Estado> listByPais(Pais pais) {
		Query q = getSession().createQuery("from Estado where pais=:pais");
		q.setParameter("pais", pais);
		return (List<Estado>) q.list();
	}

	
	@Transactional
	public List<Estado> save(Estado t)
	{
		try {
			getSession().save(t);
			return list();
		}catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<Estado> update(Estado t)
	{
		try {
			getSession().merge(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<Estado> remove(Estado t)
	{
		try {
			getSession().delete(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}

}