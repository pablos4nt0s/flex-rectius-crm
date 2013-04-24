package br.com.rectius.crm.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Telefone {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private String numero;
	@OneToOne
	private TelefoneTipo tipo;
	@ManyToOne
	private Cliente cliente;

	public void setId(Long id) {
		this.id = id;
	}
	public Long getId() {
		return id;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getNumero() {
		return numero;
	}
	public void setTipoTelefone(TelefoneTipo tipoTelefone) {
		this.tipo = tipoTelefone;
	}
	public TelefoneTipo getTipoTelefone() {
		return tipo;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Cliente getCliente() {
		return cliente;
	}
}
