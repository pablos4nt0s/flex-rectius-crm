package br.com.rectius.crm.vo;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Pais {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String sigla;
	private String nome;
	@OneToMany
	private Set<Estado> uf;

	public void setId(Long id) {
		this.id = id;
	}
	public Long getId() {
		return id;
	}
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	public String getSigla() {
		return sigla;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNome() {
		return nome;
	}
	public void setUf(Set<Estado> uf) {
		this.uf = uf;
	}
	public Set<Estado> getUf() {
		return uf;
	}
	
}
