package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.TelefoneTipo;

@Repository
@RemotingDestination
public class TelefoneTipoService extends AbstractService {
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<TelefoneTipo> list() {
		return (List<TelefoneTipo>) getSession().createQuery("from TelefoneTipo").list();
	}
	
	@Transactional
	public List<TelefoneTipo> save(TelefoneTipo t)
	{
		try {
			getSession().save(t);
			return list();
		}catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<TelefoneTipo> update(TelefoneTipo t)
	{
		try {
			getSession().merge(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<TelefoneTipo> remove(TelefoneTipo t)
	{
		try {
			getSession().delete(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}

}