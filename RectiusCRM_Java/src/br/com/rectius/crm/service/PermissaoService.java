package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.Permissao;
import br.com.rectius.crm.vo.UsuarioGrupo;

@Repository
@RemotingDestination
public class PermissaoService extends AbstractService {
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Permissao> list() {
		return (List<Permissao>) getSession().createQuery("from Permissao order by codigo ASC").list();
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Permissao> listByGrupo(UsuarioGrupo grupo) {
		Query q = getSession().createQuery("from Permissao where grupo=:grupo");
		q.setParameter("grupo", grupo);
		return (List<Permissao>) q.list();
	}

	@Transactional
	public List<Permissao> save(Permissao t)
	{
		try {
			getSession().save(t);
			return list();
		}catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<Permissao> update(Permissao t)
	{
		try {
			getSession().merge(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<Permissao> remove(Permissao t)
	{
		try {
			getSession().delete(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}

}