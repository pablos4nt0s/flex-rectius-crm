package br.com.rectius.crm.vo;

import java.io.Serializable;

public class Grafico implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String mes;
	private String quantidade;
	private String status;
	private String nomeCliente;
	private String nomeProjeto;
	private String horasEstimadas;
	private String horasRealizadas;
	private String percentualAndamento;

	public void setMes(String mes) {
		this.mes = mes;
	}

	public String getMes() {
		return mes;
	}

	public void setQuantidade(String quantidade) {
		this.quantidade = quantidade;
	}

	public String getQuantidade() {
		return quantidade;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getStatus() {
		return status;
	}

	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}

	public String getNomeCliente() {
		return nomeCliente;
	}

	public void setNomeProjeto(String nomeProjeto) {
		this.nomeProjeto = nomeProjeto;
	}

	public String getNomeProjeto() {
		return nomeProjeto;
	}

	public void setHorasEstimadas(String horasEstimadas) {
		this.horasEstimadas = horasEstimadas;
	}

	public String getHorasEstimadas() {
		return horasEstimadas;
	}

	public void setHorasRealizadas(String horasRealizadas) {
		this.horasRealizadas = horasRealizadas;
	}

	public String getHorasRealizadas() {
		return horasRealizadas;
	}

	public void setPercentualAndamento(String percentualAndamento) {
		this.percentualAndamento = percentualAndamento;
	}

	public String getPercentualAndamento() {
		return percentualAndamento;
	}

}
