package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.UsuarioGrupo;

@Repository
@RemotingDestination
public class UsuarioGrupoService extends AbstractService {
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<UsuarioGrupo> list() {
		return (List<UsuarioGrupo>) getSession().createQuery("from UsuarioGrupo").list();
	}
	
	@Transactional
	public List<UsuarioGrupo> save(UsuarioGrupo t)
	{
		try {
			getSession().save(t);
			return list();
		}catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<UsuarioGrupo> update(UsuarioGrupo t)
	{
		try {
			getSession().merge(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<UsuarioGrupo> remove(UsuarioGrupo t)
	{
		try {
			getSession().delete(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}

}