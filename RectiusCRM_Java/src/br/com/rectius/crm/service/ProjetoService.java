package br.com.rectius.crm.service;

import java.util.List;

import org.hibernate.HibernateException;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rectius.crm.utils.StringUtils;
import br.com.rectius.crm.vo.Grafico;
import br.com.rectius.crm.vo.Projeto;

@Repository
@RemotingDestination
public class ProjetoService extends AbstractService {
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Projeto> list() {
		return (List<Projeto>) getSession().createQuery("from Projeto order by inicio ASC").list();
	}
	
	@Transactional
	public List<Projeto> save(Projeto t)
	{
		try {
			getSession().save(t.getContrato());						
			String code = t.getTipo() + StringUtils.lpadS(t.getContrato().getId().toString(), "0", 7); 
			t.getContrato().setCodigo(code);			
			
		} catch (HibernateException e) {
			return null;
		}
				
		try {			
			getSession().save(t);
			return list();
		} catch (HibernateException e) {
			return null; 
		}
	}
	
	@Transactional
	public List<Projeto> update(Projeto t)
	{
		try {
			getSession().merge(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@Transactional
	public List<Projeto> remove(Projeto t)
	{
		try {
			getSession().delete(t);
			return list();
		} catch (HibernateException e) {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Grafico> listGraficoQuantidadePorStatus() {
		return (List<Grafico>) getSession().createSQLQuery("select count(1) AS quantidade, CASE status WHEN 'AG' THEN 'Aguardando' WHEN 'EA' THEN 'Em andamento' WHEN  'HL' THEN 'Homologando' WHEN 'FN' THEN 'Finalizado' END AS status from projeto group by status order by status").list();
	}

}