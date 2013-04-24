package br.com.rectius.crm.vo;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Parcelas {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	private Long numero;
	private BigDecimal valor;
	private String status; // P - pendente, B - baixada
	
	public void setId(Long id) {
		this.id = id;
	}
	public Long getId() {
		return id;
	}
	public void setNumero(Long numero) {
		this.numero = numero;
	}
	public Long getNumero() {
		return numero;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	public BigDecimal getValor() {
		return valor;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
	
}
