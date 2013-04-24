package br.com.rectius.crm.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Endereco {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@OneToOne
	private EnderecoTipo tipoEndereco; // residencial, comercial, correspondencia
	private String descricao;	
	private String complemento;
	private String cep;
	@ManyToOne
	private Cidade cidade;
	@ManyToOne
	private Cliente cliente;

	public void setId(Long id) {
		this.id = id;
	}
	public Long getId() {
		return id;
	}
	public void setTipoEndereco(EnderecoTipo tipoEndereco) {
		this.tipoEndereco = tipoEndereco;
	}
	public EnderecoTipo getTipoEndereco() {
		return tipoEndereco;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getCep() {
		return cep;
	}
	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}
	public Cidade getCidade() {
		return cidade;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Cliente getCliente() {
		return cliente;
	}
	
}
