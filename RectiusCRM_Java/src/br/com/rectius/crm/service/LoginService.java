package br.com.rectius.crm.service;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.vo.Usuario;

@Repository
@RemotingDestination
public class LoginService extends AbstractService {
	
	@Transactional
	public Usuario login(String username, String passwd)
	{
		if (getSession().createQuery("from Usuario").list().isEmpty()) {
			
			Usuario u = new Usuario();
			u.setUsuario("admin");
			u.setSenha("admin");
			u.setNome("Administrador");
			u.setEmail("admin@rectius.com.br");
			
			return saveUser(u);

		} else {
			Query q = getSession().createQuery("from Usuario where usuario=:username and senha=:password");
			q.setParameter("username", username);
			q.setParameter("password", passwd);

			Usuario user = (Usuario) q.uniqueResult();
			
			if(user != null)
			{
				super.sendMessage("contactsMessaging", "login", "username", user);
				return user;
			}
		}

		return null;
	}
	
	@Transactional
	public Usuario saveUser(Usuario u)
	{
		try {
			getSession().save(u);
			return u;
		}catch (HibernateException e) {
			return null;
		}
	}
	
}
