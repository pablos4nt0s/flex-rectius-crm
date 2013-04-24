package br.com.rectius.crm.vo;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Estado {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String sigla;
	private String nome;
	@OneToMany
	private Set<Cidade> cidades;
	@ManyToOne
	private Pais pais;

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
	public void setCidades(Set<Cidade> cidades) {
		this.cidades = cidades;
	}
	public Set<Cidade> getCidades() {
		return cidades;
	}
	public void setPais(Pais pais) {
		this.pais = pais;
	}
	public Pais getPais() {
		return pais;
	}
	
}
