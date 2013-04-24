package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.Contrato;

@Repository
@RemotingDestination
public class ContratoService extends AbstractService {
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Contrato> list() {
		return (List<Contrato>) getSession().createQuery("from Contrato order by projeto.inicio ASC").list();
	}
	
	@Transactional
	public List<Contrato> save(Contrato t)
	{		
		try {			
			getSession().save(t);
			return list();
		} catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<Contrato> update(Contrato t)
	{
		try {
			getSession().merge(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<Contrato> remove(Contrato t)
	{
		try {
			getSession().delete(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}

}