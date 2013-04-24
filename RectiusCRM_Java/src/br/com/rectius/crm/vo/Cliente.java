package br.com.rectius.crm.vo;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Cliente {
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String razaoSocial;
	private String nome;
	@Column(unique=true)
	private String identificacao;
	private String email;
	@OneToMany(fetch=FetchType.EAGER)
	@Cascade({CascadeType.ALL})
	private Set<Telefone> telefones;
	@OneToMany(fetch=FetchType.EAGER)
	@Cascade({CascadeType.ALL})
	private Set<Endereco> enderecos;
	private String status;
	
	public void setId(Long id) {
		this.id = id;
	}
	public Long getId() {
		return id;
	}
	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}
	public String getRazaoSocial() {
		return razaoSocial;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNome() {
		return nome;
	}
	public void setIdentificacao(String identificacao) {
		this.identificacao = identificacao;
	}
	public String getIdentificacao() {
		return identificacao;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	public void setTelefones(Set<Telefone> telefones) {
		this.telefones = telefones;
	}
	public Set<Telefone> getTelefones() {
		return telefones;
	}
	public void setEnderecos(Set<Endereco> enderecos) {
		this.enderecos = enderecos;
	}
	public Set<Endereco> getEnderecos() {
		return enderecos;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}

}
