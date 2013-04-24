package br.com.rectius.crm.vo;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Contrato {

	@Id @GeneratedValue(strategy=GenerationType.AUTO) 
	private Long id;
	private String codigo;
	private BigDecimal valor;	
//	@OneToMany(fetch=FetchType.EAGER)
//	@Cascade({CascadeType.SAVE_UPDATE, CascadeType.MERGE})
//	private List<Parcelas> parcelas;	
	private String status; // A - aberto, F - fechado	
	
	public void setId(Long id) {
		this.id = id;
	}
	public Long getId() {
		return id;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	public BigDecimal getValor() {
		return valor;
	}
//	public void setParcelas(List<Parcelas> parcelas) {
//		this.parcelas = parcelas;
//	}
//	public List<Parcelas> getParcelas() {
//		return parcelas;
//	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
//	public void setProjeto(Projeto projeto) {
//		this.projeto = projeto;
//	}
//	public Projeto getProjeto() {
//		return projeto;
//	}
}
