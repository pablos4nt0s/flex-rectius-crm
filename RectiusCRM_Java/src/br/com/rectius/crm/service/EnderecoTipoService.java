package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.EnderecoTipo;

@Repository
@RemotingDestination
public class EnderecoTipoService extends AbstractService {
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<EnderecoTipo> list() {
		return (List<EnderecoTipo>) getSession().createQuery("from EnderecoTipo").list();
	}
	
	@Transactional
	public List<EnderecoTipo> save(EnderecoTipo t)
	{
		try {
			getSession().save(t);
			return list();
		}catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<EnderecoTipo> update(EnderecoTipo t)
	{
		try {
			getSession().merge(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<EnderecoTipo> remove(EnderecoTipo t)
	{
		try {
			getSession().delete(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}

}