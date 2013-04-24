package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.Usuario;

@Repository
@RemotingDestination
public class UsuarioService extends AbstractService {
	
	@Transactional
	public Usuario getById(Long id) {
		Query q = getSession().createQuery("from Usuario where id=:id");
		q.setParameter("id", id);
		Usuario u = (Usuario) q.uniqueResult();
		
		return u != null ? u : null;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Usuario> list() {
		Query q = getSession().createQuery("from Usuario");
		List<Usuario> u = q.list();
		
		return u;
	}
	
	@Transactional
	public List<Usuario> save(Usuario u)
	{
		try {
			getSession().save(u);
			return list();
		}catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<Usuario> update(Usuario u)
	{
		try {
			getSession().merge(u);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<Usuario> remove(Usuario u)
	{
		try {
			getSession().delete(u);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public Usuario changePassword(String username, String oldPassword, String newPassord) {
		if(oldPassword.equals(newPassord)) {
			Query q = getSession().createQuery("from Usuario where usuario=:username and senha=:password");
			q.setParameter("username", username);
			q.setParameter("password", oldPassword);
			Usuario user = (Usuario) q.uniqueResult();
			user.setSenha(newPassord);
			getSession().update(user);
			return user;
		}
		return null;
	}
}