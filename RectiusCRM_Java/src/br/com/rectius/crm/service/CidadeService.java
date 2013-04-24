package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.Cidade;
import br.com.rectius.crm.vo.Estado;

@Repository
@RemotingDestination
public class CidadeService extends AbstractService {
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Cidade> list() {
		return (List<Cidade>) getSession().createQuery("from Cidade order by nome").list();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Cidade> listByEstado(Estado uf) {
		Query q = getSession().createQuery("from Cidade where uf=:uf");
		q.setParameter("uf", uf);
		return (List<Cidade>) q.list();
	}

	
	@Transactional
	public List<Cidade> save(Cidade t)
	{
		try {
			getSession().save(t);
			return list();
		}catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<Cidade> update(Cidade t)
	{
		try {
			getSession().merge(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<Cidade> remove(Cidade t)
	{
		try {
			getSession().delete(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}

}