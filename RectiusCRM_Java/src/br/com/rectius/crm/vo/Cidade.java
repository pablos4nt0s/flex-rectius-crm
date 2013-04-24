package br.com.rectius.crm.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Cidade {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String nome;
	@ManyToOne
	private Estado uf;

	public void setId(Long id) {
		this.id = id;
	}
	public Long getId() {
		return id;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNome() {
		return nome;
	}
	public void setUf(Estado uf) {
		this.uf = uf;
	}
	public Estado getUf() {
		return uf;
	}
	
}
