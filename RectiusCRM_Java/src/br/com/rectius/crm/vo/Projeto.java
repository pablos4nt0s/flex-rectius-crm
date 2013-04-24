package br.com.rectius.crm.vo;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


@Entity
public class Projeto {

	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	@OneToOne(fetch=FetchType.EAGER)
	@Cascade({CascadeType.ALL})
	private Contrato contrato;
	private String tipo;
	private String nome;
	@OneToOne(fetch=FetchType.EAGER)
	@Cascade({CascadeType.ALL})
	private Cliente cliente;
	private Date inicio;
	private Date termino;
	private BigDecimal horasEstimadas;
	private BigDecimal horasRealizadas;
	private String status;
	
	public void setId(Long id) {
		this.id = id;
	}
	public Long getId() {
		return id;
	}
	public void setContrato(Contrato contrato) {
		this.contrato = contrato;
	}
	public Contrato getContrato() {
		return contrato;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getTipo() {
		return tipo;
	}
	//	public void setTipo(ProjetoTipo tipo) {
//		this.tipo = tipo;
//	}
//	public ProjetoTipo getTipo() {
//		return tipo;
//	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNome() {
		return nome;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Cliente getCliente() {
		return cliente;
	}
	//	public void setCliente(Cliente cliente) {
//		this.cliente = cliente;
//	}
//	public Cliente getCliente() {
//		return cliente;
//	}
	public void setInicio(Date inicio) {
		this.inicio = inicio;
	}
	public Date getInicio() {
		return inicio;
	}
	public void setTermino(Date termino) {
		this.termino = termino;
	}
	public Date getTermino() {
		return termino;
	}
	public void setHorasEstimadas(BigDecimal horasEstimadas) {
		this.horasEstimadas = horasEstimadas;
	}
	public BigDecimal getHorasEstimadas() {
		return horasEstimadas;
	}
	public void setHorasRealizadas(BigDecimal horasRealizadas) {
		this.horasRealizadas = horasRealizadas;
	}
	public BigDecimal getHorasRealizadas() {
		return horasRealizadas;
	}
//	public void setEquipe(List<Usuario> equipe) {
//		this.equipe = equipe;
//	}
//	public List<Usuario> getEquipe() {
//		return equipe;
//	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}

	
}
